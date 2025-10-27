import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task/models/workout_model.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/app_icons.dart';
import 'package:task/utils/app_text.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;
  const WorkoutCard({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.085,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border(left: BorderSide(color: AppColors.txtWhite, width: 7)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(AppIcons.drag),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: workout.accentColor.withOpacity(0.17),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4,
                    children: [
                      SvgPicture.asset(workout.icon),
                      appText(
                        workout.type,
                        color: workout.accentColor,
                        size: 10,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [appText(workout.name), appText(workout.duration)],
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
