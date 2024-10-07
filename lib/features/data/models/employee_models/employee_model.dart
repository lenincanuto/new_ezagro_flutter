import 'dart:convert';
import '../../../domain/entities/employee_entities/employee_entity.dart';
import '../account_models/account_model.dart';
import '../address_models/address_model.dart';
import '../company_models/company_model.dart';
import '../contract_models/contract_model.dart';
import '../cost_center_models/cost_center_model.dart';
import '../dependent_model.dart';
import '../email_model/email_model.dart';
import '../farm_models/farm_model.dart';
import '../multipart_file_custom_model/multipart_file_custom_model.dart';
import '../rural_producer_models/rural_producer_model.dart';
import 'employee_contract_model.dart';
import 'employee_measure_and_performance_model.dart';
import 'employee_status-model.dart';

class EmployeeModel extends EmployeeEntity {
  const EmployeeModel({
    required super.id,
    required super.address,
    required super.account,
    required super.employeeName,
    required super.farm,
    required super.company,
    required super.ruralProducer,
    required super.email,
    required super.costCenter,
    required super.dependents,
    required super.cpf,
    required super.pisPasep,
    required super.insuranceCode,
    required super.ceiNumber,
    required super.motherName,
    required super.rg,
    required super.status,
    required super.dtBirth,
    required super.contract,
    required super.healthPlanContract,
    required super.securityCode,
    required super.sindicalCode,
    required super.measureAndPerformances,
    required super.description,
    required super.attachments,
    required super.attachmentNames,
    required super.phoneNumber,
    required super.whatsappNumber,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'address': (address as AddressModel).toMap(),
    'account': (account as AccountModel).toMap(),
    'employeeName': employeeName,
    'farm': (farm as FarmModel).toMap(),
    'company': (company as CompanyModel).toMap(),
    'ruralProducer':(ruralProducer as RuralProducerModel).toMap(),
    'email': (email as EmailModel).toMap(),
    'costCenter': (costCenter as CostCenterModel).toMap(),
    'dependents':
    dependents.map((e) => (e as DependentModel).toMap()).toList(),
    'cpf': cpf,
    'pisPasep': pisPasep,
    'insuranceCode': insuranceCode,
    'ceiNumber': ceiNumber,
    'motherName': motherName,
    'rg': rg,
    'status': (status as EmployeeStatusModel).toMap(),
    'dtBirth': dtBirth,
    'contract': (contract as EmployeeContractModel).toMap(),
    'healthPlanContract': (healthPlanContract as ContractModel).toMap(),
    'securityCode': securityCode,
    'sindicalCode': sindicalCode,
    'measureAndPerformances': measureAndPerformances
        .map((e) => (e as EmployeeMeasureAndPerformanceModel).toMap())
        .toList(),
    'description': description,
    'attachments': attachments
        .map((e) => (e as MultipartFileCustomModel).toMap())
        .toList(),
    'attachmentNames': attachmentNames,
    'phoneNumber': phoneNumber,
    'whatsappNumber': whatsappNumber,
  };

  factory EmployeeModel.fromMap(Map<String, dynamic> map) => EmployeeModel(
    id: map['id'],
    address: AddressModel.fromMap(map['address']),
    account: AccountModel.fromMap(map['account']),
    employeeName: map['employeeName'],
    farm: FarmModel.fromMap(map['farm']),
    company: CompanyModel.fromMap(map['company']),
    ruralProducer: RuralProducerModel.fromMap(map['ruralProducer']),
    email: EmailModel.fromMap(map['email']),
    costCenter: CostCenterModel.fromMap(map['costCenter']),
    dependents: List<DependentModel>.from(
        map['dependents']?.map((x) => DependentModel.fromMap(x))),
    cpf: map['cpf'],
    pisPasep: map['pisPasep'],
    insuranceCode: map['insuranceCode'],
    ceiNumber: map['ceiNumber'],
    motherName: map['motherName'],
    rg: map['rg'],
    status: EmployeeStatusModel.fromMap(map['status']),
    dtBirth: map['dtBirth'],
    contract: EmployeeContractModel.fromMap(map['contract']),
    healthPlanContract: ContractModel.fromMap(map['healthPlanContract']),
    securityCode: map['securityCode'],
    sindicalCode: map['sindicalCode'],
    measureAndPerformances: List<EmployeeMeasureAndPerformanceModel>.from(
        map['measureAndPerformances']
            ?.map((x) => EmployeeMeasureAndPerformanceModel.fromMap(x))),
    description: map['description'],
    attachments: List<MultipartFileCustomModel>.from(
        map['attachments']?.map((x) => MultipartFileCustomModel.fromMap(x))),
    attachmentNames: map['attachmentNames'],
    phoneNumber: map['phoneNumber'],
    whatsappNumber: map['whatsappNumber'],
  );

  String toJson() => json.encode(toMap());

  factory EmployeeModel.fromJson(String source) =>
      EmployeeModel.fromMap(json.decode(source));
}