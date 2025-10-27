import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task/models/workout_model.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/app_text.dart';
import 'package:task/views/dashboard/views/plan/components/day_row.dart';

class WeekSection extends StatelessWidget {
  final int weekNumber;
  final int totalWeeks;
  final String dateRange;
  final String totalTime;
  final List<DateTime> weekDays;
  final Map<String, List<Workout>> weekWorkouts;
  final Function(String, String, Workout) onWorkoutMoved;
  final String Function(DateTime) getDayKey;
  const WeekSection({
    super.key,
    required this.weekNumber,
    required this.totalWeeks,
    required this.dateRange,
    required this.totalTime,
    required this.weekDays,
    required this.weekWorkouts,
    required this.onWorkoutMoved,
    required this.getDayKey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(24, 16, 24, 8),
          decoration: BoxDecoration(
            color: Color(0xFF121212),
            border: Border(
              top: BorderSide(
                color: weekNumber.isEven
                    ? AppColors.blue
                    : Color(0xFF18AA99),
                width: 3,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              appText(
                "Week $weekNumber/$totalWeeks",
                size: 18,
                weight: FontWeight.w700,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText(dateRange, size: 16, color: Color(0xFF7A7C90)),
                  appText(
                    "Total: $totalTime",
                    size: 16,
                    color: Color(0xFF7A7C90),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        ...weekDays.map((date) {
          String key = getDayKey(date);
          List<Workout>? workouts = weekWorkouts[key];
          String dayName = DateFormat('EEE').format(date);
          return DayRow(
            dayName: dayName,
            date: date.day,
            workouts: workouts,
            dayKey: key,
            onWorkoutMoved: onWorkoutMoved,
          );
        }),
      ],
    );
  }
}
