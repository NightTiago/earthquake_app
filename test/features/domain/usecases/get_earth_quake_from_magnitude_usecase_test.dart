import 'package:dartz/dartz.dart';
import 'package:earthquake_app/core/usecase/errors/failures.dart';
import 'package:earthquake_app/features/domain/entities/earth_quake_entity.dart';
import 'package:earthquake_app/features/domain/repositories/earth_quake_repository.dart';
import 'package:earthquake_app/features/domain/usecases/get_earth_quake_from_magnitude_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/earth_quake_entity_mock.dart';

class MockEarthQuakeRepository extends Mock implements IEarthQuakeRepository {}

void main() {
  late GetEarthQuakeFromMagnitudeUsecase usecase;
  late IEarthQuakeRepository repository;

  setUp(() {
    repository = MockEarthQuakeRepository();
    usecase = GetEarthQuakeFromMagnitudeUsecase(repository);
  });

  test('should get earth quake for a given date from the repository', () async {
    when(() => repository.getQueryMinMagnitude(5.0)).thenAnswer(
        (_) async => Right<Failure, EarthQuakeEntity>(tEarthQuakeEntityMock));

    final result = await usecase(5.0);

    expect(result, Right(tEarthQuakeEntityMock));
    verify(() => repository.getQueryMinMagnitude(5.0)).called(1);
  });

  test('should return Server Failure when dont success', () async {
    when(() => repository.getQueryMinMagnitude(5.0)).thenAnswer(
        (_) async => Left<Failure, EarthQuakeEntity>(ServerFailure()));

    final result = await usecase(5.0);

    expect(result, Left(ServerFailure()));
    verify(() => repository.getQueryMinMagnitude(5.0)).called(1);
  });

  test('should return null param when receive a null params', () async {
    final result = await usecase(null);

    expect(result, Left(NullParamFailure()));
    verifyNever(() => repository.getQueryMinMagnitude(5.0));
  });
}
