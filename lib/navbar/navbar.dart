import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:tracking/location/locationstate.dart';
import 'package:tracking/pages/dashboard.dart';
import 'package:tracking/pages/location.dart';
import 'package:tracking/pages/notification.dart';

class NavbarPage extends StatefulWidget {
  const NavbarPage({super.key});

  @override
  State<NavbarPage> createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  int currentIndex = 0;

  final List<Widget> _pages = [
    dashboard(),
    notification(),
    LocationTracker(),
    //LocationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu), 
              iconSize: 30,// Hamburger menu icon
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Text('Lo'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              // Display user's picture in a circular avatar
              backgroundImage: AssetImage('images/user.png'), // Replace with user's image URL
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('User Name'), // Replace with user's name
              accountEmail: Text('user@email.com'), // Replace with user's email
              currentAccountPicture: CircleAvatar(
                backgroundImage:AssetImage('images/user.png'), // Replace with user's image URL
              ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                // Handle the About action here
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle the Settings action here
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                // Handle the Logout action here
              },
            ),
          ],
        ),
      ),
      body: _pages[currentIndex],
      bottomNavigationBar: FluidNavBar(
        icons: [
          FluidNavBarIcon(
            icon: Icons.dashboard,
            extras: {"label": "Dashboard"},
          ),
          FluidNavBarIcon(
            icon: Icons.notifications,
            extras: {"label": "Notification"},
          ),
          FluidNavBarIcon(
            icon: Icons.location_on,
            extras: {"label": "Location"},
          ),
        ],
        onChange: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        style: FluidNavBarStyle(
          barBackgroundColor: Colors.blue[400],
          iconBackgroundColor: Colors.white,
          iconSelectedForegroundColor: Colors.deepOrange[400],
          iconUnselectedForegroundColor: Colors.black,
        ),
      ),
    );
  }
}
