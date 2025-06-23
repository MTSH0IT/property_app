import 'package:property_app/core/entites/property_entity.dart';

abstract class PropertyRepo {
  Future<List<PropertyEntity>> getProperties();
  Future<void> addProperty(PropertyEntity property);
  Future<void> addPropertytToFavority(Map<String, dynamic> data);
  Future<bool> isFavoriteExists(Map<String, dynamic> data);
  Future<void> removePropertyToFavorite(Map<String, dynamic> data);
  Future<List<PropertyEntity>> getPropertiesFavorite(String userId);
}
