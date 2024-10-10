import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import '../../entities/authentication_entities/authentication_entity.dart';
import '../../params/authentication_params/authentication_params.dart';

abstract class AuthenticationRepository{

  Future<Either<ApplicationError, AuthenticationEntity>> authentication(AuthenticationParams authenticationParams);
}