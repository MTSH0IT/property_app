import 'package:property_app/core/entites/property_entity.dart';

abstract class PropertyRepo {
  Future<List<PropertyEntity>> getProperties();
  Future<void> addProperty(PropertyEntity property);
  //Future<void> updateProperty(PropertyEntity property);
  //Future<void> deleteProperty(String id);
}
