class NotificationModel {
  int? id;
  int? userId;
  String? title;
  String? description;
  String? readAt;
  int? alert;
  String? createdAt;
  String? updatedAt;

  NotificationModel(
      {this.id,
      this.userId,
      this.title,
      this.description,
      this.readAt,
      this.alert,
      this.createdAt,
      this.updatedAt});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    readAt = json['read_at'];
    alert = json['alert'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['title'] = title;
    data['description'] = description;
    data['read_at'] = readAt;
    data['alert'] = alert;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
