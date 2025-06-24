import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:property_app/core/entites/property_entity.dart';
import 'package:property_app/core/services/position_service.dart';
import 'package:property_app/features/property_details/presentation/views/property_details_view.dart';

class MapViewBody extends StatefulWidget {
  final List<PropertyEntity> properties;
  const MapViewBody({super.key, required this.properties});

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

  void _showPropertyDetails(PropertyEntity property) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            property.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('النوع: ${property.type}'),
              const SizedBox(height: 4),
              Text(
                'السعر: ${property.price.toStringAsFixed(0)} '
                r'$',
              ),
              const SizedBox(height: 4),
              Text('المدينة: ${property.city}'),
              const SizedBox(height: 4),
              Text('الغرف: ${property.rooms}'),
              const SizedBox(height: 4),
              Text('المساحة: ${property.area} متر مربع'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('إغلاق'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  PropertyDetailsView.routeName,
                  arguments: property,
                );
              },
              child: const Text('عرض التفاصيل'),
            ),
          ],
        );
      },
    );
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
            ...widget.properties
                .where(
                  (property) =>
                      property.latitude != 0 && property.longitude != 0,
                )
                .map((property) => buildMarker(property)),
          ],
        ),
      ],
    );
  }

  Marker buildMarker(PropertyEntity property) {
    return Marker(
      point: LatLng(property.latitude, property.longitude),
      width: 80,
      height: 80,
      rotate: true,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => _showPropertyDetails(property),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                '${property.price.toStringAsFixed(0)} '
                r'$',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(Icons.home, color: Colors.white, size: 24),
            ),
          ],
        ),
      ),
    );
  }
}
