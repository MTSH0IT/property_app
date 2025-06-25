import 'dart:developer';
import 'dart:io';
import 'package:property_app/core/repo/storage_repo.dart';
import 'package:property_app/core/services/supabese_storge.dart';
import 'package:property_app/core/utils/custom_exception.dart';

class StorageRepoImp implements StorageRepo {
  SupabaseStorageService supabase = SupabaseStorageService();
  @override
  Future<List<String>> uploadImages(List<File> file, String path) async {
    try {
      List<String> url = await supabase.uploadImages(
        images: file,
        folderPath: path,
      );
      return url;
    } catch (e) {
      log("StorageRepoImp.uploadImages");
      throw CustomException(message: "حدث خطأ في رفع الصور");
    }
  }
}
