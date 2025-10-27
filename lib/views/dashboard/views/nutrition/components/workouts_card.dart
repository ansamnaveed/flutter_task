import 'package:flutter/material.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/app_text.dart';

class WorkoutsCard extends StatelessWidget {
  const WorkoutsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.bgColor,
        border: const Border(
          left: BorderSide(color: Color(0xFF32AAB7), width: 7),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appText(
                "December 22 - 25m - 30m",
                size: 12,
                weight: FontWeight.w700,
              ),
              appText("Upper Body", size: 24, weight: FontWeight.w700),
            ],
          ),
          const Icon(Icons.arrow_forward_rounded, color: Colors.white),
        ],
      ),
    );
  }
}
