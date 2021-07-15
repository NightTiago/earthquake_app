import 'package:earthquake_app/features/data/models/earth_quake_model.dart';
import 'package:earthquake_app/features/data/models/features_model.dart';
import 'package:earthquake_app/features/data/models/geometry_model.dart';
import 'package:earthquake_app/features/data/models/meta_data_model.dart';
import 'package:earthquake_app/features/data/models/properties_model.dart';

final tEarthQuakeModel = EarthQuakeModel(
    type: "FeatureCollection",
    metadata: new MetadataModel(
        generated: 1626201716000,
        url:
            "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson",
        title: "USGS Magnitude 2.5+ Earthquakes, Past Day",
        status: 200,
        api: "1.10.3",
        count: 43),
    features: [
      new FeaturesModel(
          type: "Feature",
          properties: PropertiesModel(
              mag: 2.9,
              place: "32km SSW of Smith Valley, NV",
              time: 1626198699050,
              updated: 1626198699050,
              tz: null,
              url:
                  "https://earthquake.usgs.gov/earthquakes/eventpage/nc73589271",
              detail:
                  "https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/nc73589271.geojson",
              felt: 2,
              cdi: 2.0,
              mmi: null,
              alert: null,
              status: "automatic",
              tsunami: 0,
              sig: 130,
              net: "nc",
              code: "73589271",
              ids: ",nc73589271,nn00813405,us7000elmu,",
              sources: ",nc,nn,us,",
              types:
                  ",dyfi,focal-mechanism,nearby-cities,origin,phase-data,scitech-link,",
              nst: 12,
              dmin: 0.03873,
              rms: 0.08,
              gap: 97,
              magType: "md",
              type: "earthquake",
              title: "M 2.9 - 32km SSW of Smith Valley, NV"),
          geometry: GeometryModel(
              type: "Point", coordinates: [-119.4950027, 38.5251656, 4.68]),
          id: "nc73589271")
    ],
    bbox: [
      -179.9504,
      -25.3498,
      -1.06,
      178.2737,
      69.2582,
      484.83
    ]);
