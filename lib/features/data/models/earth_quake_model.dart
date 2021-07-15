import 'package:earthquake_app/features/domain/entities/earth_quake_entity.dart';

class EarthQuakeModel extends EarthQuakeEntity {
  EarthQuakeModel(
      {required String type,
      required metadata,
      required features,
      required bbox})
      : super(type: type, metadata: metadata, features: features, bbox: bbox);

  factory EarthQuakeModel.fromJson(Map<String, dynamic?> json) =>
      EarthQuakeModel(
          type: json['type'],
          metadata: json['metadata'],
          features: json['features'],
          bbox: json['bbox']);

  Map<String, dynamic> toJson() =>
      {'type': type, 'metadata': metadata, 'features': features, 'bbox': bbox};
}
