// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// class LocationPage extends StatelessWidget {
//   final double latitude;
//   final double longitude;

//   LocationPage({required this.latitude, required this.longitude});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Location')),
//       body: FlutterMap(
//         options: MapOptions(
//           center: LatLng(latitude, longitude),
//           zoom: 15.0,
//         ),
//         layers: [
//           TileLayerOptions(
//             urlTemplate:
//                 "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//             subdomains: ['a', 'b', 'c'],
//           ),
//           MarkerLayerOptions(
//             markers: [
//               Marker(
//                 width: 40.0,
//                 height: 40.0,
//                 point: LatLng(latitude, longitude),
//                 builder: (ctx) => Container(
//                   child: Icon(
//                     Icons.location_on,
//                     color: Colors.red,
//                     size: 40.0,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
