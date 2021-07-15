// import 'package:dio/dio.dart';
// import 'package:earthquake_app/core/utils/date_input_converter.dart';
// import 'package:earthquake_app/features/data/datasource/earth_quake_datasource.dart';
// import 'package:earthquake_app/features/data/datasource/earth_quake_datasource_implementation.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// import '../../../mocks/earth_quake_mock.dart';

// class MockDateInputConverter extends Mock implements DateInputConverter {}

// class MockCLient extends Mock implements Dio {}

// void main() {
//   late EarthQuakeDatasourceImplementation datasource;
//   late DateInputConverter converter;
//   late Dio client;

//   setUp(() {
//     converter = MockDateInputConverter();
//     client = MockCLient();
//     datasource = EarthQuakeDatasourceImplementation(
//         converter: converter, client: client);
//   });

//   final tDateTime = DateTime(2020, 2, 2);
//   final tDateTimeString = '2020-02-02';
//   final urlMinMag = "";
//   final getResume = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson";
//   final getQueryStartTime =
//       "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2020-02-02";
//   final getQueryStartAndEndTime(String startTime, String endTime) =>
//       "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=$startTime&endtime=$endTime";
//   static String getQueryMinMagnitude(double minMagnitude) =>
//       "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&minmagnitude=$minMagnitude";
// }



//   void successMock(String path, DateInputConverter? converter) {
//     if (converter != null)
//       when(() => converter.format(any())).thenReturn(tDateTimeString);
//     when(() => client.get(any())).thenAnswer((_) async => Response(
//         requestOptions: RequestOptions(path: path),
//         data: tEarthQuakeMock,
//         statusCode: 200));
//   }

//   void failMock(String path, DateInputConverter? converter) {
//     if (converter != null)
//       when(() => converter.format(any())).thenReturn(tDateTimeString);
//     when(() => client.get(any())).thenAnswer((_) async => Response(
//         requestOptions: RequestOptions(path: path),
//         data: "Algo de errado está acontencendo",
//         statusCode: 400));
//   }

//   group('test of method get query min magnitude', () {
//     test('should call the get method with correct url', () async {
//       successMock(
//           "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&minmagnitude=4.0",
//           converter);

//       await datasource.getQueryMinMagnitude(4.0);

//       verify(() => client.get(path))
//     });
//   });
// }
