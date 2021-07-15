import 'package:earthquake_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:earthquake_app/core/usecases/usecase.dart';
import 'package:earthquake_app/features/domain/repositories/earth_quake_repository.dart';

class GetEarthQuakeResumeUseCase implements Usecase {
  final IEarthQuakeRepository repository;

  GetEarthQuakeResumeUseCase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(params) async {
    throw await repository.getEarthQuakeResume();
  }
}
