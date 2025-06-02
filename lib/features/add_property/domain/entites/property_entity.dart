import 'dart:io';

class PropertyEntity {
  final String title;
  final String type;
  final int price;
  final String city;
  final String county;
  final String description;
  final int rooms;
  final int bedrooms;
  final int bathrooms;
  final int floor;
  final int area;
  final double latitude;
  final double longitude;
  final List<String> features;
  final List<File> image;

  PropertyEntity({
    required this.title,
    required this.type,
    required this.price,
    required this.city,
    required this.county,
    required this.description,
    required this.rooms,
    required this.bedrooms,
    required this.bathrooms,
    required this.floor,
    required this.area,
    required this.latitude,
    required this.longitude,
    required this.features,
    required this.image,
  });
}
