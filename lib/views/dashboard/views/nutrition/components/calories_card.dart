import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/app_text.dart';

class CaloriesCard extends StatelessWidget {
  final int consumed;
  final int total;
  const CaloriesCard({super.key, required this.consumed, required this.total});

  @override
  Widget build(BuildContext context) {
    int remaining = total - consumed;
    double progress = consumed / total;

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
              appText(consumed.toString(), size: 40, weight: FontWeight.w500),
              appText('Calories', size: 18, weight: FontWeight.w700),
            ],
          ),
          SizedBox(height: 6),
          appText("$remaining Remaining", color: AppColors.greyColor),
          Spacer(),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText(
                    "0",
                    weight: FontWeight.w600,
                    color: Color(0xFF7E7E7E),
                  ),
                  appText(
                    total.toString(),
                    weight: FontWeight.w600,
                    color: Color(0xFF7E7E7E),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Container(
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: progress,
                      child: Container(
                        height: 6,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF7BBDE2),
                              Color(0xFF69C0B1),
                              Color(0xFF60C198),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
