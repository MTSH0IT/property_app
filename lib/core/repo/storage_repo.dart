import 'dart:io';

abstract class StorageRepo {
  Future<List<String>> uploadImages(List<File> file, String path);
}
