import 'package:equatable/equatable.dart';

class PropertiesEntity extends Equatable {
  final double mag;
  final String place;
  final int time;
  final int updated;
  final Null tz;
  final String url;
  final String detail;
  final int felt;
  final double cdi;
  final double? mmi;
  final String? alert;
  final String status;
  final int tsunami;
  final int sig;
  final String net;
  final String code;
  final String ids;
  final String sources;
  final String types;
  final int nst;
  final double dmin;
  final double rms;
  final int gap;
  final String magType;
  final String type;
  final String title;

  PropertiesEntity(
      {required this.mag,
      required this.place,
      required this.time,
      required this.updated,
      required this.tz,
      required this.url,
      required this.detail,
      required this.felt,
      required this.cdi,
      required this.mmi,
      required this.alert,
      required this.status,
      required this.tsunami,
      required this.sig,
      required this.net,
      required this.code,
      required this.ids,
      required this.sources,
      required this.types,
      required this.nst,
      required this.dmin,
      required this.rms,
      required this.gap,
      required this.magType,
      required this.type,
      required this.title});

  @override
  List<Object?> get props => throw [
        mag,
        place,
        time,
        updated,
        tz,
        url,
        detail,
        felt,
        cdi,
        mmi,
        alert,
        status,
        tsunami,
        sig,
        net,
        code,
        ids,
        sources,
        types,
        nst,
        dmin,
        rms,
        gap,
        magType,
        type,
        title
      ];
}
