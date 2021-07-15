import 'package:dio/dio.dart';
import 'package:earthquake_app/core/errors/exception.dart';
import 'package:earthquake_app/core/utils/date_input_converter.dart';
import 'package:earthquake_app/features/data/datasources/earth_quake_datasource.dart';
import 'package:earthquake_app/features/data/datasources/earth_quase_datasource_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../mocks/earth_quake_model_mock.dart';
import '../../../mocks/earth_quake_resume_mock.dart';

class MockHttpClient extends Mock implements Dio {}

class MockDateInputConverter extends Mock implements DateInputConverter {}

void main() {
  late EarthQuakeDataSourceImplementation datasource;
  late Dio client;
  late DateInputConverter converter;

  setUp(() {
    client = MockHttpClient();
    converter = MockDateInputConverter();
    datasource = EarthQuakeDataSourceImplementation(
        client: client, converter: converter);
  });

  void sucessMock(String urlExpected, String? date) {
    if (date != null)
      when(() => converter.format(date: any())).thenReturn(date);
    when(() => client.get(any())).thenAnswer((invocation) async => Response(
        requestOptions: RequestOptions(path: urlExpected),
        data: tEarthQuakeMockResume,
        statusCode: 200));
  }

  void failMock(String urlExpected, String? date) {
    if (date != null)
      when(() => converter.format(date: any())).thenReturn(date);
    when(() => client.get(any())).thenAnswer((invocation) async => Response(
        requestOptions: RequestOptions(path: urlExpected),
        data: "Estamos com problemas internos",
        statusCode: 400));
  }

  group('group test get resume API', () {
    final urlExpected =
        "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson";

    test('should call the get method with corret url', () async {
      sucessMock(urlExpected, null);

      await datasource.getResume();

      verify(() => client.get(urlExpected)).called(1);
    });

    test('should throw server exception when is incorret', () async {
      failMock(urlExpected, null);

      final result = datasource.getResume();

      expect(() => result, throwsA(ServerException()));
    });
  });

  group('group test get query min magnitude', () {
    final urlExpected =
        "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&minmagnintude=5.0";

    test('should call the get method with url corret and params', () async {
      sucessMock(urlExpected, null);

      await datasource.getQueryMinMagnitude(5.0);

      verify(() => client.get(urlExpected)).called(1);
    });

    test(
        'should return Server exception when call the get method with incorret url and params',
        () async {
      failMock(urlExpected, null);

      final result = datasource.getQueryMinMagnitude(5.0);

      expect(() => result, throwsA(ServerException()));
    });
  });

  group('group test get query start time', () {
    final urlExpected =
        "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2021-02-02";

    final dateTimeStart = DateTime(2021, 02, 02);

    final tDateTimeString = "2021-02-02";

    test(
        'should return earth model when call the get method with url corret and params',
        () async {
      sucessMock(urlExpected, tDateTimeString);

      final result = await datasource.getQueryStartTime(dateTimeStart);

      expect(result, tEarthQuakeModel);
      verify(() => converter.format(date: dateTimeStart)).called(1);
    });

    test(
        'should return Server exception when call the get method with incorret url and params',
        () async {
      failMock(urlExpected, tDateTimeString);

      final result = datasource.getQueryMinMagnitude(5.0);

      expect(() => result, throwsA(ServerException()));
    });
  });
}
