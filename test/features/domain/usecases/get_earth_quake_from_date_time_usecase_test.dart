import 'package:dartz/dartz.dart';
import 'package:earthquake_app/core/usecase/errors/failures.dart';
import 'package:earthquake_app/features/domain/entities/earth_quake_entity.dart';
import 'package:earthquake_app/features/domain/repositories/earth_quake_repository.dart';
import 'package:earthquake_app/features/domain/usecases/get_earth_quake_from_date_time_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/date_mock.dart';
import '../../../mocks/earth_quake_entity_mock.dart';

class MockEarthQuakeRepository extends Mock implements IEarthQuakeRepository {}

void main() {
  late GetEarthQuakeFromDateTimeUsecase usecase;
  late IEarthQuakeRepository repository;

  setUp(() {
    repository = MockEarthQuakeRepository();
    usecase = GetEarthQuakeFromDateTimeUsecase(repository);
    // registerFallbackValue<DateTime>(DateTime(2000));
  });

  group('test from date with start time', () {
    test('should return earth quake when call the get method with date start',
        () async {
      when(() => repository.getQueryStartTime(tDate)).thenAnswer(
          (invocation) async =>
              Right<Failure, EarthQuakeEntity>(tEarthQuakeEntityMock));

      final result = await usecase(tDate);

      expect(result, Right(tEarthQuakeEntityMock));
      verify(() => repository.getQueryStartTime(tDate)).called(1);
    });

    test('should return Server failure when start date had invalidate',
        () async {
      when(() => repository.getQueryStartTime(tDate))
          .thenAnswer((invocation) async => Left(ServerFailure()));

      final result = await usecase(tDate);

      expect(result, Left(ServerFailure()));
      verify(() => repository.getQueryStartTime(tDate)).called(1);
    });

    test('should return null params when call the get method with null params',
        () async {
      final result = await usecase(null);

      expect(result, Left(NullParamFailure()));
      verifyNever(() => repository.getQueryStartTime(tDate));
    });
  });

  group('test from date with start and end time', () {
    final tDateStart = DateTime(2021, 02, 02);
    final tDateEnd = DateTime(2022, 02, 02);
    test(
        'should return earth quake when call the get method with start and end date params',
        () async {
      when(() => repository.getQueryStartAndEndTime(tDateStart, tDateEnd))
          .thenAnswer((invocation) async =>
              Right<Failure, EarthQuakeEntity>(tEarthQuakeEntityMock));

      final result =
          await usecase.getQueryStartAndEndTime(tDateStart, tDateEnd);

      expect(result, Right(tEarthQuakeEntityMock));
      verify(() => repository.getQueryStartAndEndTime(tDateStart, tDateEnd));
    });

    test(
        'should return ServerFailure when call the get method with incorrect params',
        () async {
      when(() => repository.getQueryStartAndEndTime(tDateStart, tDateEnd))
          .thenAnswer((invocation) async => Left(ServerFailure()));

      final result =
          await usecase.getQueryStartAndEndTime(tDateStart, tDateEnd);

      expect(result, Left(ServerFailure()));
      verify(() => repository.getQueryStartAndEndTime(tDateStart, tDateEnd))
          .called(1);
    });

    test('should return NullParam when call the get method with null params',
        () async {
      final result = await usecase.getQueryStartAndEndTime(null, null);

      expect(result, Left(NullParamFailure()));
      verifyNever(
          () => repository.getQueryStartAndEndTime(tDateStart, tDateEnd));
    });
  });
}
