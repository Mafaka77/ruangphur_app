// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class MultiTableModel {
  final Map<String, dynamic> deceaseds;
  final Map<String, dynamic> transports;
  final Map<String, dynamic> applicants;

  MultiTableModel({
    required this.deceaseds,
    required this.transports,
    required this.applicants,
  });

  MultiTableModel copyWith({
    Map<String, dynamic>? deceaseds,
    Map<String, dynamic>? transports,
    Map<String, dynamic>? applicants,
    Map<String, dynamic>? attachments,
  }) {
    return MultiTableModel(
      deceaseds: deceaseds ?? this.deceaseds,
      transports: transports ?? this.transports,
      applicants: applicants ?? this.applicants,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'deceaseds': deceaseds,
      'transports': transports,
      'applicants': applicants,
    };
  }
}
