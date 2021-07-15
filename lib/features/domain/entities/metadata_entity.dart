import 'package:equatable/equatable.dart';

class MetadataEntity extends Equatable {
  final int generated;
  final String url;
  final String title;
  final int status;
  final String api;
  final int count;

  MetadataEntity(
      {required this.generated,
      required this.url,
      required this.title,
      required this.status,
      required this.api,
      required this.count});

  @override
  List<Object?> get props => [generated, url, title, status, api, count];
}
