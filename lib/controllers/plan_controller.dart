import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task/models/workout_model.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/app_icons.dart';

class PlanController extends GetxController {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 730));
  ScrollController scrollController = ScrollController();
  List<DateTime> generateWeeks() {
    List<DateTime> weeks = [];
    DateTime current = getStartOfWeek(startDate);

    while (current.isBefore(endDate)) {
      weeks.add(current);
      current = current.add(const Duration(days: 7));
    }

    return weeks;
  }

  List<DateTime> getWeekDates(DateTime startOfWeek) {
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  DateTime getStartOfWeek(DateTime date) {
    int daysFromMonday = date.weekday - 1;
    return DateTime(
      date.year,
      date.month,
      date.day,
    ).subtract(Duration(days: daysFromMonday));
  }

  int getWeekNumber(DateTime date) {
    DateTime firstDayOfYear = DateTime(date.year, 1, 1);
    int daysSinceFirstDay = date.difference(firstDayOfYear).inDays;
    return (daysSinceFirstDay / 7).ceil() + 1;
  }

  String getTotalTimeForWeek(DateTime weekStart) {
    List<DateTime> weekDays = getWeekDates(weekStart);
    int totalMinutes = 0;

    for (DateTime day in weekDays) {
      String key = getDayKey(day);
      List<Workout>? workouts = weekWorkouts[key];
      if (workouts != null) {
        for (Workout workout in workouts) {
          String durationStr = workout.duration.split(' - ')[0];
          int minutes = int.tryParse(durationStr.replaceAll('m', '')) ?? 0;
          totalMinutes += minutes;
        }
      }
    }

    return totalMinutes > 0 ? '${totalMinutes}min' : '0min';
  }

  Map<String, List<Workout>> weekWorkouts = {};

  void initializeSampleWorkouts() {
    DateTime today = DateTime.now();
    DateTime weekStart = getStartOfWeek(today);

    List<DateTime> currentWeek = getWeekDates(weekStart);

    String mondayKey = getDayKey(currentWeek[0]);
    weekWorkouts[mondayKey] = [
      Workout(
        type: 'Arms Workout',
        name: 'Arm Blaster',
        duration: '25m - 30m',
        accentColor: AppColors.green,
        icon: AppIcons.gym,
      ),
    ];

    String thursdayKey = getDayKey(currentWeek[3]);
    weekWorkouts[thursdayKey] = [
      Workout(
        type: 'Leg Workout',
        name: 'Leg Day Blitz',
        duration: '25m - 30m',
        accentColor: AppColors.blue,
        icon: AppIcons.leg,
      ),
    ];
  }

  @override
  void onInit() {
    initializeSampleWorkouts();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void moveWorkout(String fromKey, String toKey, Workout workout) {
    weekWorkouts[fromKey]?.remove(workout);
    if (weekWorkouts[fromKey]?.isEmpty ?? false) {
      weekWorkouts.remove(fromKey);
    }
    weekWorkouts[toKey] = weekWorkouts[toKey] ?? [];
    weekWorkouts[toKey]!.add(workout);
    update();
  }

  String getDayKey(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
