import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PositionService {
  Future<dynamic> determinePosition(BuildContext context) async {
    // if (!mounted) return null;

    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // if (!mounted) return null;
      await showDialogLocation(
        "Location services are disabled",
        "Please enable location services in your device settings to determine your location.",
        context,
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // if (!mounted) return null;
        showDialogLocation(
          "Location permissions are denied",
          "Please enable location permissions in your device settings to determine your location.",
          context,
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      //if (!mounted) return null;
      showDialogLocation(
        "Location permissions are denied forever",
        "Please enable location permissions in your device settings to determine your location.",
        context,
      );
    }
    if (serviceEnabled) {
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        Position position = await Geolocator.getCurrentPosition();
        // if (!mounted) return null;

        return position;
      }
    }
    return null;
  }

  Future<void> showDialogLocation(
    String title,
    String content,
    BuildContext context,
  ) {
    //if (!mounted) return Future.value();
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
}
