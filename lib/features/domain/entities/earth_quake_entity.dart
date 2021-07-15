import 'package:earthquake_app/features/domain/entities/features_entity.dart';
import 'package:earthquake_app/features/domain/entities/metadata_entity.dart';
import 'package:equatable/equatable.dart';

class EarthQuakeEntity extends Equatable {
  final String type;
  final MetadataEntity metadata;
  final List<FeaturesEntity> features;
  final List<double> bbox;

  EarthQuakeEntity(
      {required this.type,
      required this.metadata,
      required this.features,
      required this.bbox});

  @override
  List<Object?> get props => throw [type, metadata, features, bbox];
}
