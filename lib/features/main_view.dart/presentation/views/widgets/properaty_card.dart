import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/Custom_image_cunter.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/custom_dots_indicator.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/feature_item_crad.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/foother_card_property.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/image_property.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/location_proprty.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/title_card_proprty.dart';

class PropertyCard extends StatefulWidget {
  const PropertyCard({super.key, required this.imgList});

  final List<String> imgList;

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
                  itemCount: widget.imgList.length,
                  itemBuilder: (context, index, realIndex) {
                    return ImagesProperty(image: widget.imgList[index]);
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
              if (widget.imgList.length > 1)
                Positioned(
                  top: 12,
                  right: 12,
                  child: CustomImgeCunter(
                    current: _current,
                    imageNumper: widget.imgList.length,
                  ),
                ),

              // Dots Indicator
              if (widget.imgList.length > 1)
                Positioned(
                  bottom: 12,
                  left: 0,
                  right: 0,
                  child: CustomDotsIndicator(
                    imageNumper: widget.imgList.length,
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
                TitleCardProperty(),
                const SizedBox(height: 12),

                // Location
                LocationProprty(city: 'دمشق', county: 'الميدان'),
                const SizedBox(height: 16),

                // Features
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FeatureItemCard(icon: Icons.bed, text: '4 غرف'),
                    FeatureItemCard(icon: Icons.bathtub, text: '3 حمامات'),
                    FeatureItemCard(icon: Icons.square_foot, text: '250 م²'),
                    FeatureItemCard(icon: Icons.king_bed, text: '3 غرف نوم'),
                  ],
                ),
                const SizedBox(height: 8),

                // Divider
                const Divider(height: 24, thickness: 1),

                // Footer
                FooterCardProperty(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
