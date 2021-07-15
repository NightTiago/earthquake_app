class EarthQuakeEndPoint {
  static String resume() =>
      "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson";

  static String queryStartTime(String startTime) =>
      "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=$startTime";

  static String queryStartAndEndTime(String startTime, String endTime) =>
      "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=$startTime&endtime=$endTime";

  static String queryMinMagnitude(String minMagnitude) =>
      "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&minmagnintude=$minMagnitude";
}
