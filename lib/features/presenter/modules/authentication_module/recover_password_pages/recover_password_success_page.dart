import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../consts/app_colors.dart';
import '../../../../../consts/app_drawables.dart';
import '../../../../../consts/app_routes.dart';
import '../../../../../consts/app_strings.dart';
import '../../../../../consts/app_text_styles.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/buttons/custom_underlined_text_button.dart';

class RecoverPasswordSuccessPage extends StatelessWidget {
  final ArgParams? args;
  static const String routePath = AppRoutes.appRecoverPasswordSuccessPage;

  static navigate() =>
      Modular.to.navigate(routePath);

  static push() =>
      Modular.to.pushNamed(routePath);

  const RecoverPasswordSuccessPage({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        appBar: const CustomAppBarWidget(
          appBarType: AppBarType.backArrow,
          indicatorValue: 1,
        ),
        scrollable: false,
        child: Padding(
          padding: const EdgeInsets.all(19),
          child: Column(
            children: [
              SizedBox(height: 72),
              Text(
                AppStrings.recoverPasswordSuccessString,
                style: AppTextStyles.titleTextStyle(color: AppColors.blackColor),
              ),
              const SizedBox(height: 47),
              SvgPicture.asset(AppDrawables.checkCircleColorIcon),
              const SizedBox(height: 37),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomUnderlinedTextButton(
                      onTap: () {}, label: AppStrings.backToLoginString),
                    const SizedBox(height: 60),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}