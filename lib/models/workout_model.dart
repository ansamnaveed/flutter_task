import 'package:flutter/material.dart';

class Workout {
  final String type;
  final String name;
  final String duration;
  final Color accentColor;
  final String icon;

  Workout({
    required this.type,
    required this.name,
    required this.duration,
    required this.accentColor,
    required this.icon,
  });
}
