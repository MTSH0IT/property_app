//import 'dart:io';

import 'package:property_app/features/add_property/domain/entites/property_entity.dart';

class PropertyModel {
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
  //final List<File> image;

  PropertyModel({
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
    //required this.image,
  });

  factory PropertyModel.fromEntity(PropertyEntity entity) {
    return PropertyModel(
      title: entity.title,
      type: entity.type,
      price: entity.price,
      city: entity.city,
      county: entity.county,
      description: entity.description,
      rooms: entity.rooms,
      bedrooms: entity.bedrooms,
      bathrooms: entity.bathrooms,
      floor: entity.floor,
      area: entity.area,
      latitude: entity.latitude,
      longitude: entity.longitude,
      features: entity.features,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'type': type,
      'price': price,
      'city': city,
      'county': county,
      'description': description,
      'rooms': rooms,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'floor': floor,
      'area': area,
      'latitude': latitude,
      'longitude': longitude,
      'features': features,
    };
  }
}
