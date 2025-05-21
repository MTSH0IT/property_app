import 'dart:io';

import 'package:flutter/material.dart';

import 'package:property_app/core/widgets/custom_text_form_field.dart';
import 'package:property_app/features/add_property/data/service/feature_managment.dart';
import 'package:property_app/features/add_property/domain/entites/property_entity.dart';
import 'package:property_app/features/add_property/presentation/views/widgets/custom_text_field.dart';
import 'package:property_app/features/add_property/presentation/views/widgets/grid_view_features.dart';
import 'package:image_picker/image_picker.dart';

class AddPropertyViewBody extends StatefulWidget {
  const AddPropertyViewBody({super.key});

  @override
  State<AddPropertyViewBody> createState() => _AddPropertyViewBodyState();
}

class _AddPropertyViewBodyState extends State<AddPropertyViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController _controller = TextEditingController();
  List<String> listItems = [];
  List<File> listImages = [];
  late String selectedType;
  late String title;
  late int price;
  late String city;
  late String county;
  late int rooms;
  late int bedrooms;
  late int bathrooms;
  late int floor;
  late int area;
  late String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              TypeProperty(
                onChanged: (value) {
                  selectedType = value;
                },
              ),
              const SizedBox(height: 24),
              CustomTextFormField(
                hintText: "عنوان قصير ",
                textInputType: TextInputType.text,
                onSaved: (p0) {
                  title = p0!;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: "ادخل السعر",
                textInputType: TextInputType.number,
                onSaved: (p0) {
                  price = int.parse(p0!);
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: "ادخل المدينة",
                textInputType: TextInputType.text,
                onSaved: (p0) {
                  city = p0!;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: "ادخل الحي",
                textInputType: TextInputType.text,
                onSaved: (p0) {
                  county = p0!;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: "ادخل عدد الغرف",
                textInputType: TextInputType.number,
                onSaved: (p0) {
                  rooms = int.parse(p0!);
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: "ادخل عدد غرف النوم",
                textInputType: TextInputType.number,
                onSaved: (p0) {
                  bedrooms = int.parse(p0!);
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: "ادخل عدد الحمامات",
                textInputType: TextInputType.number,
                onSaved: (p0) {
                  bathrooms = int.parse(p0!);
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: "ادخل رقم الطابق",
                textInputType: TextInputType.number,
                onSaved: (p0) {
                  floor = int.parse(p0!);
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: "ادخل المساحة",
                textInputType: TextInputType.number,
                onSaved: (p0) {
                  area = int.parse(p0!);
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: "ادخل الوصف",
                textInputType: TextInputType.multiline,
                maxLines: 5,
                onSaved: (p0) {
                  description = p0!;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _controller,
                title: "ادخل الميزات",
                onPressed: () {
                  setState(() {
                    FeatureManagment.addItem(listItems, _controller);
                  });
                },
              ),
              SizedBox(height: 16),
              if (listItems.isNotEmpty) GridViewFeatures(items: listItems),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () async {
                      final List<XFile> images = await ImagePicker()
                          .pickMultiImage(imageQuality: 70);

                      for (var element in images) {
                        setState(() {
                          listImages.add(File(element.path));
                        });
                      }
                    },
                    child: const Text("اضافة الصور من المعرض"),
                  ),
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
                itemCount: listImages.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            File(listImages[index].path),
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
                              listImages.removeAt(index);
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
              SizedBox(
                width: double.maxFinite,
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.black12),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      PropertyEntity(
                        title: title,
                        type: selectedType,
                        price: price,
                        city: city,
                        county: county,
                        description: description,
                        rooms: rooms,
                        bedrooms: bedrooms,
                        bathrooms: bathrooms,
                        floor: floor,
                        area: area,
                        features: listItems,
                        image: listImages,
                      );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.onUserInteraction;
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      "نشر العقار",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TypeProperty extends StatefulWidget {
  const TypeProperty({super.key, required this.onChanged});
  final ValueChanged<String> onChanged;

  @override
  State<TypeProperty> createState() => _TypePropertyState();
}

class _TypePropertyState extends State<TypeProperty> {
  String selectedType = 'بيع';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedType = 'بيع';
                  widget.onChanged(selectedType);
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  // color:
                  //     selectedType == 'بيع'
                  //         ? Theme.of(context).primaryColor
                  //         : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'بيع',
                    style: TextStyle(
                      // color:
                      //     selectedType == 'بيع'
                      //         ? Colors.white
                      //         : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedType = 'إيجار';
                  widget.onChanged(selectedType);
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  // color:
                  //     selectedType == 'إيجار'
                  //         ? Theme.of(context).primaryColor
                  //         : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'إيجار',
                    style: TextStyle(
                      // color:
                      //     selectedType == 'إيجار'
                      //         ? Colors.white
                      //         : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
