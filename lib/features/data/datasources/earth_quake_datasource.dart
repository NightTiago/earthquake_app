import 'package:earthquake_app/features/data/models/earth_quake_model.dart';

abstract class IEarthQuakeDataSource {
  Future<EarthQuakeModel> getResume();
  Future<EarthQuakeModel> getQueryStartTime(DateTime startTime);
  Future<EarthQuakeModel> getQueryStartAndEndTime(
      DateTime startTime, DateTime endTime);
  Future<EarthQuakeModel> getQueryMinMagnitude(double minMagnitude);
}
