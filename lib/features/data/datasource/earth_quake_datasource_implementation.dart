import 'package:dio/dio.dart';
import 'package:earthquake_app/core/usecase/errors/exceptions.dart';
import 'package:earthquake_app/core/utils/date_input_converter.dart';
import 'package:earthquake_app/features/data/datasource/earth_quake_datasource.dart';
import 'package:earthquake_app/features/data/datasource/endpoints/earth_quake_endpoint.dart';
import 'package:earthquake_app/features/data/models/earth_quake_model.dart';
import 'package:earthquake_app/features/domain/entities/earth_quake_entity.dart';

class EarthQuakeDatasourceImplementation implements IEarthQuakeDatasource {
  final DateInputConverter converter;
  final Dio client;

  EarthQuakeDatasourceImplementation(
      {required this.converter, required this.client});

  @override
  Future<EarthQuakeEntity> getQueryMinMagnitude(double minMagnitude) async {
    final response =
        await client.get(EarthQuakeEndPoint.getQueryMinMagnitude(minMagnitude));
    if (response.statusCode == 200) {
      return EarthQuakeModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<EarthQuakeEntity> getQueryStartAndEndTime(
      DateTime startTime, DateTime endTime) async {
    final dateConvertedStartTime = converter.format(startTime);
    final dateConvertedEndTime = converter.format(endTime);

    final response = await client.get(
        EarthQuakeEndPoint.getQueryStartAndEndTime(
            dateConvertedStartTime, dateConvertedEndTime));
    if (response.statusCode == 200) {
      return EarthQuakeModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<EarthQuakeEntity> getQueryStartTime(DateTime startTime) async {
    final dateConvertedStartTime = converter.format(startTime);

    final response = await client
        .get(EarthQuakeEndPoint.getQueryStartTime(dateConvertedStartTime));
    if (response.statusCode == 200) {
      return EarthQuakeModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<EarthQuakeEntity> getResume() async {
    final response = await client.get(EarthQuakeEndPoint.getResume());
    if (response.statusCode == 200) {
      return EarthQuakeModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
