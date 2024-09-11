import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_text_styles.dart';

import '../../../../consts/app_colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function() onPressed;
  final String label;

  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(150, 38),
          backgroundColor: AppColors.transparent,
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: AppColors.blackColor, width: 1),
              borderRadius: BorderRadius.circular(5)),
        shadowColor: AppColors.transparent
      ),
      child: Text(
        label,
        style: AppTextStyles.labelTextButtonStyle(color: AppColors.blackColor),
      ),
    );
  }
}