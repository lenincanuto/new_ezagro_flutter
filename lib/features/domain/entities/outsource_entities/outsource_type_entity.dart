import 'package:equatable/equatable.dart';

class OutsourceTypeEntity extends Equatable {
  final int id;
  final String? name;

  const OutsourceTypeEntity({required this.id, this.name});

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
