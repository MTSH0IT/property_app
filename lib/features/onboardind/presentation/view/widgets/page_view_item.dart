import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imagePath,
  });
  final String title;
  final String subTitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(imagePath),
        const SizedBox(height: 20),
        Text(title, textAlign: TextAlign.center),
        const SizedBox(height: 5),
        Text(subTitle, textAlign: TextAlign.center),
        const SizedBox(height: 10),
      ],
    );
  }
}
