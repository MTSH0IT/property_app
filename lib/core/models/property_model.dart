import 'package:property_app/core/entites/property_entity.dart';

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
  final List<String> imagesUrl;
  String? propertyId;

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
    required this.imagesUrl,
    this.propertyId,
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
      features: entity.features ?? [],
      imagesUrl: entity.imagesUrl ?? [],
    );
  }

  PropertyEntity toEntity(PropertyModel model) {
    return PropertyEntity(
      title: model.title,
      type: model.type,
      price: model.price,
      city: model.city,
      county: model.county,
      description: model.description,
      rooms: model.rooms,
      bedrooms: model.bedrooms,
      bathrooms: model.bathrooms,
      floor: model.floor,
      area: model.area,
      latitude: model.latitude,
      longitude: model.longitude,
      features: model.features,
      imagesUrl: model.imagesUrl,
      propertyId: model.propertyId,
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
      'imagesUrl': imagesUrl,
    };
  }

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      title: json['title'],
      type: json['type'],
      price: json['price'],
      city: json['city'],
      county: json['county'],
      description: json['description'],
      rooms: json['rooms'],
      bedrooms: json['bedrooms'],
      bathrooms: json['bathrooms'],
      floor: json['floor'],
      area: json['area'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      features: List<String>.from(json['features']),
      imagesUrl: List<String>.from(json['imagesUrl']),
      propertyId: json['id'],
    );
  }
}
