import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';

class LocationTracker extends StatefulWidget {
  @override
  _LocationTrackerState createState() => _LocationTrackerState();
}

class _LocationTrackerState extends State<LocationTracker> {
  final firestore = FirebaseFirestore.instance;
  double latitude = 0.0;
  double longitude = 0.0;
  String currentTime = "";
  late Timer _locationUpdateTimer;

  @override
  void initState() {
    super.initState();
    startTrackingLocation();
    requestPermission();
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _locationUpdateTimer.cancel();
    super.dispose();
  }

  Future<void> startTrackingLocation() async {
    _locationUpdateTimer = Timer.periodic(Duration(seconds: 30), (timer) async {
      Position position = await Geolocator.getCurrentPosition();
      DateTime currentTimestamp = DateTime.now();
      await firestore.collection('locations').add({
        'latitude': position.latitude,
        'longitude': position.longitude,
        'timestamp': currentTimestamp,
      });
      print('Position:$position');
      setState(() {
        latitude = position.latitude.toDouble();
        longitude = position.longitude.toDouble();
        currentTime = currentTimestamp.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(latitude, longitude),
          zoom: 15.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate:
                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 40.0,
                height: 40.0,
                point: LatLng(latitude, longitude),
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 40.0,
                  ),
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }

  requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('Location permission granted.');
    } else if (status.isDenied) {
      requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}
