import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/core/enums/field_service_order_type_enum.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/service_order/controller/service_order_controller/service_order_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/service_order/controller/service_order_controller/ui_service_order_controller.dart';
import '../../../../../consts/app_colors.dart';
import '../../../../../consts/app_routes.dart';
import '../../../../../consts/app_text_styles.dart';
import '../../../../../core/enums/field_service_order_status_enum.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/buttons/custom_outlined_button.dart';
import '../../../widgets/custom_info_card/custom_info_card_widget.dart';
import '../../../widgets/custom_list_item/custom_list_item_widget.dart';
import '../../../widgets/list_title_card/list_title_card_widget.dart';
import '../service_order_list_page/service_order_list_page.dart';

class ServiceOrderPage extends StatelessWidget {
  final ArgParams args;
  static const String routePath = AppRoutes.appServiceOrderPage;

  static void navigate(ArgParams args) => Modular.to.navigate(routePath, arguments: args);

  const ServiceOrderPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<ServiceOrderController>();
    controller.serviceOrderId = args.firstArgs as int;
    controller.getServiceOrder();
    final uiController = UiServiceOrderController(
        type: getFieldServiceOrderTypeEnum(controller.serviceOrder?.agriculturalActivity?.activityType ?? ""),
        status: fieldServiceOrderStatusEnum(controller.serviceOrder?.status ?? "")
    );
    return BackgroundWidget(
      scrollable: true,
      appBar: CustomAppBarWidget(
        appBarType: AppBarType.centeredTitleAndBackArrow,
        title: AppStrings.serviceOrderTitle,
         onTap: (){
            ServiceOrderListPage.navigate();
         }
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(
          builder: (context) => Column(
            children: [
              _isFinished(uiController.isFinished()),
              const SizedBox(height: 15,),
              CustomInfoCardWidget(
                  labelOne: "Atividade",
                  textOne: controller.serviceOrder?.id.toString() ?? "",
                  labelTwo: "Abertura: ${controller.serviceOrder?.activityStart ?? ""}",
                  textTwo: controller.serviceOrder?.agriculturalActivity?.activityName ?? "",
                  infoCardType: InfoCardType.activityType),
              const SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: AppColors.contourWhiteColor,
                      width: 3,
                    )),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.informationList.length,
                  itemBuilder: (context, index) {
                    return CustomListItemWidget(
                        label: controller.informationList[index][0],
                        informationText: controller.informationList[index][1],
                        backgroundColor: index % 2 == 0
                            ? AppColors.trueWhiteColor
                            : AppColors.softGreenColor,
                        rightIcon: controller.informationList[index][0] == "Talhões:"
                            ? Icons.navigate_next
                            : null,
                        type: controller.informationList[index][0] == "Talhões:"
                            ? ListItemType.oneIconButton
                            : ListItemType.regular);
                  },
                ),
              ),
              const SizedBox(height: 10),
              CustomInfoCardWidget(
                  labelOne: "Responsável",
                  textOne: controller.serviceOrder?.employeeActivityHolder?.employeeName ?? "",
                  icon: Icons.edit_outlined,
                  infoCardType: InfoCardType.oneLabeledInfo),
              const SizedBox(height: 10),
              CustomInfoCardWidget(
                  labelOne: "Cultura:",
                  textOne: controller.serviceOrder?.cropDiversity?.name ?? "",
                  labelTwo: "Variedade:",
                  textTwo: controller.serviceOrder?.cropDiversity?.crop?.name ?? "",
                  labelThree: "Tecnologia",
                  textThree: controller.serviceOrder?.cropDiversity?.technologyType?.name ?? "",
                  icon: Icons.edit_outlined,
                  infoCardType: InfoCardType.threeLabeledInfo),
              const SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.contourWhiteColor,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ListTitleCardWidget(text: "Executores:"),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: (controller.serviceOrder?.employees?.map((e) => e.employeeName) ?? []).toList().length,
                      itemBuilder: (context, index) {
                        return CustomListItemWidget(
                            informationText: controller.serviceOrder?.employees?.map((e) => e.employeeName).toList()[index] ?? "",
                            backgroundColor: index % 2 == 0
                                ? AppColors.trueWhiteColor
                                : AppColors.softGreenColor,
                            leftIcon: Icons.edit_outlined,
                            rightIcon: Icons.delete_outline,
                            type: ListItemType.twoIconButtons);
                      },
                    )],
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.contourWhiteColor,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ListTitleCardWidget(text: "Maquinário:"),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: (controller.serviceOrder?.machineImplements?.map((e) => e.machineImplementType?.name).toList() ?? []).length,
                      itemBuilder: (context, index) {
                        return CustomListItemWidget(
                            informationText: (controller.serviceOrder?.machineImplements?.map((e) => e.machineImplementType?.name).toList() ?? [])[index] ?? "",
                            backgroundColor: index % 2 == 0
                                ? AppColors.trueWhiteColor
                                : AppColors.softGreenColor,
                            leftIcon: Icons.edit_outlined,
                            rightIcon: Icons.delete_outline,
                            type: ListItemType.twoIconButtons);
                      },
                    )],
                ),
              ),
              const SizedBox(height: 10.0),
              CustomInfoCardWidget(
                  labelOne: "Estoque",
                  textOne: "Estoque",
                  infoCardType: InfoCardType.oneLabeledInfo),
              const SizedBox(height: 10.0),
              CustomInfoCardWidget(
                  labelOne: "Previsão de início",
                  textOne: controller.serviceOrder?.expectedStartDate ?? "",
                  labelTwo: "Previsão de término",
                  textTwo: controller.serviceOrder?.expectedEndDate ?? "",
                  icon: Icons.edit_outlined,
                  infoCardType: InfoCardType.twoLabeledInfo),
              const SizedBox(
                height: 10.0,
              ),
              CustomInfoCardWidget(
                  labelOne: "Valor do Serviço",
                  textOne:  "R\$ ${controller.serviceOrder?.activityValue?.toString() ?? ""}",
                  infoCardType: InfoCardType.oneLabeledInfo),
              const SizedBox(
                height: 10.0,
              ),
              CustomInfoCardWidget(
                  labelOne: "Observações",
                  textOne: controller.serviceOrder?.description ?? "",
                  infoCardType: InfoCardType.oneLabeledInfo),
              const SizedBox(
                height: 15,
              ),
              _getAvailableButtons(uiController.isFinished())
            ],
          ),
        ),
      ),
    );
  }

  Widget _isFinished(bool isFinished) {
    return isFinished ?
        Row(
          children: [
            const Icon(Icons.check_circle, size: 35, color: AppColors.greenColor,),
            const SizedBox(width: 6,),
            Text(AppStrings.finishedServiceOrder,
                style: AppTextStyles.boldMediumTextStyle(color: AppColors.blackColor))
          ],
        )
        :
        const SizedBox.shrink();
  }

  Widget _getAvailableButtons(bool isFinished) {

    return isFinished ?
      CustomElevatedButton(onPressed: () {}, label: AppStrings.resumeOSButton)
      :
      Column(
        children: [
          CustomOutlinedButton(onPressed: (){}, label: AppStrings.saveOSButton, textStyle: AppTextStyles.labelTextButtonStyle(color: AppColors.blackColor),),
          CustomElevatedButton(onPressed: (){}, label: AppStrings.suspendOSButton, backgroundColor: AppColors.darkGreyColor),
          CustomElevatedButton(onPressed: (){}, label: AppStrings.cancelOSButton, backgroundColor: AppColors.redCanceledColor,),
          const SizedBox(height: 15,),
          CustomElevatedButton(onPressed: (){}, label: AppStrings.finishedOSButton)
        ],
      );
  }
}
