import 'dart:io';

import 'package:dio/dio.dart';
import 'package:earthquake_app/core/errors/exception.dart';
import 'package:earthquake_app/core/utils/date_input_converter.dart';
import 'package:earthquake_app/features/data/datasources/earth_quake_datasource.dart';
import 'package:earthquake_app/features/data/datasources/endpoints/eath_quake_endpoint.dart';
import 'package:earthquake_app/features/data/models/earth_quake_model.dart';

class EarthQuakeDataSourceImplementation implements IEarthQuakeDataSource {
  final Dio client;
  final DateInputConverter converter;

  EarthQuakeDataSourceImplementation(
      {required this.client, required this.converter});

  @override
  Future<EarthQuakeModel> getResume() async {
    final response = await client.get(EarthQuakeEndPoint.resume());
    if (response.statusCode == 200) {
      return EarthQuakeModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<EarthQuakeModel> getQueryMinMagnitude(double minMagnitude) async {
    final response = await client
        .get(EarthQuakeEndPoint.queryMinMagnitude(minMagnitude.toString()));
    if (response.statusCode == 200) {
      return EarthQuakeModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<EarthQuakeModel> getQueryStartAndEndTime(
      DateTime startTime, DateTime endTime) async {
    final dataStartConverted = converter.format(date: startTime);
    final dataEndConverted = converter.format(date: endTime);
    final response = await client.get(EarthQuakeEndPoint.queryStartAndEndTime(
        dataStartConverted, dataEndConverted));
    if (response.statusCode == 200) {
      return EarthQuakeModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<EarthQuakeModel> getQueryStartTime(DateTime startTime) async {
    final dataStartConverted = converter.format(date: startTime);
    final response =
        await client.get(EarthQuakeEndPoint.queryStartTime(dataStartConverted));
    if (response.statusCode == 200) {
      return EarthQuakeModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
