import 'package:flutter/material.dart';
import 'package:property_app/core/utils/const.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({
    super.key,
    required this.imageNumper,
    required int current,
  }) : _current = current;

  final int imageNumper;
  final int _current;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        imageNumper,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: _current == index ? 24.0 : 8.0,
          height: 6.0,
          margin: const EdgeInsets.symmetric(horizontal: 2.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            color:
                _current == index
                    ? kcolor
                    : Colors.white.withValues(alpha: 0.7),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
