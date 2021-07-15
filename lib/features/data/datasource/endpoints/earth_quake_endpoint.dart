class EarthQuakeEndPoint {
  static String getResume() =>
      "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson";
  static String getQueryStartTime(String startTime) =>
      "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=$startTime";
  static String getQueryStartAndEndTime(String startTime, String endTime) =>
      "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=$startTime&endtime=$endTime";
  static String getQueryMinMagnitude(double minMagnitude) =>
      "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&minmagnitude=$minMagnitude";
}
