import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task/models/dashboard_model.dart';
import 'package:task/utils/app_icons.dart';
import 'package:task/views/dashboard/views/mood/mood.dart';
import 'package:task/views/dashboard/views/nutrition/nutrition.dart';
import 'package:task/views/dashboard/views/plan/plan.dart';

class DashboardController extends GetxController {
  RxInt currentIndex = 0.obs;

  List<DashboardModel> bottomNavItems = [
    DashboardModel(
      title: "Nutrition",
      icon: AppIcons.nutrition,
      view: Nutrition(),
    ),
    DashboardModel(title: "Plan", icon: AppIcons.plan, view: Plan()),
    DashboardModel(title: "Mood", icon: AppIcons.mood, view: Mood()),
    DashboardModel(title: "Profile", icon: AppIcons.profile, view: Container()),
  ];

  void onBottomNavItemTap(int index) {
    currentIndex.value = index;
    update();
  }
}
