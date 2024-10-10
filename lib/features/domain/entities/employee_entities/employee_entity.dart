import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/address_entities/address_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/company_entities/company_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/contract_entities/contract_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/cost_center_entities/cost_center_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/dependent_entities/dependent_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/email_entities/email_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_contract_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_measure_and_performance_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_status_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/farm_entities/farm_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/multipart_file_custom_entities/multipart_file_custom_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/rural_producer_entities/rural_producer_entity.dart';

import '../account_entities/account_entity.dart';

class EmployeeEntity extends Equatable {
  final int id;
  final AddressEntity address;
  final AccountEntity account;
  final String employeeName;
  final FarmEntity farm;
  final CompanyEntity company;
  final RuralProducerEntity ruralProducer;
  final EmailEntity email;
  final CostCenterEntity costCenter;
  final List<DependentEntity> dependents;
  final String cpf;
  final String pisPasep;
  final String insuranceCode;
  final String ceiNumber;
  final String motherName;
  final String rg;
  final EmployeeStatusEntity status;
  final String dtBirth;
  final EmployeeContractEntity contract;
  final ContractEntity healthPlanContract;
  final String securityCode;
  final String sindicalCode;
  final List<EmployeeMeasureAndPerformanceEntity> measureAndPerformances;
  final String description;
  final List<MultipartFileCustomEntity> attachments;
  final String attachmentNames;
  final String phoneNumber;
  final String whatsappNumber;

  const EmployeeEntity({
    required this.id,
    required this.address,
    required this.account,
    required this.employeeName,
    required this.farm,
    required this.company,
    required this.ruralProducer,
    required this.email,
    required this.costCenter,
    required this.dependents,
    required this.cpf,
    required this.pisPasep,
    required this.insuranceCode,
    required this.ceiNumber,
    required this.motherName,
    required this.rg,
    required this.status,
    required this.dtBirth,
    required this.contract,
    required this.healthPlanContract,
    required this.securityCode,
    required this.sindicalCode,
    required this.measureAndPerformances,
    required this.description,
    required this.attachments,
    required this.attachmentNames,
    required this.phoneNumber,
    required this.whatsappNumber,
});

  @override
  List<Object?> get props => [
    id,
    address,
    account,
    employeeName,
    farm,
    company,
    ruralProducer,
    email,
    costCenter,
    dependents,
    cpf,
    pisPasep,
    insuranceCode,
    ceiNumber,
    motherName,
    rg,
    status,
    dtBirth,
    contract,
    healthPlanContract,
    securityCode,
    sindicalCode,
    measureAndPerformances,
    description,
    attachments,
    attachmentNames,
    phoneNumber,
    whatsappNumber,
      ];
}