import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:task/models/mood_model.dart';
import 'package:task/utils/app_images.dart';

class MoodController extends GetxController {
  final List<MoodModel> moods = [
    MoodModel(name: 'Happy', image: AppImages.happy),
    MoodModel(name: 'Content', image: AppImages.content),
    MoodModel(name: 'Calm', image: AppImages.calm),
    MoodModel(name: 'Peaceful', image: AppImages.peaceful),
  ];

  RxDouble angle = 0.0.obs;
  late Rx<MoodModel> selectedMood;

  @override
  void onInit() {
    angle.value = math.pi / 4.0;
    selectedMood = Rx<MoodModel>(getCurrentMood());
    super.onInit();
  }

  MoodModel getCurrentMood() {
    double normalizedAngle = angle.value % (2 * math.pi);
    if (normalizedAngle < 0) normalizedAngle += 2 * math.pi;

    double sectionSize = (2 * math.pi) / moods.length;
    int moodIndex =
        ((normalizedAngle + math.pi / 2) / sectionSize).floor() % moods.length;

    return moods[moodIndex];
  }

  void updateAngle(double dy, double dx) {
    angle.value = math.atan2(dy, dx);
    selectedMood.value = getCurrentMood();
  }
}
