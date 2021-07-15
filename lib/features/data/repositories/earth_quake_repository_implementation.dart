import 'package:earthquake_app/core/errors/exception.dart';
import 'package:earthquake_app/features/data/datasources/earth_quake_datasource.dart';
import 'package:earthquake_app/features/domain/entities/earth_quake_entity.dart';
import 'package:earthquake_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:earthquake_app/features/domain/repositories/earth_quake_repository.dart';

class EarthQuakeRepositoryImplementation implements IEarthQuakeRepository {
  final IEarthQuakeDataSource dataSource;

  EarthQuakeRepositoryImplementation(this.dataSource);

  @override
  Future<Either<Failure, EarthQuakeEntity>> getEarthQuakeResume() async {
    try {
      final result = await dataSource.getResume();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
