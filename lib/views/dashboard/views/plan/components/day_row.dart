import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/models/workout_model.dart';
import 'package:task/utils/app_text.dart';
import 'workout_card.dart';

class DayRow extends StatelessWidget {
  final String dayName;
  final int date;
  final List<Workout>? workouts;
  final String dayKey;
  final Function(String, String, Workout) onWorkoutMoved;
  const DayRow({
    super.key,
    required this.dayName,
    required this.date,
    this.workouts,
    required this.dayKey,
    required this.onWorkoutMoved,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<Map<String, dynamic>>(
      onAccept: (data) {
        Workout workout = data['workout'] as Workout;
        String fromKey = data['fromKey'] as String;
        if (fromKey != dayKey) {
          onWorkoutMoved(fromKey, dayKey, workout);
        }
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 4),
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey.shade800, width: 1),
            ),
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  appText(
                    dayName,
                    weight: FontWeight.w700,
                    color: workouts != null && workouts!.isNotEmpty
                        ? Colors.white
                        : Color(0xFF5D607C),
                  ),
                  appText(
                    date.toString(),
                    size: 20,
                    weight: FontWeight.w500,
                    color: workouts != null && workouts!.isNotEmpty
                        ? Colors.white
                        : Color(0xFF5D607C),
                  ),
                ],
              ),
              SizedBox(width: 12),
              Expanded(
                child: workouts != null && workouts!.isNotEmpty
                    ? Column(
                        children: workouts!.map((workout) {
                          return LongPressDraggable<Map<String, dynamic>>(
                            data: {'workout': workout, 'fromKey': dayKey},
                            feedback: SizedBox(
                              height: Get.height * 0.085,
                              width: Get.width - 80,
                              child: Material(
                                color: Colors.transparent,
                                child: Opacity(
                                  opacity: 0.7,
                                  child: WorkoutCard(workout: workout),
                                ),
                              ),
                            ),
                            childWhenDragging: Opacity(
                              opacity: 0.3,
                              child: WorkoutCard(workout: workout),
                            ),
                            child: WorkoutCard(workout: workout),
                          );
                        }).toList(),
                      )
                    : Container(
                        height: Get.height * 0.085,
                        decoration: BoxDecoration(
                          color: candidateData.isNotEmpty
                              ? Colors.grey.shade800
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          border: candidateData.isNotEmpty
                              ? Border.all(color: Colors.blue, width: 2)
                              : null,
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
