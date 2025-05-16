import 'package:flutter/material.dart';
import 'package:property_app/core/utils/const.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: kcolor,
      elevation: 0,
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
                        style: TextStyle(fontSize: 20, color: Colors.blueGrey),
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
                  Icon(Icons.search_outlined, size: 30, color: Colors.black),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
