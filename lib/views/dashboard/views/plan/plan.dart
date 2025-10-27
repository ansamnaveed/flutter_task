import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task/controllers/plan_controller.dart';
import 'package:task/utils/app_text.dart';
import 'components/week_section.dart';

class Plan extends StatelessWidget {
  Plan({super.key});

  PlanController controller = Get.put(PlanController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText("Training Calendar", size: 24),
                appText("Save", size: 18, weight: FontWeight.w700),
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<PlanController>(
              builder: (controller) {
                List<DateTime> weeks = controller.generateWeeks();
                return ListView.builder(
                  controller: controller.scrollController,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemCount: weeks.length,
                  itemBuilder: (context, index) {
                    DateTime weekStart = weeks[index];
                    List<DateTime> weekDays = controller.getWeekDates(
                      weekStart,
                    );
                    DateTime weekEnd = weekDays.last;

                    String dateRange =
                        '${DateFormat('MMMM d').format(weekStart)}-${DateFormat('d').format(weekEnd)}';
                    int weekNum = controller.getWeekNumber(weekStart);
                    String totalTime = controller.getTotalTimeForWeek(
                      weekStart,
                    );

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: WeekSection(
                        weekNumber: weekNum,
                        totalWeeks: 52,
                        dateRange: dateRange,
                        totalTime: totalTime,
                        weekDays: weekDays,
                        weekWorkouts: controller.weekWorkouts,
                        onWorkoutMoved: controller.moveWorkout,
                        getDayKey: controller.getDayKey,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
