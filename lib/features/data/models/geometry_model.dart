import 'package:earthquake_app/features/domain/entities/geometry_entity.dart';

class GeometryModel extends GeometryEntity {
  GeometryModel({required type, required coordinates})
      : super(type: type, coordinates: coordinates);

  factory GeometryModel.fromJson(Map<String, dynamic> json) => GeometryModel(
      type: json['type'], coordinates: json['coordinates'].cast<double>());

  Map<String, dynamic> toJson() => {'type': type, 'coordinates': coordinates};
}
