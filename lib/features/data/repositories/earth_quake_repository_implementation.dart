import 'package:earthquake_app/core/usecase/errors/exceptions.dart';
import 'package:earthquake_app/features/data/datasource/earth_quake_datasource.dart';
import 'package:earthquake_app/features/domain/entities/earth_quake_entity.dart';
import 'package:earthquake_app/core/usecase/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:earthquake_app/features/domain/repositories/earth_quake_repository.dart';

class EathQuakeRepositoryImplementation implements IEarthQuakeRepository {
  final IEarthQuakeDatasource datasource;

  EathQuakeRepositoryImplementation({required this.datasource});

  @override
  Future<Either<Failure, EarthQuakeEntity>> getQueryMinMagnitude(
      double minMagnitude) async {
    try {
      final result = await datasource.getQueryMinMagnitude(minMagnitude);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, EarthQuakeEntity>> getQueryStartAndEndTime(
      DateTime startTime, DateTime endTime) async {
    try {
      final result =
          await datasource.getQueryStartAndEndTime(startTime, endTime);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, EarthQuakeEntity>> getQueryStartTime(
      DateTime startTime) async {
    try {
      final result = await datasource.getQueryStartTime(startTime);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, EarthQuakeEntity>> getResume() async {
    try {
      final result = await datasource.getResume();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
