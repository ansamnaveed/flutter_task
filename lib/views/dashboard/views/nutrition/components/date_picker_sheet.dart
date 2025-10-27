import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task/controllers/nutrition_controller.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/app_text.dart';

class DatePickerSheet extends StatelessWidget {
  final NutritionController controller;
  const DatePickerSheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<DateTime?> days = controller.getDaysInMonth();

      return Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: const BoxDecoration(
          color: AppColors.bgColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 54,
              height: 4,
              decoration: BoxDecoration(
                color: Color(0xFFA1A5B7),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: controller.previousMonth,
                  icon: const Icon(
                    Icons.chevron_left_rounded,
                    color: Colors.white,
                  ),
                  iconSize: 18,
                ),
                appText(
                  DateFormat('MMM yyyy').format(controller.currentMonth.value),
                  size: 16,
                  weight: FontWeight.w700,
                ),
                IconButton(
                  onPressed: controller.nextMonth,
                  icon: const Icon(
                    Icons.chevron_right_rounded,
                    color: Colors.white,
                  ),
                  iconSize: 18,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']
                  .map(
                    (day) => Expanded(
                      child: Center(
                        child: appText(day, size: 12, weight: FontWeight.w700),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 8,
                ),
                itemCount: days.length,
                itemBuilder: (context, index) {
                  DateTime? day = days[index];
                  if (day == null) return const SizedBox();

                  bool isSelected = controller.isSameDay(
                    day,
                    controller.selectedDate.value,
                  );

                  return GestureDetector(
                    onTap: () {
                      controller.selectedDate.value = day;
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color.fromRGBO(32, 183, 111, 0.19)
                            : Colors.transparent,
                        shape: BoxShape.circle,
                        border: isSelected
                            ? Border.all(color: AppColors.green, width: 2)
                            : null,
                      ),
                      child: Center(
                        child: appText(
                          day.day.toString(),
                          weight: FontWeight.w700,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
