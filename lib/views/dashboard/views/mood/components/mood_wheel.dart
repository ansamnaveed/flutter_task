import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controllers/mood_controller.dart';
import 'package:task/utils/app_text.dart';
import 'package:task/views/dashboard/views/mood/components/mood_painter.dart';
import 'draggable_handle.dart';

class MoodWheel extends StatelessWidget {
  final MoodController controller;
  const MoodWheel({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final mood = controller.selectedMood.value;
      final angle = controller.angle.value;

      return Column(
        children: [
          GestureDetector(
            onPanUpdate: (details) {
              RenderBox box = context.findRenderObject() as RenderBox;
              Offset localPosition = box.globalToLocal(details.globalPosition);
              Size size = box.size;
              Offset center = Offset(size.width / 2, size.height / 2);
              double dx = localPosition.dx - center.dx;
              double dy = localPosition.dy - center.dy;
              controller.updateAngle(dy, dx);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image(image: AssetImage(mood.image), width: 110),
                SizedBox(
                  width: 280,
                  height: 280,
                  child: CustomPaint(painter: MoodWheelPainter(angle: angle)),
                ),
                _buildHandle(angle),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Center(child: appText(mood.name, size: 28, weight: FontWeight.w500)),
        ],
      );
    });
  }

  Widget _buildHandle(double angle) {
    final radius = 280 / 2 - 30;
    final handleX = radius * math.cos(angle);
    final handleY = radius * math.sin(angle);

    return Transform.translate(
      offset: Offset(handleX, handleY),
      child: const DraggableHandle(),
    );
  }
}
