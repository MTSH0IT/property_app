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
  final List<String>? features;
  final List<File>? images;
  final List<String>? imagesUrl;
  final String? propertyId;
  final DateTime? createdAt;

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
    this.features,
    this.images,
    this.imagesUrl,
    this.propertyId,
    this.createdAt,
  });

  factory PropertyEntity.skeleton() {
    return PropertyEntity(
      title: '',
      type: '',
      price: 0,
      city: '',
      county: '',
      description: '',
      rooms: 0,
      bedrooms: 0,
      bathrooms: 0,
      floor: 0,
      area: 0,
      latitude: 0.0,
      longitude: 0.0,
      features: const [],
      images: const [],
      imagesUrl: const [],
      propertyId: '',
      createdAt: null,
    );
  }
  static List<PropertyEntity> proprtySkeleton = [
    PropertyEntity.skeleton(),
    PropertyEntity.skeleton(),
    PropertyEntity.skeleton(),
    PropertyEntity.skeleton(),
  ];
}
