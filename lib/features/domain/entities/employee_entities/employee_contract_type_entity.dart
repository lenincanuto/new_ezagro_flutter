import 'package:equatable/equatable.dart';

class EmployeeContractTypeEntity extends Equatable{
  final int id;
  final String name;
  final String description;

  const EmployeeContractTypeEntity({
    required this.id,
    required this.name,
    required this.description,
});

  @override
  List<Object?> get props => [
    id,
    name,
    description,
  ];
}