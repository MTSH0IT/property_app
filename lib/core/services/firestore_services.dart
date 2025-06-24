import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:property_app/core/services/database_service.dart';
import 'package:property_app/core/utils/custom_exception.dart';
import 'package:property_app/core/models/filter_model.dart';

class FirestoreServices implements DatabaseService {
  static final firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    try {
      if (documentId != null) {
        await firestore.collection(path).doc(documentId).set(data);
      } else {
        final docRef = firestore.collection(path).doc();
        String id = docRef.id;
        data['id'] = id;
        await docRef.set(data);
      }
    } catch (e) {
      log(
        "Exception : FirestoreServices.addData ====> error :${e.toString()} ",
      );
      throw CustomException(message: "حدث خطاء يرجا المحاولة لاحقا");
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    try {
      if (documentId != null) {
        var data = await firestore.collection(path).doc(documentId).get();
        return data.data()!;
      } else {
        Query<Map<String, dynamic>> data = firestore.collection(path);
        if (query != null) {
          if (query['orderby'] != null) {
            var orderby = query['orderby'];
            var descending = query['descending'];

            data = data.orderBy(orderby, descending: descending);
          }
          if (query['limit'] != null) {
            var limit = query['limit'];
            data = data.limit(limit);
          }
        }
        var result = await data.get();
        return result.docs.map((e) => e.data()).toList();
      }
    } catch (e) {
      log(
        "Exception : FirestoreServices.getUserData ====> error :${e.toString()} ",
      );
      throw CustomException(message: "حدث خطاء يرجا المحاولة لاحقا");
    }
  }

  Future<dynamic> getFilteredData({
    required String path,
    required FilterModel filter,
  }) async {
    try {
      Query<Map<String, dynamic>> query = firestore.collection(path);

      // تطبيق الفلاتر
      if (filter.type != null && filter.type!.isNotEmpty) {
        query = query.where('type', isEqualTo: filter.type);
      }

      if (filter.city != null && filter.city!.isNotEmpty) {
        query = query.where('city', isEqualTo: filter.city);
      }

      if (filter.minPrice != null) {
        query = query.where('price', isGreaterThanOrEqualTo: filter.minPrice);
      }

      if (filter.maxPrice != null) {
        query = query.where('price', isLessThanOrEqualTo: filter.maxPrice);
      }

      if (filter.minRooms != null) {
        query = query.where('rooms', isGreaterThanOrEqualTo: filter.minRooms);
      }

      if (filter.minBedrooms != null) {
        query = query.where(
          'bedrooms',
          isGreaterThanOrEqualTo: filter.minBedrooms,
        );
      }

      if (filter.minBathrooms != null) {
        query = query.where(
          'bathrooms',
          isGreaterThanOrEqualTo: filter.minBathrooms,
        );
      }

      if (filter.minArea != null) {
        query = query.where('area', isGreaterThanOrEqualTo: filter.minArea);
      }

      if (filter.maxArea != null) {
        query = query.where('area', isLessThanOrEqualTo: filter.maxArea);
      }

      // إضافة الترتيب حسب التاريخ (الأحدث أولاً)
      query = query.orderBy('createdAt', descending: true);

      var result = await query.get();
      return result.docs.map((e) => e.data()).toList();
    } catch (e) {
      log(
        "Exception : FirestoreServices.getFilteredData ====> error :${e.toString()} ",
      );
      throw CustomException(message: "حدث خطاء في فلترة العقارات");
    }
  }

  Future<List<Map<String, dynamic>>> getDataExists(
    String path,
    Map<String, dynamic> query,
  ) async {
    try {
      CollectionReference collection = FirebaseFirestore.instance.collection(
        path,
      );
      Query finalQuery = collection;

      query.forEach((key, value) {
        finalQuery = finalQuery.where(key, isEqualTo: value);
      });

      final querySnapshot = await finalQuery.get();

      return querySnapshot.docs
          .map((e) => e.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      log(
        "Exception : FirestoreServices.getDataExists ====> error :${e.toString()}",
      );
      throw CustomException(message: "حدث خطاء يرجا المحاولة لاحقا");
    }
  }

  Future<void> removeDataExists(String path, Map<String, dynamic> query) async {
    try {
      CollectionReference collection = FirebaseFirestore.instance.collection(
        path,
      );
      Query finalQuery = collection;

      query.forEach((key, value) {
        finalQuery = finalQuery.where(key, isEqualTo: value);
      });

      final querySnapshot = await finalQuery.get();

      for (var doc in querySnapshot.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      log(
        "Exception : FirestoreServices.removeDataExists ====> error :${e.toString()}",
      );
      throw CustomException(message: "حدث خطاء يرجا المحاولة لاحقا");
    }
  }

  Future<List<Map<String, dynamic>>> getDataWhereIn(
    String path,
    String field,
    List<dynamic> values,
  ) async {
    try {
      CollectionReference collection = FirebaseFirestore.instance.collection(
        path,
      );

      final querySnapshot =
          await collection.where(field, whereIn: values).get();

      return querySnapshot.docs
          .map((e) => e.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      log(
        "Exception : FirestoreServices.getDataWhereIn ====> error :${e.toString()}",
      );
      throw CustomException(message: "حدث خطاء يرجا المحاولة لاحقا");
    }
  }

  @override
  Future<bool> dataExists({
    required String path,
    required String documentId,
  }) async {
    var doc = await firestore.collection(path).doc(documentId).get();
    return doc.exists;
  }
}
