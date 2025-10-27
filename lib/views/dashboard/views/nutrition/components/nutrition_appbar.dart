import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task/controllers/nutrition_controller.dart';
import 'package:task/utils/app_icons.dart';
import 'package:task/utils/app_text.dart';
import 'package:task/views/dashboard/views/nutrition/components/date_picker_sheet.dart';

class NutritionAppbar extends StatelessWidget {
  NutritionController controller;
  NutritionAppbar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.bell),
        Spacer(),
        GestureDetector(
          onTap: () {
            controller.currentMonth.value = DateTime(
              controller.selectedDate.value.year,
              controller.selectedDate.value.month,
              1,
            );
            Get.bottomSheet(DatePickerSheet(controller: controller));
          },
          child: Row(
            children: [
              SvgPicture.asset(AppIcons.moonCircle),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Obx(
                  () => appText(
                    "Week ${controller.getWeekNumberInMonth()}/${controller.getTotalWeeksInMonth()}",
                    weight: FontWeight.w700,
                  ),
                ),
              ),
              Icon(Icons.arrow_drop_down_rounded, color: Colors.white),
            ],
          ),
        ),
        Spacer(),
      ],
    );
  }
}
