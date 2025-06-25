import 'dart:io';
import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as path;

class SupabaseStorageService {
  static final SupabaseClient _supabase = Supabase.instance.client;

  Future<List<String>> uploadImages({
    required List<File> images,
    String folderPath = 'property-images',
    String? fileNamePrefix,
  }) async {
    try {
      List<String> uploadedUrls = [];

      for (int i = 0; i < images.length; i++) {
        File imageFile = images[i];

        // إنشاء اسم فريد للملف
        String fileName = generateFileName(
          originalName: path.basename(imageFile.path),
          prefix: fileNamePrefix,
          index: i,
        );

        // مسار الملف في Storage
        String filePath = '$folderPath/$fileName';

        // قراءة بيانات الملف
        Uint8List fileBytes = await imageFile.readAsBytes();

        // رفع الملف إلى Supabase Storage
        await _supabase.storage
            .from(folderPath) // اسم bucket في Supabase
            .uploadBinary(filePath, fileBytes);

        // الحصول على URL العام للملف
        String publicUrl = _supabase.storage
            .from(folderPath)
            .getPublicUrl(filePath);

        uploadedUrls.add(publicUrl);
      }

      return uploadedUrls;
    } catch (e) {
      throw Exception('فشل في رفع الصور: $e');
    }
  }

  Future<void> deleteImage({
    required String imageUrl,
    String folderPath = 'properties',
  }) async {
    try {
      // استخراج اسم الملف من URL
      String fileName = extractFileNameFromUrl(imageUrl);
      String filePath = '$folderPath/$fileName';

      // حذف الملف من Supabase Storage
      await _supabase.storage.from('images').remove([filePath]);
    } catch (e) {
      throw Exception('فشل في حذف الصورة: $e');
    }
  }

  Future<void> deleteImages({
    required List<String> imageUrls,
    String folderPath = 'property-images',
  }) async {
    try {
      List<String> filePaths = [];

      for (String imageUrl in imageUrls) {
        String fileName = extractFileNameFromUrl(imageUrl);
        String filePath = '$folderPath/$fileName';
        filePaths.add(filePath);
      }

      // حذف الملفات من Supabase Storage
      await _supabase.storage.from('property-images').remove(filePaths);
    } catch (e) {
      throw Exception('فشل في حذف الصور: $e');
    }
  }

  /// إنشاء اسم فريد للملف
  String generateFileName({
    required String originalName,
    String? prefix,
    int? index,
  }) {
    String extension = path.extension(originalName);
    String nameWithoutExtension = path.basenameWithoutExtension(originalName);

    // إضافة timestamp لضمان التفرد
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();

    String fileName = '';
    if (prefix != null) {
      fileName += '${prefix}_';
    }
    fileName += '${nameWithoutExtension}_$timestamp';

    if (index != null) {
      fileName += '_$index';
    }

    fileName += extension;

    return fileName;
  }

  /// استخراج اسم الملف من URL
  String extractFileNameFromUrl(String imageUrl) {
    try {
      Uri uri = Uri.parse(imageUrl);
      String path = uri.path;
      return path.split('/').last;
    } catch (e) {
      throw Exception('URL غير صحيح: $imageUrl');
    }
  }
}
