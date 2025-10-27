import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task/controllers/dashboard_controller.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/app_text.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.bottomNavItems[controller.currentIndex.value].view,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.borderColor, width: 0.5),
          ),
        ),
        child: Row(
          children: List.generate(
            controller.bottomNavItems.length,
            (i) => InkWell(
              onTap: () {
                controller.onBottomNavItemTap(i);
              },
              child: Obx(
                () => Container(
                  width: Get.width / controller.bottomNavItems.length,
                  padding: EdgeInsets.only(top: 12, bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        controller.bottomNavItems[i].icon,
                        color: controller.currentIndex.value == i
                            ? Colors.white
                            : AppColors.textGrey,
                      ),
                      SizedBox(height: 4),
                      appText(
                        controller.bottomNavItems[i].title,
                        color: controller.currentIndex.value == i
                            ? Colors.white
                            : AppColors.textGrey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
