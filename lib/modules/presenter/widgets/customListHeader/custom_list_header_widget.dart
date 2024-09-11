import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_text_styles.dart';

import '../../../../consts/app_colors.dart';

class CustomListHeaderWidget extends StatelessWidget {
  final String firstColumn;
  final String secondColumn;
  final String thirdColumn;
  final String fourthColumn;
  final Color borderColor;

  const CustomListHeaderWidget(
      {
        super.key,
        required this.firstColumn,
        required this.secondColumn,
        required this.thirdColumn,
        required this.fourthColumn,
        this.borderColor = AppColors.whiteBorderColor
      });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.trueWhiteColor,
        child: Column(
            children: [
        Padding(
        padding: const EdgeInsets.all(12.0), child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(firstColumn, style: AppTextStyles.smallBoldTextOnCardStyle(
                          color: AppColors.blackColor)),
                  Text(secondColumn, style: AppTextStyles.smallBoldTextOnCardStyle(
                      color: AppColors.blackColor)),

                  Text(thirdColumn, style: AppTextStyles.smallBoldTextOnCardStyle(
                      color: AppColors.blackColor)),

                  Text(fourthColumn, style: AppTextStyles.smallBoldTextOnCardStyle(
                      color: AppColors.blackColor))
                ],
              )),
              Divider(
                color: borderColor,
                thickness: 1.0,
                height: 1.0,
              )
            ],
          ),
        );
  }
}
