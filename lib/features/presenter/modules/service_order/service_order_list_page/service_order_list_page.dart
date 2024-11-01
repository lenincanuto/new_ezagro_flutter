import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/core/enums/service_order_type_enum.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_drawer/custom_drawer_widget.dart';

import '../../../../../consts/app_colors.dart';
import '../../../../../consts/app_dimens.dart';
import '../../../../../consts/app_routes.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/custom_card_title/custom_card_title.dart';
import '../../../widgets/custom_search_bar/custom_search_bar.dart';
import '../controller/service_order_list_controller/service_order_list_controller.dart';
import '../service_order_page/service_order_page.dart';

class ServiceOrderListPage extends StatelessWidget {

  static const String routePath = AppRoutes.appServiceOrderListPage;

  static navigate() =>
      Modular.to.navigate(routePath);

  static push(ArgParams args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  const ServiceOrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<ServiceOrderListController>();
    controller.getServiceOrderList();
    return BackgroundWidget(
        scrollable: false,
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          resizeToAvoidBottomInset: false,
          appBar: const CustomAppBarWidget(
            appBarType: AppBarType.hamburgerAndTitle,
            title: AppStrings.serviceOrderTitle,
          ),
          drawer: CustomDrawerWidget(),
          body: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 30, right: 30, bottom: 0),
                    child: CustomSearchBar(
                      onTextChanged: (search){controller.filterSOList(search.toLowerCase());},
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: AppDimens.titleDimen,
                          ),
                          Flexible(
                            child: Observer(
                                builder: (context) =>ListView.separated(
                                itemCount: controller.filteredServiceOrders.length,
                                itemBuilder: (context, index) {
                                  final status = ServiceOrderTypeEnumExtension.getEnumServiceOrderTypeFromString(controller.serviceOrderListEntities[index].status);
                                  return GestureDetector(
                                    onTap: (){ServiceOrderPage.navigate(ArgParams(firstArgs: controller.serviceOrderListEntities[index].id));},
                                    child: CustomCardTitleWidget(
                                      id: controller.serviceOrderListEntities[index].id,
                                      serviceOrderType: controller.serviceOrderListEntities[index].activityName ?? "",
                                      farm: controller.serviceOrderListEntities[index].farmName ?? "",
                                      costCenter: controller.serviceOrderListEntities[index].costCenterName ?? "",
                                      openingDate: controller.serviceOrderListEntities[index].activityStart ?? "",
                                      closingDate: controller.serviceOrderListEntities[index].activityEnd ?? "",
                                      status: status,
                                      backgroundColor: controller.getBackgroundColor(status),
                                      borderColor: controller.getBorderColor(status),
                                      textColor: controller.getTextColor(status),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider(
                                    thickness: 8,
                                    indent: 0,
                                    endIndent: 8,
                                    color: AppColors.transparent,
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.1,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.trueWhiteColor,
            onPressed: () {},
            child: const Icon(
              Icons.add,
              color: AppColors.greenColor,
              size: 50,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ));
  }

}
