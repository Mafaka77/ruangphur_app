// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DownloadModel {
  int? id;
  String? title;
  String? sub_title;
  String? attachment;
  String? created_at;
  DownloadModel({
    this.id,
    this.title,
    this.sub_title,
    this.attachment,
    this.created_at,
  });

  DownloadModel copyWith({
    int? id,
    String? title,
    String? sub_title,
    String? attachment,
    String? created_at,
  }) {
    return DownloadModel(
      id: id ?? this.id,
      title: title ?? this.title,
      sub_title: sub_title ?? this.sub_title,
      attachment: attachment ?? this.attachment,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'sub_title': sub_title,
      'attachment': attachment,
      'created_at': created_at,
    };
  }

  factory DownloadModel.fromMap(Map<String, dynamic> map) {
    return DownloadModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      sub_title: map['sub_title'] != null ? map['sub_title'] as String : null,
      attachment:
          map['attachment'] != null ? map['attachment'] as String : null,
      created_at: map['createdAt'] != null ? map['createdAt'] as String : null,
    );
  }
  static List<DownloadModel> fromJsonList(List list) {
    return list.map((e) => DownloadModel.fromMap(e)).toList();
  }

  String toJson() => json.encode(toMap());

  factory DownloadModel.fromJson(String source) =>
      DownloadModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DownloadModel(id: $id, title: $title, sub_title: $sub_title, attachment: $attachment, created_at: $created_at)';
  }

  @override
  bool operator ==(covariant DownloadModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.sub_title == sub_title &&
        other.attachment == attachment &&
        other.created_at == created_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        sub_title.hashCode ^
        attachment.hashCode ^
        created_at.hashCode;
  }
}
