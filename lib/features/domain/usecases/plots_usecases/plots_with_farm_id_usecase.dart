import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/plot_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

abstract class PlotsWithFarmIdUsecase
    implements Usecase<PaginationEntity<PlotEntity>, ArgParams> {
  @override
  Future<Either<ApplicationError, PaginationEntity<PlotEntity>>> call(
      ArgParams params);
}