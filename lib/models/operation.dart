class Operation {
  int? id;
  int? farmId;
  int? workerId;
  String? type;
  String? area;
  String? quantity;
  String? createdAt;
  String? updatedAt;

  Operation(
      {this.id,
      this.farmId,
      this.workerId,
      this.type,
      this.area,
      this.quantity,
      this.createdAt,
      this.updatedAt});

  Operation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    farmId = json['farm_id'];
    workerId = json['worker_id'];
    type = json['type'];
    area = json['area'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['farm_id'] = farmId;
    data['worker_id'] = workerId;
    data['type'] = type;
    data['area'] = area;
    data['quantity'] = quantity;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
