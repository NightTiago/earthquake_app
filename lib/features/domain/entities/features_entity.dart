import 'package:earthquake_app/features/domain/entities/geometry_entity.dart';
import 'package:earthquake_app/features/domain/entities/properties_entity.dart';
import 'package:equatable/equatable.dart';

class FeaturesEntity extends Equatable {
  final String type;
  final PropertiesEntity properties;
  final GeometryEntity geometry;
  final String id;

  FeaturesEntity(
      {required this.type,
      required this.properties,
      required this.geometry,
      required this.id});

  @override
  List<Object?> get props => [type, properties, geometry, id];
}
