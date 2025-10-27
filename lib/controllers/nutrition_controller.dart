import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NutritionController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<DateTime> currentMonth = DateTime.now().obs;

  bool isDay() {
    final now = DateTime.now();
    final hour = now.hour;
    return hour >= 6 && hour < 18;
  }

  List<DateTime?> getDaysInMonth() {
    final firstDay = currentMonth.value;
    final lastDay = DateTime(firstDay.year, firstDay.month + 1, 0);

    int firstWeekday = firstDay.weekday;

    List<DateTime?> days = [];
    for (int i = 0; i < firstWeekday - 1; i++) {
      days.add(null);
    }

    for (int i = 1; i <= lastDay.day; i++) {
      days.add(DateTime(firstDay.year, firstDay.month, i));
    }

    return days;
  }

  void previousMonth() {
    currentMonth.value = DateTime(
      currentMonth.value.year,
      currentMonth.value.month - 1,
      1,
    );
  }

  void nextMonth() {
    currentMonth.value = DateTime(
      currentMonth.value.year,
      currentMonth.value.month + 1,
      1,
    );
  }

  bool isSameDay(DateTime? date1, DateTime date2) {
    if (date1 == null) return false;
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  int getWeekNumberInMonth() {
    DateTime firstDayOfMonth = DateTime(
      selectedDate.value.year,
      selectedDate.value.month,
      1,
    );

    int dayOffset = firstDayOfMonth.weekday - DateTime.monday;
    if (dayOffset < 0) dayOffset += 7;

    int weekNumber = ((selectedDate.value.day + dayOffset - 1) ~/ 7) + 1;

    return weekNumber;
  }

  int getTotalWeeksInMonth() {
    DateTime firstDayOfMonth = DateTime(
      selectedDate.value.year,
      selectedDate.value.month,
      1,
    );
    DateTime lastDayOfMonth = DateTime(
      selectedDate.value.year,
      selectedDate.value.month + 1,
      0,
    );

    int dayOffset = firstDayOfMonth.weekday - DateTime.monday;
    if (dayOffset < 0) dayOffset += 7;

    int totalWeeks = ((lastDayOfMonth.day + dayOffset) / 7).ceil();
    return totalWeeks;
  }

  String formatDateTime() {
    final now = DateTime.now();

    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final tomorrow = today.add(const Duration(days: 1));

    final formattedDate = DateFormat('dd MMM yyyy').format(selectedDate.value);

    if (selectedDate.value.year == today.year &&
        selectedDate.value.month == today.month &&
        selectedDate.value.day == today.day) {
      return 'Today, $formattedDate';
    } else if (selectedDate.value.year == yesterday.year &&
        selectedDate.value.month == yesterday.month &&
        selectedDate.value.day == yesterday.day) {
      return 'Yesterday, $formattedDate';
    } else if (selectedDate.value.year == tomorrow.year &&
        selectedDate.value.month == tomorrow.month &&
        selectedDate.value.day == tomorrow.day) {
      return 'Tomorrow, $formattedDate';
    } else {
      return formattedDate;
    }
  }

  List<DateTime> getWeekDates(DateTime date) {
    int daysFromMonday = date.weekday - 1;
    DateTime monday = date.subtract(Duration(days: daysFromMonday));
    return List.generate(7, (index) => monday.add(Duration(days: index)));
  }
}
