import 'package:earthquake_app/features/data/models/features_model.dart';
import 'package:earthquake_app/features/data/models/metadata_model.dart';
import 'package:earthquake_app/features/domain/entities/earth_quake_entity.dart';

class EarthQuakeModel extends EarthQuakeEntity {
  EarthQuakeModel(
      {required type, required metadata, required features, required bbox})
      : super(type: type, metadata: metadata, features: features, bbox: bbox);

  factory EarthQuakeModel.fromJson(Map<String, dynamic> json) =>
      EarthQuakeModel(
          type: json['type'],
          metadata: MetadataModel.fromJson(json['metadata']),
          features: json['features']
              .map<FeaturesModel>((map) => FeaturesModel.fromJson(map))
              .toList(),
          bbox: json['bbox'].cast<double>());

  Map<String, dynamic> toJson() =>
      {'type': type, 'metadata': metadata, 'features': features, 'bbox': bbox};
}
