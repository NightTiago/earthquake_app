import 'package:earthquake_app/features/domain/entities/metadata_entity.dart';

class MetadataModel extends MetadataEntity {
  MetadataModel(
      {required generated,
      required url,
      required title,
      required status,
      required api,
      required count})
      : super(
            generated: generated,
            url: url,
            title: title,
            status: status,
            api: api,
            count: count);

  factory MetadataModel.fromJson(Map<String, dynamic> json) => MetadataModel(
      generated: json['generated'],
      url: json['url'],
      title: json['title'],
      status: json['status'],
      api: json['api'],
      count: json['count']);

  Map<String, dynamic> toJson() => {
        'generated': this.generated,
        'url': this.url,
        'title': this.title,
        'status': this.status,
        'api': this.api,
        'count': this.count
      };
}
