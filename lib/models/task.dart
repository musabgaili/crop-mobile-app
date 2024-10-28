class Task {
   int? id;
   int? farmGroupId;
   String title;
   String? description;
   DateTime? dueDate;
   int? status;
   int? assignedToId;
   DateTime? createdAt;
   DateTime? updatedAt;

  Task({
    this.id,
    this.farmGroupId,
    required this.title,
    this.description,
    this.dueDate,
    required this.status,
    this.assignedToId,
    this.createdAt,
    this.updatedAt,
  });

  // Factory constructor to create a Task from JSON
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      farmGroupId: json['farm_group_id'],
      title: json['title'],
      description: json['description'],
      dueDate:
          json['due_date'] != null ? DateTime.parse(json['due_date']) : null,
      status: json['status'],
      assignedToId: json['assigned_to_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  // Method to convert a Task to JSON
  Map<String, dynamic> toJson() {
    return {
'id': id,
'farm_group_id': farmGroupId,
'title': title,
'description': description,
'due_date': dueDate?.toIso8601String(),
'status': status,
'assigned_to_id': assignedToId,
'created_at': createdAt?.toIso8601String(),
'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
