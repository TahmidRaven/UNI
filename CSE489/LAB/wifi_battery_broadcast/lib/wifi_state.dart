import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class WifiStatePage extends StatefulWidget {
  @override
  _WifiStatePageState createState() => _WifiStatePageState();
}

class _WifiStatePageState extends State<WifiStatePage> {
  late StreamSubscription<ConnectivityResult> subscription;
  String wifiState = 'Loading...';

  @override
  void initState() {
    super.initState();
    _getWifiState();
    // Subscribe to connectivity changes
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _updateWifiState(result);
    });
  }

  @override
  void dispose() {
    // Cancel the subscription to avoid memory leaks
    subscription.cancel();
    super.dispose();
  }

  Future<void> _getWifiState() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    _updateWifiState(connectivityResult);
  }

  void _updateWifiState(ConnectivityResult result) {
    setState(() {
      if (result == ConnectivityResult.wifi) {
        wifiState = 'WiFi is ON';
      } else {
        wifiState = 'WiFi is OFF';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey, // Same background color as home page
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 60,
        foregroundColor: const Color(0xFFFFFFFF),
        backgroundColor: Colors.transparent,
        elevation: 4.0,
        title: Text('WiFi State'),
        centerTitle: true,
        flexibleSpace: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey[900],
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CURRENT WIFI STATE:',
              style: TextStyle(
                fontSize: 16,  
                color: Colors.white,  
                fontWeight: FontWeight.bold,  
              ),
            ),
            Text(
              wifiState,
              style: TextStyle(
                fontSize: 28,  
                color: Colors.white,  
                fontWeight: FontWeight.bold,  
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 70,
        color: Colors.blueGrey[900],
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Will work on home button press
              },
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                // Will work on favorite button press
              },
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Will work on settings button press
              },
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
