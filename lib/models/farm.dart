
class Farm {
   int id;
   int farmGroupId;
   String name;
   String location;
   double size;
   String cropType;
   String description;
   DateTime createdAt;
   DateTime updatedAt;
  String? points;

  Farm({
    required this.id,
    required this.farmGroupId,
    required this.name,
    required this.location,
    required this.size,
    required this.cropType,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    this.points,
  });

  factory Farm.fromJson(Map<String, dynamic> json) {
    return Farm(
      id: json['id'],
      farmGroupId: json['farm_group_id'],
      name: json['name'],
      location: json['location'],
      size: json['size'].toDouble(),
      cropType: json['crop_type'],
      description: json['description'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      points: json['points'],
    );
  }
}