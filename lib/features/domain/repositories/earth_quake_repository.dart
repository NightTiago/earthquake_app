import 'package:dartz/dartz.dart';
import 'package:earthquake_app/core/usecase/errors/failures.dart';
import 'package:earthquake_app/features/domain/entities/earth_quake_entity.dart';

abstract class IEarthQuakeRepository {
  Future<Either<Failure, EarthQuakeEntity>> getResume();
  Future<Either<Failure, EarthQuakeEntity>> getQueryStartTime(
      DateTime startTime);
  Future<Either<Failure, EarthQuakeEntity>> getQueryStartAndEndTime(
      DateTime startTime, DateTime endTime);
  Future<Either<Failure, EarthQuakeEntity>> getQueryMinMagnitude(
      double minMagnitude);
}
