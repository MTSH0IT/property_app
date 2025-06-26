import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImagesProperty extends StatelessWidget {
  const ImagesProperty({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      fit: BoxFit.fill,
      width: double.infinity,
      height: 200,
      placeholder:
          (context, url) => Container(
            height: 200,
            color: Colors.grey[200],
            child: const Center(child: CircularProgressIndicator()),
          ),
      errorWidget:
          (context, url, error) => Container(
            height: 200,
            color: Colors.grey[200],
            child: const Icon(Icons.error, color: Colors.red),
          ),
    );
  }
}
