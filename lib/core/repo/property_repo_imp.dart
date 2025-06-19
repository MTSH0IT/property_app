import 'dart:developer';

import 'package:property_app/core/entites/property_entity.dart';
import 'package:property_app/core/models/property_model.dart';
import 'package:property_app/core/repo/property_repo.dart';
import 'package:property_app/core/services/firestore_services.dart';
import 'package:property_app/core/utils/custom_exception.dart';

class PropertyRepoImp extends PropertyRepo {
  FirestoreServices firestore = FirestoreServices();
  @override
  Future<void> addProperty(PropertyEntity property) async {
    try {
      await firestore.addData(
        path: 'property',
        data: PropertyModel.fromEntity(property).toJson(),
      );
    } catch (e) {
      log(e.toString());
      throw CustomException(message: "Failed to add property");
    }
  }

  @override
  Future<List<PropertyEntity>> getProperties() async {
    try {
      final properties = await firestore.getData(path: 'property');

      List<PropertyModel> propertyModels =
          (properties as List).map((e) => PropertyModel.fromJson(e)).toList();
      List<PropertyEntity> propertyEntities =
          propertyModels.map((e) => e.toEntity(e)).toList();

      return propertyEntities;
    } catch (e) {
      log("error: ${e.toString()}");
      throw CustomException(message: "Failed to get properties");
    }
  }
}
