import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/farm_models/farm_model.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/farm_repositories/farm_repository.dart';

import '../../datasources/remote_datasource/farm_datasource/farm_datasource.dart';
import '../../models/pagination_model/pagination_model.dart';

class FarmRepositoryImpl implements FarmRepository {
  final FarmDatasource datasource;

  FarmRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, List<FarmModel>>>
  getAllFarms(NoParams noParams) async {
    try {
      final result = await datasource.getAllFarms(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$FarmRepositoryImpl.getAllFarms',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, PaginationModel<FarmModel>>>
      getSimplifiedFarms(NoParams noParams) async {
    try {
      final result = await datasource.getSimplifiedFarms(noParams);
      return Right(result.data!);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$FarmRepositoryImpl.getSimplifiedFarms',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, List<FarmModel>>>
  getCostCenterFarms(String costCenterId) async {
    try {
      final result = await datasource.getCostCenterFarmsById(costCenterId);
      return Right(result.data!);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$FarmRepositoryImpl.getCostCenterFarms',
          additionalInfo: stacktrace.toString()));
    }
  }
}
