class DeviceModel {
  int? id;
  String? lastUpdate;
  double? lat;
  int? lng;
  dynamic uv;
  String? createdAt;
  double? distance;
  NewestUpdates? newestUpdates;

  DeviceModel(
      {this.id,
      this.lastUpdate,
      this.lat,
      this.lng,
      this.createdAt,
      this.distance,
      this.newestUpdates});

  DeviceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lastUpdate = json['last_update'];
    lat = json['lat'];
    lng = json['lng'];
    createdAt = json['created_at'];
    distance = json['distance'];
    uv = json['uv'];
    newestUpdates = json['newest_updates'] != null
        ? NewestUpdates.fromJson(json['newest_updates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['last_update'] = lastUpdate;
    data['lat'] = lat;
    data['lng'] = lng;
    data['created_at'] = createdAt;
    data['distance'] = distance;
    if (newestUpdates != null) {
      data['newest_updates'] = newestUpdates!.toJson();
    }
    return data;
  }
}

class NewestUpdates {
  int? id;
  String? data;
  int? deviceId;
  String? sentAt;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  dynamic uv;

  NewestUpdates(
      {this.id,
      this.data,
      this.deviceId,
      this.sentAt,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.uv});

  NewestUpdates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'];
    deviceId = json['device_id'];
    sentAt = json['sent_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    uv = json['uv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['data'] = this.data;
    data['device_id'] = deviceId;
    data['sent_at'] = sentAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['uv'] = uv;
    return data;
  }
}
