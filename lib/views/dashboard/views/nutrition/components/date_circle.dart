import 'package:flutter/material.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/app_text.dart';

class DateCircle extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final VoidCallback onTap;

  const DateCircle({
    super.key,
    required this.date,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF2A2A2A),
              border: isSelected
                  ? Border.all(color: AppColors.green, width: 2)
                  : null,
            ),
            child: Center(
              child: appText(date.day.toString(), weight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColors.green : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
