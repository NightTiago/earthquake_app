import 'package:dartz/dartz.dart';
import 'package:earthquake_app/core/usecase/errors/exceptions.dart';
import 'package:earthquake_app/core/usecase/errors/failures.dart';
import 'package:earthquake_app/features/data/datasource/earth_quake_datasource.dart';
import 'package:earthquake_app/features/data/repositories/earth_quake_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/earth_quake_model_mock.dart';

class MockEarthQuakeDatasource extends Mock implements IEarthQuakeDatasource {}

void main() {
  late EathQuakeRepositoryImplementation repository;
  late IEarthQuakeDatasource datasource;

  setUp(() {
    datasource = MockEarthQuakeDatasource();
    repository = EathQuakeRepositoryImplementation(datasource: datasource);
  });

  final tDateStart = DateTime(2021, 02, 02);
  final tDateEnd = DateTime(2021, 02, 03);

  group('test for the method get resume', () {
    test('should return earth quake model when call the method get resume',
        () async {
      when(() => datasource.getResume())
          .thenAnswer((invocation) async => tEarthQuakeModelMock);

      final result = await repository.getResume();

      expect(result, Right(tEarthQuakeModelMock));
      verify(() => datasource.getResume()).called(1);
    });

    test(
        'should return a server expection when call the method get with url incorrect',
        () async {
      when(() => datasource.getResume()).thenThrow(ServerException());

      final result = await repository.getResume();

      expect(result, Left(ServerFailure()));
    });
  });

  group('test for the method get min magnitude', () {
    test(
        'should return earth quake model when call the method get min magnitude',
        () async {
      when(() => datasource.getQueryMinMagnitude(5.0))
          .thenAnswer((invocation) async => tEarthQuakeModelMock);

      final result = await repository.getQueryMinMagnitude(5.0);

      expect(result, Right(tEarthQuakeModelMock));
      verify(() => datasource.getQueryMinMagnitude(5.0)).called(1);
    });

    test(
        'should return a server expection when call the method get with url incorrect',
        () async {
      when(() => datasource.getQueryMinMagnitude(5.0))
          .thenThrow(ServerException());

      final result = await repository.getQueryMinMagnitude(5.0);

      expect(result, Left(ServerFailure()));
    });
  });

  group('test for the method get start time', () {
    test('should return earth quake model when call the method get start time',
        () async {
      when(() => datasource.getQueryStartTime(tDateStart))
          .thenAnswer((invocation) async => tEarthQuakeModelMock);

      final result = await repository.getQueryStartTime(tDateStart);

      expect(result, Right(tEarthQuakeModelMock));
      verify(() => datasource.getQueryStartTime(tDateStart)).called(1);
    });

    test(
        'should return a server expection when call the method get with url incorrect',
        () async {
      when(() => datasource.getQueryStartTime(tDateStart))
          .thenThrow(ServerException());

      final result = await repository.getQueryStartTime(tDateStart);

      expect(result, Left(ServerFailure()));
    });
  });

  group('test for the method get start and end time', () {
    test(
        'should return earth quake model when call the method get start and end time',
        () async {
      when(() => datasource.getQueryStartAndEndTime(tDateStart, tDateEnd))
          .thenAnswer((invocation) async => tEarthQuakeModelMock);

      final result =
          await repository.getQueryStartAndEndTime(tDateStart, tDateEnd);

      expect(result, Right(tEarthQuakeModelMock));
      verify(() => datasource.getQueryStartAndEndTime(tDateStart, tDateEnd))
          .called(1);
    });

    test(
        'should return a server expection when call the method get with url incorrect',
        () async {
      when(() => datasource.getQueryStartAndEndTime(tDateStart, tDateEnd))
          .thenThrow(ServerException());

      final result =
          await repository.getQueryStartAndEndTime(tDateStart, tDateEnd);

      expect(result, Left(ServerFailure()));
    });
  });
}
