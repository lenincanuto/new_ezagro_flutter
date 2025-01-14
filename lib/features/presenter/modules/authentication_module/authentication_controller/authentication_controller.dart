import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/core/extensions/unmask_text_field_extension.dart';
import 'package:new_ezagro_flutter/core/local_storage/local_storage_client.dart';
import 'package:new_ezagro_flutter/core/local_storage/local_storage_item.dart';
import 'package:new_ezagro_flutter/design_system/widgets/snackbars/custon_snack_bar_widget.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/authentication_usecases/recover_password_usecase/recover_password_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/authentication_usecases/update_password/update_password_usecase.dart';

import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../domain/entities/authentication_entities/authentication_entity.dart';
import '../../../../domain/params/authentication_params/authentication_params.dart';
import '../../../../domain/usecases/authentication_usecases/authenticate_usecase/authenticate_usecase.dart';

part 'authentication_controller.g.dart';

class AuthenticationController = AuthenticationControllerAbstract with _$AuthenticationController;

abstract class AuthenticationControllerAbstract with Store {
  @observable
  bool isLoading = false;

  @observable
  String token = '';

  @observable
  String name = '';

  @observable
  String username = '';

  @observable
  String password = '';

  @observable
  String retypePassword = '';

  @observable
  String temporaryPassword = '';

  @observable
  String accessStatus = '';

  @observable
  String errorMessage = '';

  Future authenticate(BuildContext context) async {
    isLoading = true;

    final authenticationUsecase = Modular.get<AuthenticateUsecase>();

    final result = await authenticationUsecase(
        AuthenticationParams(password: password, username: username.unmask));

    result.fold((error) {
      errorMessage = error.friendlyMessage;
      CustomSnackBarWidget.show(SnackBarType.error, context, 'Usuário ou senha incorretos!');
    }, (success) async {
      // name = success.employee?.employeeName ?? '';
      token = success.data!.token!;
      // accessStatus = success.firstAccessVerification!;

      saveToken(success.data!);
    });

    isLoading = false;
  }

  Future<bool> recoverPassword(BuildContext context) async {
    isLoading = true;
    bool isSuccess = false;

    final recoverPasswordUsecase = Modular.get<RecoverPasswordUsecase>();

    final result = await recoverPasswordUsecase(AuthenticationParams(username: username.unmask));
    result.fold((error) async {
      errorMessage = error.friendlyMessage;
      CustomSnackBarWidget.show(SnackBarType.error, context, 'Usuário ou senha incorretos!');
      isSuccess =  true;
    }, (success) async {
      debugPrint('Envio efetuado com sucesso');
      debugPrint(success.toString());
      isSuccess =  false;
    });
    isLoading = false;
    return isSuccess;
  }

  Future updatePassword(BuildContext context) async {
    isLoading = true;

    final updatePasswordUsecase = Modular.get<UpdatePasswordUsecase>();

    final result = await updatePasswordUsecase(
        AuthenticationParams(username: username.unmask, password: password));

    result.fold((error) {
      errorMessage = error.friendlyMessage;
    }, (success) {
      CustomSnackBarWidget.show(SnackBarType.success, context, 'Senha alterada com sucesso!');
    });

    isLoading = false;
  }

  bool comparePasswords(String password, String retypedPassword) {
    if (password.compareTo(retypedPassword) == 0) {
      return true;
    } else {

      return false;
    }
  }

  void saveToken(AuthenticationEntity success) async {
    final localStorage =
        Modular.get<LocalStorageClient>(key: AppStringsPortuguese.storageTypeSecure);

    await localStorage.writeData(
        LocalStorageItem(key: AppStringsPortuguese.idKey, value: success.user!.id.toString()));
    await localStorage.writeData(
        LocalStorageItem(key: AppStringsPortuguese.tokenKey, value: success.token.toString()));

    //Não possui mais o Nome do usuário na entidade UserEntity.


    // await localStorage.writeData(LocalStorageItem(
    //     key: AppStringsPortuguese.nameKey, value: success.user.));
  }
}
