import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/products_models/product_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';

import '../../../models/pagination_model/pagination_model.dart';

abstract class ProductDatasource {
  Future<ResponseModel<PaginationModel<ProductModel>>> getProducts(NoParams noParams);
}