import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';

class MachineryImplementsPage extends StatelessWidget {

  static const String routePath = AppRoutes.appMachineryPage;

  static navigate() =>
      Modular.to.navigate(routePath);

  static push(ArgParams args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  const MachineryImplementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    //final controller = Modular.get<MachineryController>();
    return BackgroundWidget(
        scrollable: true,
        appBar: const CustomAppBarWidget(
          appBarType: AppBarType.hamburgerAndTitle,
          title: AppStringsPortuguese.machineryScreenTitle,
        ),
        child: Observer(
          builder: (context) =>
              Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    ],),),
        ));
  }

}