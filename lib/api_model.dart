import 'package:equatable/equatable.dart';

// ApiModel apiModelFromJson(String str) => ApiModel.fromJson(json.decode(str));

// String apiModelToJson(ApiModel data) => json.encode(data.toJson());

class ApiModel extends Equatable {
  ApiModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  // Map<String, dynamic> toJson() => {
  //       "userId": userId,
  //       "id": id,
  //       "title": title,
  //       "body": body,
  //     };

  @override
  List<Object> get props => [userId, id, title, body];
}
