import 'dart:developer';

import 'package:property_app/core/entites/property_entity.dart';
import 'package:property_app/core/entites/filter_entity.dart';

import 'package:property_app/core/models/property_model.dart';
import 'package:property_app/core/models/filter_model.dart';
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
      final properties = await firestore.getData(
        path: 'property',
        query: {
          'orderby': 'createdAt',
          'descending': true, // الأحدث أولاً
        },
      );

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

  @override
  Future<List<PropertyEntity>> filterProperties(FilterEntity filter) async {
    try {
      final properties = await firestore.getFilteredData(
        path: 'property',
        filter: FilterModel.fromEntity(filter),
      );

      List<PropertyModel> propertyModels =
          (properties as List).map((e) => PropertyModel.fromJson(e)).toList();
      List<PropertyEntity> propertyEntities =
          propertyModels.map((e) => e.toEntity(e)).toList();

      return propertyEntities;
    } catch (e) {
      log("error: ${e.toString()}");
      throw CustomException(message: "Failed to filter properties");
    }
  }

  @override
  Future<bool> isFavoriteExists(Map<String, dynamic> data) async {
    List favorit = await firestore.getDataExists('favorite', data);
    bool isFavorit = favorit.isNotEmpty;
    return isFavorit;
  }

  @override
  Future<void> addPropertytToFavority(Map<String, dynamic> data) async {
    try {
      await firestore.addData(path: "favorite", data: data);
    } catch (e) {
      log(e.toString());
      throw CustomException(message: "Failed to add properties to favority");
    }
  }

  @override
  Future<void> removePropertyToFavorite(Map<String, dynamic> data) async {
    try {
      await firestore.removeDataExists("favorite", data);
    } catch (e) {
      log(e.toString());
      throw CustomException(
        message: "Failed to delete property from favorites",
      );
    }
  }

  @override
  Future<List<PropertyEntity>> getPropertiesFavorite(String userId) async {
    try {
      final propertiesF = await firestore.getDataExists('favorite', {
        'userId': userId,
      });
      for (var element in propertiesF) {
        log("element: ${element.toString()}");
      }
      if (propertiesF.isEmpty) {
        return [];
      } else {
        List<String> propertyIds =
            propertiesF.map((e) => e['propertyId'].toString()).toList();

        final properties = await firestore.getDataWhereIn(
          'property',
          'id',
          propertyIds,
        );

        List<PropertyModel> propertyModels =
            (properties as List).map((e) => PropertyModel.fromJson(e)).toList();
        List<PropertyEntity> propertyEntities =
            propertyModels.map((e) => e.toEntity(e)).toList();

        return propertyEntities;
      }
    } catch (e) {
      log("error: ${e.toString()}");
      throw CustomException(message: "Failed to get favorite properties");
    }
  }
}
