import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:property_app/core/entites/property_entity.dart';
import 'package:property_app/core/utils/images.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/Custom_image_cunter.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/custom_dots_indicator.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/feature_item_crad.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/foother_card_property.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/image_property.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/location_proprty.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/title_card_proprty.dart';
import 'package:easy_localization/easy_localization.dart';

class PropertyCard extends StatefulWidget {
  const PropertyCard({super.key, required this.property});

  final PropertyEntity property;

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              // Carousel Images
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: CarouselSlider.builder(
                  itemCount: widget.property.imagesUrl!.length,
                  itemBuilder: (context, index, realIndex) {
                    if (widget.property.imagesUrl!.isNotEmpty) {
                      return ImagesProperty(
                        image: widget.property.imagesUrl![index],
                      );
                    }
                    return SvgPicture.asset(Assets.assetsImagesForSaleRafiki);
                  },
                  options: CarouselOptions(
                    height: 200,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: true,
                    scrollPhysics: const BouncingScrollPhysics(),
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                ),
              ),

              // Image Counter
              Positioned(
                top: 12,
                right: 12,
                child: CustomImgeCunter(
                  current: _current,
                  imageNumper:
                      widget.property.imagesUrl!.isEmpty
                          ? 1
                          : widget.property.imagesUrl!.length,
                ),
              ),

              // Dots Indicator
              Positioned(
                bottom: 12,
                left: 0,
                right: 0,
                child: CustomDotsIndicator(
                  imageNumper:
                      widget.property.imagesUrl!.isEmpty
                          ? 1
                          : widget.property.imagesUrl!.length,
                  current: _current,
                ),
              ),
            ],
          ),

          // Property Details
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Price
                TitleCardProperty(property: widget.property),
                const SizedBox(height: 12),

                // Location
                LocationProprty(
                  city: widget.property.city,
                  county: widget.property.county,
                ),
                const SizedBox(height: 16),

                // Features
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FeatureItemCard(
                      icon: Icons.door_front_door_outlined,
                      text:
                          '${widget.property.rooms} ${'property_details.rooms'.tr()}',
                    ),

                    FeatureItemCard(
                      icon: Icons.king_bed,
                      text:
                          '${widget.property.bedrooms} ${'property_details.bedrooms'.tr()}',
                    ),
                    FeatureItemCard(
                      icon: Icons.bathtub,
                      text:
                          '${widget.property.bathrooms} ${'property_details.bathrooms'.tr()}',
                    ),
                    FeatureItemCard(
                      icon: Icons.square_foot,
                      text:
                          '${widget.property.area} ${'property_details.area'.tr()}',
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Divider
                const Divider(height: 24, thickness: 1),

                // Footer
                FooterCardProperty(property: widget.property),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
