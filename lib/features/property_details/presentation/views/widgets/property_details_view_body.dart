import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:property_app/core/entites/property_entity.dart';
import 'package:property_app/core/utils/images.dart';
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
  const PropertyDetailsViewBody({super.key, required this.property});

  final PropertyEntity property;

  @override
  State<PropertyDetailsViewBody> createState() =>
      _PropertyDetailsViewBodyState();
}

class _PropertyDetailsViewBodyState extends State<PropertyDetailsViewBody> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // List<String> imgList = [
  //   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  //   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  //   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  //   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  //   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  //   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
  // ];

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
                      itemCount:
                          widget.property.imagesUrl!.isEmpty
                              ? 1
                              : widget.property.imagesUrl!.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        if (widget.property.imagesUrl!.isNotEmpty) {
                          return ImagesProperty(
                            image: widget.property.imagesUrl![index],
                          );
                        }
                        return SvgPicture.asset(
                          Assets.assetsImagesForSaleRafiki,
                        );
                      },
                    ),
                    Positioned(
                      bottom: 16,
                      left: 0,
                      right: 0,
                      child: CustomDotsIndicator(
                        imageNumper:
                            widget.property.imagesUrl!.isEmpty
                                ? 1
                                : widget.property.imagesUrl!.length,
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
                TitleDetailsProperty(
                  title: widget.property.title,
                  type: widget.property.type,
                ),
                const SizedBox(height: 8),
                LocationProprty(
                  city: widget.property.city,
                  county: widget.property.county,
                ),
                const SizedBox(height: 16),
                DitailsProperty(
                  rooms: widget.property.rooms,
                  bedrooms: widget.property.bedrooms,
                  bathrooms: widget.property.bathrooms,
                  floor: widget.property.floor,
                  area: widget.property.area,
                ),
                const SizedBox(height: 24),
                Text(
                  'property_details.description'.tr(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.property.title,
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
                    for (var feature in widget.property.features!)
                      AdditionalFeatures(feature: feature),
                  ],
                ),
                const SizedBox(height: 32),
                CardCall(
                  phone: "0947503627",
                  price: widget.property.price.toString(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
