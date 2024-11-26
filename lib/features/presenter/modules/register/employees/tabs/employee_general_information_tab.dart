import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/mult_info_card/mult_info_card.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/three_info_card/three_info_card.dart';
import '../../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../widgets/single_info_card/single_info_card.dart';

class EmployeeGeneralInformationTab extends StatelessWidget {

  const EmployeeGeneralInformationTab({super.key});

  @override
  Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BoldTitleInfoCard(titleOne: AppStringsPortuguese.employeeNameLabel, dataOne: "Pedro Costa"),
            const SizedBox(height: 10,),
            BoldTitleInfoCard(titleOne: AppStringsPortuguese.cpfLabel, dataOne: "000.000.000-00"),
            const SizedBox(height: 10,),
            BoldTitleInfoCard(titleOne: AppStringsPortuguese.rgLabel, dataOne: "00.000.000-00"),
            const SizedBox(height: 10,),
            BoldTitleInfoCard(titleOne: AppStringsPortuguese.pisPasepLabel, dataOne: "000.00000.00-0"),
            const SizedBox(height: 10,),
            ThreeInfoCard(title: AppStringsPortuguese.contactLabel, info1: (AppStringsPortuguese.employeePhoneLabel, "(xx) xxxx-xxx"), info2: (AppStringsPortuguese.employeeWhatsAppLabel, "(xx) xxxx-xxxx"), info3: (AppStringsPortuguese.employeeEmailLabel, "pedrocosta@email.com")),
            const SizedBox(height: 10,),
            MultInfoCard(
                title: AppStringsPortuguese.addressLabel,
                columnOneData: [(AppStringsPortuguese.addressCepLabel, "00000-000"),(AppStringsPortuguese.addressStreetLabel, "Rua das Nações, 124"),(AppStringsPortuguese.addressStateLabel, "São Paulo")],
                columnTwoData: [(AppStringsPortuguese.addressCityLabel, "São Paulo"),(AppStringsPortuguese.addressNeighborhoodLabel, "Ipiranga"),(AppStringsPortuguese.addressCountryLabel, "Brasil")]),
            const SizedBox(height: 10,),
            MultInfoCard(
                title: AppStringsPortuguese.bankDataLabel,
                columnOneData: [(AppStringsPortuguese.employeeAccountTypeLabel, "Corrente"),(AppStringsPortuguese.employeeAgencyLabel, "0001"),(AppStringsPortuguese.employeePixKeyTypeLabel, "CPF")],
                columnTwoData: [(AppStringsPortuguese.employeeBankLabel, "Nu Pagamentos"),(AppStringsPortuguese.employeeAccountLabel, "00000-00"),(AppStringsPortuguese.employeePixKeyLabel, "000.000.000-00")]),
            const SizedBox(height: 25,),
            MultInfoCard(
                title: AppStringsPortuguese.employeeContractLabel,
                columnOneData: [(AppStringsPortuguese.employeeAdmissionDateLabel, "02/03/2024"),(AppStringsPortuguese.employeePositionLabel, "Operador"),(AppStringsPortuguese.employeeContractTypeLabel, "Temporário"), (AppStringsPortuguese.employeeBaseSalaryLabel, "R\$2.000,00"), (AppStringsPortuguese.employeeFiringReasonLabel, "")],
                columnTwoData: [(AppStringsPortuguese.employeeWorkerIdLabel, "000.0000.000-00"),(AppStringsPortuguese.employeeDepartmentLabel, "Agrícola"),(AppStringsPortuguese.employeeShiftLabel, "Matutino"), (AppStringsPortuguese.employeeFiringDateLabel, "08/08/2024")]),
            const SizedBox(height: 10,)
          ],),
      );
  }


}