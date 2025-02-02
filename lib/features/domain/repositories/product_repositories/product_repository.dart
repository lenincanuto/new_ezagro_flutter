import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_entity.dart';

import '../../../../core/usecase/usecase.dart';

abstract class ProductRepository {
  Future<Either<ApplicationError, PaginationEntity<ProductEntity>>> getProducts(
      NoParams noParams);
}
