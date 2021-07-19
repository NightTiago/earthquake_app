import 'package:earthquake_app/core/usecase/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:earthquake_app/core/usecase/usecase.dart';
import 'package:earthquake_app/features/domain/entities/earth_quake_entity.dart';
import 'package:earthquake_app/features/domain/repositories/earth_quake_repository.dart';

class GetEarthQuakeFromDateTimeUsecase
    implements Usecase<EarthQuakeEntity, DateTime> {
  final IEarthQuakeRepository repository;

  GetEarthQuakeFromDateTimeUsecase(this.repository);

  @override
  Future<Either<Failure, EarthQuakeEntity>> call(DateTime? params) async {
    return params != null
        ? await repository.getQueryStartTime(params)
        : Left(NullParamFailure());
  }

  Future<Either<Failure, EarthQuakeEntity>> getQueryStartAndEndTime(
      DateTime? paramsStart, DateTime? paramsEnd) async {
    return paramsStart != null && paramsEnd != null
        ? await repository.getQueryStartAndEndTime(paramsStart, paramsEnd)
        : Left(NullParamFailure());
  }
}
