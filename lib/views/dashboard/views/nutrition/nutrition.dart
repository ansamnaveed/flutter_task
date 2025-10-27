import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task/controllers/nutrition_controller.dart';
import 'package:task/utils/app_icons.dart';
import 'package:task/utils/app_text.dart';
import 'package:task/views/dashboard/views/nutrition/components/calories_card.dart';
import 'package:task/views/dashboard/views/nutrition/components/hydration_card.dart';
import 'package:task/views/dashboard/views/nutrition/components/nutrition_appbar.dart';
import 'package:task/views/dashboard/views/nutrition/components/sliding_calendar.dart';
import 'package:task/views/dashboard/views/nutrition/components/weight_card.dart';
import 'package:task/views/dashboard/views/nutrition/components/workouts_card.dart';

class Nutrition extends StatelessWidget {
  Nutrition({super.key});

  final NutritionController controller = Get.put(NutritionController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: NutritionAppbar(controller: controller),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 0,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Obx(
                        () => appText(
                          controller.formatDateTime(),
                          size: 16,
                          weight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SlidingCalendar(controller: controller),
                    ]),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _HandleBarDelegate(),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          appText(
                            "Workouts",
                            size: 24,
                            weight: FontWeight.w600,
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            controller.isDay() ? AppIcons.sun : AppIcons.moon,
                          ),
                          const SizedBox(width: 12),
                          appText("9°"),
                        ],
                      ),
                      const SizedBox(height: 24),
                      WorkoutsCard(),
                      const SizedBox(height: 32),
                      appText("My Insights", size: 24, weight: FontWeight.w600),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CaloriesCard(consumed: 550, total: 2500),
                          WeightCard(),
                        ],
                      ),
                      const SizedBox(height: 12),
                      HydrationCard(),
                      const SizedBox(height: 24),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HandleBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 20;
  @override
  double get maxExtent => 20;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.black, // match background under appbar
      alignment: Alignment.center,
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _HandleBarDelegate oldDelegate) => false;
}
