import 'package:flutter/material.dart';

class DateBadgeWidget extends StatelessWidget {
  final DateTime? publishedDate;
  final Color? backgroundColor;
  final Color? textColor;

  const DateBadgeWidget({
    super.key,
    required this.publishedDate,
    this.backgroundColor,
    this.textColor,
  });

  String _getRelativeTime(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        if (difference.inMinutes == 0) {
          return 'الآن';
        }
        return '${difference.inMinutes}د';
      }
      return '${difference.inHours}س';
    } else if (difference.inDays == 1) {
      return 'أمس';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}يوم';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeksأسبوع';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$monthsشهر';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$yearsسنة';
    }
  }

  Color _getBadgeColor(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return Colors.green;
    } else if (difference.inDays < 3) {
      return Colors.orange;
    } else if (difference.inDays < 7) {
      return Colors.blue;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (publishedDate == null) {
      return const SizedBox.shrink();
    }

    final badgeColor = backgroundColor ?? _getBadgeColor(publishedDate!);
    final textColor = this.textColor ?? Colors.white;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: badgeColor.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.access_time, size: 12, color: textColor),
          const SizedBox(width: 4),
          Text(
            _getRelativeTime(publishedDate!),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
