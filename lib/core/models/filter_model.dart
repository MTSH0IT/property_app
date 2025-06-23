import 'package:property_app/core/entites/filter_entity.dart';

class FilterModel {
  final String? type;
  final int? minPrice;
  final int? maxPrice;
  final String? city;
  final int? minRooms;
  final int? minBedrooms;
  final int? minBathrooms;
  final int? minArea;
  final int? maxArea;

  FilterModel({
    this.type,
    this.minPrice,
    this.maxPrice,
    this.city,
    this.minRooms,
    this.minBedrooms,
    this.minBathrooms,
    this.minArea,
    this.maxArea,
  });

  factory FilterModel.fromEntity(FilterEntity entity) {
    return FilterModel(
      type: entity.type,
      minPrice: entity.minPrice,
      maxPrice: entity.maxPrice,
      city: entity.city,
      minRooms: entity.minRooms,
      minBedrooms: entity.minBedrooms,
      minBathrooms: entity.minBathrooms,
      minArea: entity.minArea,
      maxArea: entity.maxArea,
    );
  }

  FilterEntity toEntity() {
    return FilterEntity(
      type: type,
      minPrice: minPrice,
      maxPrice: maxPrice,
      city: city,
      minRooms: minRooms,
      minBedrooms: minBedrooms,
      minBathrooms: minBathrooms,
      minArea: minArea,
      maxArea: maxArea,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'city': city,
      'minRooms': minRooms,
      'minBedrooms': minBedrooms,
      'minBathrooms': minBathrooms,
      'minArea': minArea,
      'maxArea': maxArea,
    };
  }

  factory FilterModel.fromJson(Map<String, dynamic> json) {
    return FilterModel(
      type: json['type'],
      minPrice: json['minPrice'],
      maxPrice: json['maxPrice'],
      city: json['city'],
      minRooms: json['minRooms'],
      minBedrooms: json['minBedrooms'],
      minBathrooms: json['minBathrooms'],
      minArea: json['minArea'],
      maxArea: json['maxArea'],
    );
  }
}
