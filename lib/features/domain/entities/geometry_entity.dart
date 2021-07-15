import 'package:equatable/equatable.dart';

class GeometryEntity extends Equatable {
  final String type;
  final List<double> coordinates;

  GeometryEntity({required this.type, required this.coordinates});

  @override
  List<Object?> get props => throw [type, coordinates];
}
