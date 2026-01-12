// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TrackingModel {
  int? id;
  String? status;
  String? application_no;
  String? verified_at;
  String? approved_at;
  String? processed_at;
  String? created_at;
  TrackingModel({
    this.id,
    this.status,
    this.application_no,
    this.verified_at,
    this.approved_at,
    this.processed_at,
    this.created_at,
  });

  TrackingModel copyWith({
    int? id,
    String? status,
    String? application_no,
    String? verified_at,
    String? approved_at,
    String? processed_at,
    String? created_at,
  }) {
    return TrackingModel(
      id: id ?? this.id,
      status: status ?? this.status,
      application_no: application_no ?? this.application_no,
      verified_at: verified_at ?? this.verified_at,
      approved_at: approved_at ?? this.approved_at,
      processed_at: processed_at ?? this.processed_at,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'status': status,
      'application_no': application_no,
      'verified_at': verified_at,
      'approved_at': approved_at,
      'processed_at': processed_at,
      'created_at': created_at,
    };
  }

  factory TrackingModel.fromMap(Map<String, dynamic> map) {
    return TrackingModel(
      id: map['id'] != null ? map['id'] as int : null,
      status: map['status'] != null ? map['status'] as String : null,
      application_no: map['application_no'] != null
          ? map['application_no'] as String
          : null,
      verified_at:
          map['verified_at'] != null ? map['verified_at'] as String : null,
      approved_at:
          map['approved_at'] != null ? map['approved_at'] as String : null,
      processed_at:
          map['processed_at'] != null ? map['processed_at'] as String : null,
      created_at:
          map['created_at'] != null ? map['created_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TrackingModel.fromJson(String source) =>
      TrackingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TrackingModel(id: $id, status: $status, application_no: $application_no, verified_at: $verified_at, approved_at: $approved_at, processed_at: $processed_at, created_at: $created_at)';
  }

  @override
  bool operator ==(covariant TrackingModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.status == status &&
        other.application_no == application_no &&
        other.verified_at == verified_at &&
        other.approved_at == approved_at &&
        other.processed_at == processed_at &&
        other.created_at == created_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        status.hashCode ^
        application_no.hashCode ^
        verified_at.hashCode ^
        approved_at.hashCode ^
        processed_at.hashCode ^
        created_at.hashCode;
  }
}
