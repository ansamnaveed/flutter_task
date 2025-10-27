import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controllers/mood_controller.dart';
import 'package:task/utils/app_images.dart';
import 'package:task/utils/app_text.dart';
import 'components/mood_wheel.dart';

class Mood extends StatelessWidget {
  Mood({super.key});

  final MoodController controller = Get.put(MoodController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(image: AssetImage(AppImages.mood)),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText("Mood", size: 32),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText("Start your day", size: 18),
                      const SizedBox(height: 12),
                      appText(
                        "How are you feeling at the Moment?",
                        size: 24,
                        weight: FontWeight.w600,
                      ),
                      const SizedBox(height: 22),
                      Center(child: MoodWheel(controller: controller)),
                    ],
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 49),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: appText(
                    "Continue",
                    color: Colors.black,
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
