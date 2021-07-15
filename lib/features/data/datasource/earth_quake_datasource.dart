import 'package:earthquake_app/features/domain/entities/earth_quake_entity.dart';

abstract class IEarthQuakeDatasource {
  Future<EarthQuakeEntity> getResume();
  Future<EarthQuakeEntity> getQueryStartTime(DateTime startTime);
  Future<EarthQuakeEntity> getQueryStartAndEndTime(
      DateTime startTime, DateTime endTime);
  Future<EarthQuakeEntity> getQueryMinMagnitude(double minMagnitude);
}
