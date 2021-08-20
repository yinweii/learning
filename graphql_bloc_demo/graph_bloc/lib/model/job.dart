import 'package:json_annotation/json_annotation.dart';
part 'job.g.dart';

@JsonSerializable()
class Job {
  final String id;
  final String title;
  final String applyUrl;
  final String locationNames;
  final String userEmail;
  final DateTime createdAt;
  final String description;
  final bool isPublished;
  final DateTime updatedAt;
  Job(
      {this.id,
      this.title,
      this.applyUrl,
      this.locationNames,
      this.userEmail,
      this.createdAt,
      this.description,
      this.isPublished,
      this.updatedAt});
  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
  Map<String, dynamic> toJson() => _$JobToJson(this);
}
