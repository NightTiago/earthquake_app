import 'package:dartz/dartz.dart';
import 'package:earthquake_app/core/errors/exception.dart';
import 'package:earthquake_app/core/errors/failure.dart';
import 'package:earthquake_app/features/data/datasources/earth_quake_datasource.dart';
import 'package:earthquake_app/features/data/datasources/earth_quase_datasource_implementation.dart';
import 'package:earthquake_app/features/data/repositories/earth_quake_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/earth_quake_model_mock.dart';

class MockEarthQuakeDataSource extends Mock implements IEarthQuakeDataSource {}

void main() {
  late EarthQuakeRepositoryImplementation repository;
  late IEarthQuakeDataSource dataSource;

  setUp(() {
    dataSource = MockEarthQuakeDataSource();
    repository = EarthQuakeRepositoryImplementation(dataSource);
  });

  test('should return earth quake model when calls the data source', () async {
    when(() => dataSource.getResume())
        .thenAnswer((_) async => tEarthQuakeModel);

    final result = await repository.getEarthQuakeResume();

    expect(result, Right(tEarthQuakeModel));
    verify(() => dataSource.getResume()).called(1);
  });

  test(
      'should return a server failure when calls the data source is unsucessfull',
      () async {
    when(() => dataSource.getResume()).thenThrow(ServerException());

    final result = await repository.getEarthQuakeResume();

    expect(result, Left(ServerFailure()));
    verify(() => dataSource.getResume()).called(1);
  });
}
