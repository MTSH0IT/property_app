import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:property_app/core/services/position_service.dart';

class MapViewBody extends StatefulWidget {
  const MapViewBody({super.key});

  @override
  State<MapViewBody> createState() => _MapViewBodyState();
}

class _MapViewBodyState extends State<MapViewBody> {
  Future<void> getCurrentLocation() async {
    final location = await PositionService().determinePosition(context);
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
