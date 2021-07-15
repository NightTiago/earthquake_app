import 'package:dartz/dartz.dart';
import 'package:earthquake_app/core/errors/failure.dart';
import 'package:earthquake_app/features/domain/entities/earth_quake_entity.dart';

abstract class IEarthQuakeRepository {
  Future<Either<Failure, EarthQuakeEntity>> getEarthQuakeResume();
}
