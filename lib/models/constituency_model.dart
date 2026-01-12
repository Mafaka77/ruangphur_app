class ConstituencyModel {
  final String id;
  final String name;
  final String district_id;

  ConstituencyModel({
    required this.id,
    required this.name,
    required this.district_id,
  });

  // Factory method to create an instance from JSON
  factory ConstituencyModel.fromJson(Map<String, dynamic> json) {
    return ConstituencyModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      district_id: json['districts'] as String,
    );
  }

  // Convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'districts': district_id,
    };
  }

  bool isEqual(ConstituencyModel model) {
    return id == model.id;
  }

  @override
  String toString() {
    return name;
  }

  // Parse a list of constituencies from JSON
  static List<ConstituencyModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ConstituencyModel.fromJson(json)).toList();
  }
}
