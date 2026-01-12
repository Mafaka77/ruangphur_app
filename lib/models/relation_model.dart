class RelativeModel {
  final String id;
  final String name;
  final int version;

  RelativeModel({
    required this.id,
    required this.name,
    required this.version,
  });

  // Factory method to create a RelativeModel object from JSON
  factory RelativeModel.fromJson(Map<String, dynamic> json) {
    return RelativeModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      version: json['__v'] as int,
    );
  }

  // Method to convert a RelativeModel object to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      '__v': version,
    };
  }

  // Static method to parse a list of RelativeModels from JSON
  static List<RelativeModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => RelativeModel.fromJson(json)).toList();
  }

  @override
  String toString() => name;
  bool isEqual(RelativeModel model) {
    return id == model.id;
  }
}
