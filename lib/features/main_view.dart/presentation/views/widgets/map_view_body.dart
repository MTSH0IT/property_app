import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MapViewBody extends StatefulWidget {
  const MapViewBody({super.key});

  @override
  State<MapViewBody> createState() => _MapViewBodyState();
}

class _MapViewBodyState extends State<MapViewBody> {
  Future<dynamic> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await showDialogLocation(
        "Location services are disabled",
        "Please enable location services in your device settings to determine your location.",
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showDialogLocation(
          "Location permissions are denied",
          "Please enable location permissions in your device settings to determine your location.",
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      showDialogLocation(
        "Location permissions are denied forever",
        "Please enable location permissions in your device settings to determine your location.",
      );
    }
    if (serviceEnabled) {
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        Position position = await Geolocator.getCurrentPosition();
        log("latitude : ${position.latitude}");
        log("longitude : ${position.longitude}");
        return position;
      }
    }
  }

  Future<void> showDialogLocation(String title, String content) {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    _determinePosition();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
