import 'dart:convert';

PostDataModel welcomeFromJson(String str) =>
    PostDataModel.fromJson(json.decode(str));

String welcomeToJson(PostDataModel data) => json.encode(data.toJson());

class PostDataModel {
  PostDataModel({
    this.name,
    this.job,
    this.id,
    this.createdAt,
  });

  final String? name;
  final String? job;
  final String? id;
  final DateTime? createdAt;

  factory PostDataModel.fromJson(Map<String, dynamic> json) => PostDataModel(
        name: json["name"] == null ? null : json["name"],
        job: json["job"] == null ? null : json["job"],
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "job": job == null ? null : job,
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
      };
}
