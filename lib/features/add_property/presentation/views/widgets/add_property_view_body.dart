import 'dart:io';

import 'package:flutter/material.dart';

import 'package:property_app/core/widgets/custom_text_form_field.dart';
import 'package:property_app/features/add_property/data/service/feature_managment.dart';
import 'package:property_app/features/add_property/presentation/views/widgets/custom_text_field.dart';
import 'package:property_app/features/add_property/presentation/views/widgets/grid_view_features.dart';
import 'package:image_picker/image_picker.dart';

class AddPropertyViewBody extends StatefulWidget {
  const AddPropertyViewBody({super.key});

  @override
  State<AddPropertyViewBody> createState() => _AddPropertyViewBodyState();
}

class _AddPropertyViewBodyState extends State<AddPropertyViewBody> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _items = [];
  final List<File> _images = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFormField(
              hintText: "عنوان قصير ",
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: "ادخل السعر",
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: "ادخل المدينة",
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: "ادخل الحي",
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: "ادخل عدد الغرف",
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: "ادخل عدد غرف النوم",
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: "ادخل عدد الحمامات",
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: "ادخل رقم الطابق",
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: "ادخل المساحة",
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: "ادخل الوصف",
              textInputType: TextInputType.multiline,
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _controller,
              title: "ادخل الميزات",
              onPressed: () {
                setState(() {
                  FeatureManagment.addItem(_items, _controller);
                });
              },
            ),
            SizedBox(height: 20),
            if (_items.isNotEmpty) GridViewFeatures(items: _items),
            const SizedBox(height: 16),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () async {
                  final List<XFile>? images = await ImagePicker()
                      .pickMultiImage(imageQuality: 70);
                  if (images != null) {
                    for (var element in images) {
                      setState(() {
                        _images.add(File(element.path));
                      });
                    }
                  }
                },
                child: const Text("اضافة الصور من المعرض"),
              ),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(_images[index].path),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _images.removeAt(index);
                          });
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, child: Text("نشر")),
          ],
        ),
      ),
    );
  }
}
