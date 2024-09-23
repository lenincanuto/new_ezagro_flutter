import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/mock_model/mock_model.dart';
import '../../models/paginatino_model/pagination_model.dart';

abstract class PlotsDatasource {
  Future<PaginationModel<MockModel>> getPlots(NoParams noParams);

}