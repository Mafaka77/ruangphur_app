// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DistrictModel {
  String? id;
  String? name;
  String? district_code;
  DistrictModel({
    this.id,
    this.name,
    this.district_code,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'district_code': district_code,
    };
  }

  factory DistrictModel.fromMap(Map<String, dynamic> map) {
    return DistrictModel(
      id: map['_id'] != null ? map['_id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      district_code:
          map['district_code'] != null ? map['district_code'] as String : null,
    );
  }
  static List<DistrictModel> fromJsonList(List list) {
    return list.map((e) => DistrictModel.fromMap(e)).toList();
  }

  ///this method will prevent the override of toString

  ///custom comparing function to check if two users are equal
  bool isEqual(DistrictModel model) {
    return id == model.id;
  }

  String toJson() => json.encode(toMap());

  factory DistrictModel.fromJson(String source) =>
      DistrictModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => '$name';

  @override
  bool operator ==(covariant DistrictModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.district_code == district_code;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ district_code.hashCode;
}
