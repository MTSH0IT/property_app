import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapViewBody extends StatefulWidget {
  const MapViewBody({super.key});

  @override
  State<MapViewBody> createState() => _MapViewBodyState();
}

class _MapViewBodyState extends State<MapViewBody> {
  Future<dynamic> determinePosition() async {
    if (!mounted) return null;

    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (!mounted) return null;
      await showDialogLocation(
        "Location services are disabled",
        "Please enable location services in your device settings to determine your location.",
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (!mounted) return null;
        showDialogLocation(
          "Location permissions are denied",
          "Please enable location permissions in your device settings to determine your location.",
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (!mounted) return null;
      showDialogLocation(
        "Location permissions are denied forever",
        "Please enable location permissions in your device settings to determine your location.",
      );
    }
    if (serviceEnabled) {
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        Position position = await Geolocator.getCurrentPosition();
        if (!mounted) return null;
        log("latitude : ${position.latitude}");
        log("longitude : ${position.longitude}");
        return position;
      }
    }
    return null;
  }

  Future<void> showDialogLocation(String title, String content) {
    if (!mounted) return Future.value();
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

  Future<void> getCurrentLocation() async {
    final location = await determinePosition();
    if (mounted) {
      setState(() {
        position = location;
      });
    }
  }

  Position? position;
  @override
  late bool mounted;
  @override
  void initState() {
    super.initState();
    mounted = true;
    getCurrentLocation();
  }

  @override
  void dispose() {
    mounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (position == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(position!.latitude, position!.longitude),
        initialZoom: 15,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.property_app',
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(position!.latitude, position!.longitude),
              width: 80,
              height: 80,
              child: const Icon(Icons.location_on, color: Colors.red, size: 40),
            ),
          ],
        ),
      ],
    );
  }
}
