import 'package:flutter/material.dart';
import 'package:task/utils/app_colors.dart';

class DraggableHandle extends StatelessWidget {
  const DraggableHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 57,
      height: 57,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.handleColor,
        border: Border.all(color: AppColors.borderWhite, width: 3),
        boxShadow: [
          const BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
            blurStyle: BlurStyle.outer,
            color: Color.fromRGBO(0, 0, 0, 0.1),
          ),
          const BoxShadow(
            offset: Offset(0, 7),
            blurRadius: 7,
            spreadRadius: 0,
            blurStyle: BlurStyle.outer,
            color: Color.fromRGBO(0, 0, 0, 0.09),
          ),
          const BoxShadow(
            offset: Offset(0, 17),
            blurRadius: 10,
            spreadRadius: 0,
            blurStyle: BlurStyle.outer,
            color: Color.fromRGBO(0, 0, 0, 0.05),
          ),
          const BoxShadow(
            offset: Offset(0, 30),
            blurRadius: 12,
            spreadRadius: 0,
            blurStyle: BlurStyle.outer,
            color: Color.fromRGBO(0, 0, 0, 0.01),
          ),
          const BoxShadow(
            offset: Offset(0, 47),
            blurRadius: 13,
            spreadRadius: 0,
            blurStyle: BlurStyle.outer,
            color: Color.fromRGBO(0, 0, 0, 0),
          ),
        ],
      ),
    );
  }
}
