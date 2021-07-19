import 'package:earthquake_app/core/usecase/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:earthquake_app/core/usecase/usecase.dart';
import 'package:earthquake_app/features/domain/entities/earth_quake_entity.dart';
import 'package:earthquake_app/features/domain/repositories/earth_quake_repository.dart';

class GetEarthQuakeFromMagnitudeUsecase
    implements Usecase<EarthQuakeEntity, double> {
  final IEarthQuakeRepository repository;

  GetEarthQuakeFromMagnitudeUsecase(this.repository);

  @override
  Future<Either<Failure, EarthQuakeEntity>> call(double? params) async {
    return params != null
        ? await repository.getQueryMinMagnitude(params)
        : Left(NullParamFailure());
  }
}
