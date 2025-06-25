class FilterEntity {
  final String? type;
  final int? minPrice;
  final int? maxPrice;
  final String? city;
  final int? minRooms;
  final int? minBedrooms;
  final int? minArea;
  final int? maxArea;

  FilterEntity({
    this.type,
    this.minPrice,
    this.maxPrice,
    this.city,
    this.minRooms,
    this.minBedrooms,
    this.minArea,
    this.maxArea,
  });

  @override
  String toString() {
    return 'FilterEntity(type: '
        '	$type, minPrice: $minPrice, maxPrice: $maxPrice, city: $city, minRooms: $minRooms, minBedrooms: $minBedrooms, minArea: $minArea, maxArea: $maxArea)';
  }
}
