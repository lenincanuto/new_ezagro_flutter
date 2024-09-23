import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../../consts/app_colors.dart';
import '../../../../../consts/app_strings.dart';
import '../../../../../modules/presenter/widgets/customCardLogo/custom_card_logo_widget.dart';
import '../../../../../modules/presenter/widgets/customSelector/custom_selector_widget.dart';
import '../create_service_order_controller.dart';

class MachineryPage extends StatelessWidget {
  CreateServiceOrderController controller;

  MachineryPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) => Column(
              children: [
                CustomSelectorWidget(
                    onSelect: (value) {
                      controller.machinery.add(value);
                      controller.selectedMachinery["machinery"] =
                          controller.executors;
                    },
                    items: const ["máquina 1", "máquina 2", "máquina 3"],
                    title: AppStrings.machinerySelectorTitle,
                    selectorHint: AppStrings.machinerySelectorHint),
                const SizedBox(height: 6),
                const Divider(
                  height: 1,
                  color: AppColors.softGreyColor,
                ),
                const SizedBox(height: 6),
                Expanded(
                    child: ListView.separated(
                  itemCount: controller.machinery.length,
                  itemBuilder: (context, index) {
                    return Observer(
                        builder: (context) => CustomCardLogoWidget(
                              index: index,
                              labelOne: AppStrings.machineryField,
                              textOne: controller.machinery[index],
                              labelTwo: AppStrings.machineryAliasField,
                              textTwo: controller.machinery[index],
                              labelThree: AppStrings.hourMeterField,
                              textThree: "Horímetro",
                              labelFour: AppStrings.kiloMeterField,
                              textFour: "Quilometragem",
                              icon: Icons.delete_outline,
                              logo: Icons.agriculture_sharp,
                              onIconTap: (index) {
                                controller.machinery.removeAt(index);
                                controller.selectedMachinery["machinery"] =
                                    controller.executors;
                              },
                            ));
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 4);
                  },
                ))
              ],
            ));
  }
}
