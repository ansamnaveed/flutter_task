import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/controllers/dashboard_controller.dart';
import 'package:task/utils/app_colors.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.bottomNavItems[controller.currentIndex.value].view,
      ),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: AppColors.borderColor, width: 0.5),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              controller.onBottomNavItemTap(index);
              controller.update();
            },
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: Colors.white,
            unselectedItemColor: AppColors.textGrey,
            unselectedLabelStyle: GoogleFonts.mulish(color: AppColors.textGrey),
            selectedLabelStyle: GoogleFonts.mulish(color: Colors.white),
            backgroundColor: Colors.transparent,
            items: List.generate(
              controller.bottomNavItems.length,
              (i) => BottomNavigationBarItem(
                icon: SvgPicture.asset(controller.bottomNavItems[i].icon),
                activeIcon: SvgPicture.asset(
                  controller.bottomNavItems[i].icon,
                  color: Colors.white,
                ),
                label: controller.bottomNavItems[i].title,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
