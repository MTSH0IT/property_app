import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/information_card_view.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: 5,
            itemBuilder: (context, index, realIndex) {
              return Center(child: Text("$index"));
            },
            options: CarouselOptions(
              aspectRatio: 4 / 2,
              autoPlay: false,
              enlargeCenterPage: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  //color: Colors.amber,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InformationCardView(
                        icon: Icons.straighten_outlined,
                        title: "data",
                        data: "data",
                      ),
                      SizedBox(height: 16),

                      InformationCardView(
                        icon: Icons.local_atm_outlined,
                        title: "data",
                        data: "data",
                      ),
                    ],
                  ),
                ),
                // Spacer(),
                Container(
                  // color: Colors.green,
                  child: Column(
                    children: [
                      InformationCardView(
                        icon: Icons.location_on_outlined,
                        title: "data",
                        data: "data",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
