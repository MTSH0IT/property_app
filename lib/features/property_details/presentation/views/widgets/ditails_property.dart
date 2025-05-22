import 'package:flutter/material.dart';
import 'package:property_app/features/property_details/presentation/views/widgets/ditails_feature_item.dart';

class DitailsProperty extends StatelessWidget {
  const DitailsProperty({
    super.key,
    required this.rooms,
    required this.bedrooms,
    required this.bathrooms,
    required this.floor,
    required this.area,
  });
  final int rooms;
  final int bedrooms;
  final int bathrooms;
  final int floor;
  final int area;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DitailsFeatureItem(
          icon: Icons.door_front_door_outlined,
          value: rooms.toString(),
          label: 'الغرف',
        ),
        const SizedBox(width: 16),
        DitailsFeatureItem(
          icon: Icons.bed_outlined,
          value: bedrooms.toString(),
          label: 'غرف النوم',
        ),
        const SizedBox(width: 16),
        DitailsFeatureItem(
          icon: Icons.bathtub_outlined,
          value: bathrooms.toString(),
          label: 'الحمامات',
        ),
        const SizedBox(width: 16),
        DitailsFeatureItem(
          icon: Icons.domain_rounded,
          value: floor.toString(),
          label: 'الطابق',
        ),
        const SizedBox(width: 16),
        DitailsFeatureItem(
          icon: Icons.square_foot,
          value: area.toString(),
          label: 'متر مربع',
        ),
      ],
    );
  }
}
