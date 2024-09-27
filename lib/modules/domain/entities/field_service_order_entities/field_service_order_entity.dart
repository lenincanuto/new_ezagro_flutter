import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/agricultural_entities/agricultural_activity_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/company_entities/company_history_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/contract_entities/contract_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/cost_center_entities/cost_center_history_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/employee_entities/employee_history_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/farm_entities/farm_history_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/field_service_order_entities/field_service_order_type_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/inventory_entities/inventory_history_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/machine_implement_entities/machine_implement_history_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/pest_entities/pest_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/plot_entities/plot_history_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/products_entities/product_usage_recommendation_entity.dart';

import '../crop_entities/crop_diversity_history_entity.dart';

class FieldServiceOrderEntity extends Equatable {
  final int id;
  final String activityStart;
  final String activityEnd;
  final FarmHistoryEntity farm;
  final List<PlotHistoryEntity> plots;
  final double areaTotal;
  final CropDiversityHistoryEntity cropDiversity;
  final List<MachineImplementHistoryEntity> machineImplements;
  final List<InventoryHistoryEntity> inventories;
  final List<ProductUsageRecommendationEntity> productRecommendations;
  final AgriculturalActivityEntity agriculturalActivity;
  final CostCenterHistoryEntity costCenter;
  final String expectedStartDate;
  final String expectedEndDate;
  final EmployeeHistoryEntity employeeActivityHolder;
  final List<EmployeeHistoryEntity> employees;
  final List<CompanyHistoryEntity> companies;
  final ContractEntity contract;
  final String description;
  final double activityValue;
  final String status;
  final FieldServiceOrderTypeEntity fieldServiceOrderType;
  final List<PestEntity> pests;

  const FieldServiceOrderEntity({
    required this.id,
    required this.activityStart,
    required this.activityEnd,
    required this.farm,
    required this.plots,
    required this.areaTotal,
    required this.cropDiversity,
    required this.machineImplements,
    required this.inventories,
    required this.productRecommendations,
    required this.agriculturalActivity,
    required this.costCenter,
    required this.expectedStartDate,
    required this.expectedEndDate,
    required this.employeeActivityHolder,
    required this.employees,
    required this.companies,
    required this.contract,
    required this.description,
    required this.activityValue,
    required this.status,
    required this.fieldServiceOrderType,
    required this.pests,
  });

  @override
  List<Object?> get props => [
        id,
        activityStart,
        activityEnd,
        farm,
        plots,
        areaTotal,
        cropDiversity,
        machineImplements,
        inventories,
        productRecommendations,
        agriculturalActivity,
        costCenter,
        expectedStartDate,
        expectedEndDate,
        employeeActivityHolder,
        employees,
        companies,
        contract,
        description,
        activityValue,
        status,
        fieldServiceOrderType,
        pests,
      ];
}