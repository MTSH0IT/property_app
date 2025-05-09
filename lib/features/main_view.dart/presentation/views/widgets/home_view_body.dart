import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:property_app/core/utils/const.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/properaty_card.dart';
import 'package:property_app/features/property_details/presentation/views/property_details_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: kcolor,
          toolbarHeight: 80,
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'welcome Back !',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blueGrey,
                            ),
                          ),
                          Text(
                            'Mohammad Taher',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.search_outlined,
                        size: 30,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: CarouselSlider.builder(
              itemCount: 5,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  color: Colors.blueGrey,
                  child: Center(
                    child: Text('Item $index', style: TextStyle(fontSize: 20)),
                  ),
                );
              },
              options: CarouselOptions(
                aspectRatio: 4 / 2,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
            ),
          ),
        ),

        SliverList.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, PropertyDetailsView.routeName);
                },
                child: PropertyCard(),
              ),
            );
          },
        ),
      ],
    );
  }
}
