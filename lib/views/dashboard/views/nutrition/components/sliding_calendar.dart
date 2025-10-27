import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controllers/nutrition_controller.dart';
import 'package:task/utils/app_text.dart';
import 'date_circle.dart';

class SlidingCalendar extends StatelessWidget {
  NutritionController controller;
  SlidingCalendar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            WeekDayLabel('M'),
            WeekDayLabel('TU'),
            WeekDayLabel('W'),
            WeekDayLabel('TH'),
            WeekDayLabel('F'),
            WeekDayLabel('SA'),
            WeekDayLabel('SU'),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 60,
          child: PageView.builder(
            controller: PageController(initialPage: 1000),
            onPageChanged: (index) {
              final diff = index - 1000;
              controller.selectedDate.value = DateTime.now().add(
                Duration(days: diff * 7),
              );
            },
            itemBuilder: (context, index) {
              final baseDate = DateTime.now().add(
                Duration(days: (index - 1000) * 7),
              );
              final weekDates = controller.getWeekDates(baseDate);

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: weekDates.map((date) {
                  return Obx(
                    () => DateCircle(
                      date: date,
                      isSelected: controller.isSameDay(
                        date,
                        controller.selectedDate.value,
                      ),
                      onTap: () {
                        controller.selectedDate.value = date;
                        controller.update();
                      },
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}

class WeekDayLabel extends StatelessWidget {
  final String label;

  const WeekDayLabel(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      child: appText(
        label,
        weight: FontWeight.w700,
        size: 12,
        align: TextAlign.center,
      ),
    );
  }
}
