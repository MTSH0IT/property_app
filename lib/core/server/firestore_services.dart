import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:property_app/core/server/database_service.dart';
import 'package:property_app/core/utils/custom_exception.dart';

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
        await firestore.collection(path).add(data);
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

  @override
  Future<bool> dataExists({
    required String path,
    required String documentId,
  }) async {
    var doc = await firestore.collection(path).doc(documentId).get();
    return doc.exists;
  }
}
