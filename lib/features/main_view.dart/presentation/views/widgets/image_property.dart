import 'package:flutter/material.dart';

class ImagesProperty extends StatelessWidget {
  const ImagesProperty({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: BoxFit.fill,
      width: double.infinity,
      height: 200,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          height: 200,
          color: Colors.grey[200],
          child: Center(
            child: CircularProgressIndicator(
              // value:
              //     loadingProgress.expectedTotalBytes != null
              //         ? loadingProgress
              //                 .cumulativeBytesLoaded /
              //             loadingProgress.expectedTotalBytes!
              //         : null,
            ),
          ),
        );
      },
      errorBuilder:
          (context, error, stackTrace) => Container(
            height: 200,
            color: Colors.grey[200],
            child: const Icon(Icons.error, color: Colors.red),
          ),
    );
  }
}
