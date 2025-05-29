import 'package:flutter/material.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/custom_dots_indicator.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/image_property.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/location_proprty.dart';
import 'package:property_app/features/property_details/presentation/views/widgets/additional_features.dart';
import 'package:property_app/features/property_details/presentation/views/widgets/card_call.dart';
import 'package:property_app/features/property_details/presentation/views/widgets/custom_icon_button.dart';
import 'package:property_app/features/property_details/presentation/views/widgets/ditails_property.dart';
import 'package:property_app/features/property_details/presentation/views/widgets/title_details_property.dart';
import 'package:easy_localization/easy_localization.dart';

class PropertyDetailsViewBody extends StatefulWidget {
  const PropertyDetailsViewBody({super.key});

  @override
  State<PropertyDetailsViewBody> createState() =>
      _PropertyDetailsViewBodyState();
}

class _PropertyDetailsViewBodyState extends State<PropertyDetailsViewBody> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: Stack(
              fit: StackFit.expand,
              children: [
                Stack(
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: imgList.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return ImagesProperty(image: imgList[index]);
                      },
                    ),
                    Positioned(
                      bottom: 16,
                      left: 0,
                      right: 0,
                      child: CustomDotsIndicator(
                        imageNumper: imgList.length,
                        current: _currentPage,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          leading: CustomIconButton(
            icon: Icons.arrow_back_ios_new,
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            CustomIconButton(icon: Icons.favorite_border, onPressed: () {}),
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleDetailsProperty(title: 'فيلا فاخرة للبيع', type: 'للبيع'),
                const SizedBox(height: 8),
                LocationProprty(city: 'دمشق', county: 'ميدان'),
                const SizedBox(height: 16),
                DitailsProperty(
                  rooms: 7,
                  bedrooms: 4,
                  bathrooms: 3,
                  floor: 5,
                  area: 320,
                ),
                const SizedBox(height: 24),
                Text(
                  'property_details.description'.tr(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'فيلا فاخرة للبيع في حي النخيل الفاخر، مساحة الأرض 600 متر مربع، مساحة البناء 320 متر مربع، تتكون من 4 غرف نوم ماستر، 3 دورات مياه، صالة، مجلس رجال، مجلس نساء، مطبخ، ملحق خارجي، مواقف سيارات، مدخل سيارة، حديقة، مسبح، غرفة خادمة، مخزن، نظام أمني، نظام ري آلي، تكييف مركزي، نظام إنذار حريق، نظام إنذار سرقة، نظام كاميرات مراقبة، نظام صوتي، نظام إنارة خارجية، نظام ري آلي، نظام صرف صحي، نظام كهرباء احتياطي، نظام مياه ساخنة، نظام تدفئة مركزية، نظام تكييف مركزي، نظام إنذار حريق، نظام إنذار سرقة، نظام كاميرات مراقبة، نظام صوتي، نظام إنارة خارجية، نظام ري آلي، نظام صرف صحي، نظام كهرباء احتياطي، نظام مياه ساخنة، نظام تدفئة مركزية، نظام تكييف مركزي.',
                  style: TextStyle(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 24),
                Text(
                  'property_details.features'.tr(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (var feature in [
                      'تكييف مركزي',
                      'مسبح',
                      'حديقة',
                      'نظام أمني',
                      'جراج',
                      'تشطيب فاخر',
                    ])
                      AdditionalFeatures(feature: feature),
                  ],
                ),
                const SizedBox(height: 32),
                CardCall(phone: "0947503627", price: "200,000"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
