import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/app_text.dart';

class WeightCard extends StatelessWidget {
  const WeightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.435,
      height: Get.height * 0.225,
      padding: EdgeInsets.all(13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: AppColors.bgColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              appText("75", size: 40, weight: FontWeight.w500),
              appText('kg', size: 18, weight: FontWeight.w700),
            ],
          ),
          SizedBox(height: 6),
          Row(
            spacing: 6,
            children: [
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: Color(0xFF154124),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.call_made_rounded,
                  color: Color(0xFF01A53C),
                  size: 8,
                ),
              ),
              appText("+1.6kg", color: AppColors.greyColor),
            ],
          ),
          Spacer(),
          appText("Weight", weight: FontWeight.w700, size: 18),
        ],
      ),
    );
  }
}
