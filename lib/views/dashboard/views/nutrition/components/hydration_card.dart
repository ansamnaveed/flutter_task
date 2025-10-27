import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/app_text.dart';

class HydrationCard extends StatelessWidget {
  const HydrationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Get.height * 0.219,
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: AppColors.bgColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appText(
                    "0%",
                    color: Color(0xFF48A4E5),
                    size: 40,
                    weight: FontWeight.w600,
                  ),
                  Spacer(),
                  appText("Hydration", size: 18, weight: FontWeight.w700),
                  appText("Log Now", size: 12, color: AppColors.greyColor),
                ],
              ),
              SizedBox(width: Get.width * 0.12),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [appText("2 L"), appText("0 L")],
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox.shrink(),
                    ...List.generate(
                      11,
                      (i) => Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: i == 0 || i == 5 || i == 10 ? 4 : 2,
                            width: i == 0 || i == 5 || i == 10 ? 8 : 4,
                            decoration: BoxDecoration(
                              color: i == 0 || i == 5 || i == 10
                                  ? Color(0xFF48A4E5)
                                  : Color(0xFF48A4E5).withOpacity(0.5),
                            ),
                          ),
                          i == 10
                              ? Container(
                                  margin: EdgeInsets.only(top: 8),
                                  width: 110,
                                  child: Divider(color: Color(0xFF363638)),
                                )
                              : SizedBox(),
                          i == 10
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                    top: 3,
                                  ),
                                  child: appText(
                                    "0ml",
                                    weight: FontWeight.w600,
                                    size: 16,
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: Color(0xFF1B3D45),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
          ),
          child: appText("500 ml added to water log", size: 12),
        ),
      ],
    );
  }
}
