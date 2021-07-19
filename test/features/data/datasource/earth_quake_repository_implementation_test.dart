import 'package:dio/dio.dart';
import 'package:earthquake_app/core/usecase/errors/exceptions.dart';
import 'package:earthquake_app/core/utils/date_input_converter.dart';
import 'package:earthquake_app/features/data/datasource/earth_quake_datasource.dart';
import 'package:earthquake_app/features/data/datasource/earth_quake_datasource_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/earth_quake_mock.dart';
import '../../../mocks/earth_quake_model_mock.dart';

class MockDateInputConverter extends Mock implements DateInputConverter {}

class MockCLient extends Mock implements Dio {}

void main() {
  late EarthQuakeDatasourceImplementation datasource;
  late DateInputConverter converter;
  late Dio client;

  setUp(() {
    converter = MockDateInputConverter();
    client = MockCLient();
    datasource = EarthQuakeDatasourceImplementation(
        converter: converter, client: client);
  });

  final tDateStartTime = DateTime(2020, 2, 2);
  final tDateEndTime = DateTime(2021, 2, 2);
  final tDateTimeString = '2020-02-02';
  final getResume =
      "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson";
  final getQueryStartTime =
      "https://earthquake.usgs.go/fdsnws/event/1/query?format=geojson&starttime=2020-02-02";
  final getQueryStartAndEndTime =
      "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2020-02-02&endtime=2021-02-02";
  final getQueryMinMagnitude =
      "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&minmagnitude=5.0";

  void successMock(String path) {
    when(() => converter.format(any())).thenReturn(tDateTimeString);
    when(() => client.get(any())).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: path),
        data: tEarthQuakeMock,
        statusCode: 200));
  }

  void failMock(String path) {
    when(() => converter.format(any())).thenReturn(tDateTimeString);
    when(() => client.get(any())).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: path),
        data: "Algo de errado está acontencendo",
        statusCode: 400));
  }

  group('test of method get query min magnitude', () {
    test('should call the get method with correct url', () async {
      successMock(getQueryMinMagnitude);

      await datasource.getQueryMinMagnitude(5.0);

      verify(() => client.get(getQueryMinMagnitude)).called(1);
    });

    test('should return earth quake model when call the get method', () async {
      successMock(getQueryMinMagnitude);

      final result = await datasource.getQueryMinMagnitude(5.0);

      expect(result, tEarthQuakeModelMock);
    });

    test('should throw a ServerExcepetion when the call is unccessful',
        () async {
      failMock(getQueryMinMagnitude);

      final result = datasource.getQueryMinMagnitude(5.0);

      expect(result, throwsA(ServerException()));
    });
  });

  group('test of method get query start time', () {
    test('should return earth quake model when call the get method', () async {
      successMock(getQueryStartTime);

      final result = await datasource.getQueryStartTime(tDateStartTime);

      expect(result, tEarthQuakeModelMock);
      verify(() => converter.format(tDateStartTime)).called(1);
    });

    test('should throw a ServerException when the call is unccessful',
        () async {
      failMock(getQueryStartTime);

      final result = datasource.getQueryStartTime(tDateStartTime);

      expect(result, throwsA(ServerException()));
    });
  });

  group('test of method get query start and end time', () {
    test('should return earth quake model when call the get method', () async {
      successMock(getQueryStartTime);

      final result = await datasource.getQueryStartAndEndTime(
          tDateStartTime, tDateEndTime);

      expect(result, tEarthQuakeModelMock);
      verify(() => converter.format(tDateStartTime)).called(1);
      verify(() => converter.format(tDateEndTime)).called(1);
    });

    test('should throw a ServerException when the call is unccessful',
        () async {
      failMock(getQueryStartTime);

      final result =
          datasource.getQueryStartAndEndTime(tDateStartTime, tDateEndTime);

      expect(result, throwsA(ServerException()));
    });
  });
}
