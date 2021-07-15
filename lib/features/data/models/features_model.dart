import 'package:earthquake_app/features/data/models/geometry_model.dart';
import 'package:earthquake_app/features/data/models/properties_modeel.dart';
import 'package:earthquake_app/features/domain/entities/features_entity.dart';

class FeaturesModel extends FeaturesEntity {
  FeaturesModel(
      {required type, required properties, required geometry, required id})
      : super(type: type, properties: properties, geometry: geometry, id: id);

  factory FeaturesModel.fromJson(Map<String, dynamic> json) => FeaturesModel(
      type: json['type'],
      properties: PropertiesModel.fromJson(json['properties']),
      geometry: GeometryModel.fromJson(json['geometry']),
      id: json['id']);

  Map<String, dynamic> toJson() =>
      {'type': type, 'properties': properties, 'geometry': geometry, 'id': id};
}
