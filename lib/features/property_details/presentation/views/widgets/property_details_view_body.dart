import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:property_app/core/entites/property_entity.dart';
import 'package:property_app/core/helper_functions/get_user_data.dart';
import 'package:property_app/core/utils/images.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/custom_dots_indicator.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/date_badge_widget.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/image_property.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/location_proprty.dart';
import 'package:property_app/features/property_details/presentation/cubit/favorite_cubit.dart';
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

  @override
  void initState() {
    super.initState();
    // التحقق من حالة المفضلة عند تحميل الصفحة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FavoriteCubit>(context).checkFavoriteStatus(
        propertyId: widget.property.propertyId!,
        userId: getUserData().uId,
      );
    });
  }

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
            BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                return CustomIconButton(
                  icon:
                      state is FavoriteSuccess && state.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                  onPressed: () {
                    BlocProvider.of<FavoriteCubit>(context).addOrRemoveFavorite(
                      propertyId: widget.property.propertyId!,
                      userId: getUserData().uId,
                    );
                  },
                );
              },
            ),
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
                const SizedBox(height: 8),
                DateBadgeWidget(publishedDate: widget.property.createdAt),
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
