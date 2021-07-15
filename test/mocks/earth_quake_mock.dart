import 'package:earthquake_app/features/data/models/earth_quake_model.dart';
import 'package:earthquake_app/features/data/models/features_model.dart';
import 'package:earthquake_app/features/data/models/geometry_model.dart';
import 'package:earthquake_app/features/data/models/metadata_model.dart';
import 'package:earthquake_app/features/data/models/properties_modeel.dart';

final tEarthQuakeMock = EarthQuakeModel(
    type: "FeatureCollection",
    metadata: new MetadataModel(
        generated: 1626361685000,
        url:
            "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson",
        title: "USGS Magnitude 2.5+ Earthquakes",
        status: 200,
        api: "1.10.3",
        count: 33),
    features: new FeaturesModel(type: "Feature", properties: new PropertiesModel(mag: 4.0, place: "79 km E of Akutan, Alaska", time: 1626356256250, updated: 1626361517543, tz: null, url: "https://earthquake.usgs.gov/earthquakes/eventpage/nc73591671", detail: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/nc73591671.geojson", felt: 26, cdi: 3.8, mmi: 4.378, alert: null, status: "reviewed", tsunami: 0, sig: 225, net: "nc", code: "73591671", ids: ",nc73591671,nn00814008,", sources: ",nc,nn,", types: ",dyfi,focal-mechanism,moment-tensor,nearby-cities,origin,phase-data,scitech-link,shakemap,", nst: 16, dmin: 0.02498, rms: 0.05, gap: 67, magType: "mw", type: "earthquake", title: "M 3.7 - 31km SSW of Smith Valley, NV"), geometry: new GeometryModel(type: "Point", coordinates: [-119.4741669, 38.5245018, 3.21]), id: "nc73591671"),
    bbox: [-178.9191, -29.7306, 0, 179.2303, 59.4158, 626.32]).toString();
