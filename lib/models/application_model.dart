import 'dart:convert';

class Application {
  final String id;
  final Applicant applicant;
  final Deceased deceased;
  final Transport transport;
  final Attachment attachment;
  final String status;
  final String applicationNo;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? verifiedAt;
  final String? verifiedBy;
  final DateTime? approvedAt;
  final String? approvedBy;
  final DateTime? processedAt;

  Application({
    required this.id,
    required this.applicant,
    required this.deceased,
    required this.transport,
    required this.attachment,
    required this.status,
    required this.applicationNo,
    required this.createdAt,
    required this.updatedAt,
    this.verifiedAt,
    this.verifiedBy,
    this.approvedAt,
    this.approvedBy,
    this.processedAt,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      id: json['_id'],
      applicant: Applicant.fromJson(json['applicant']),
      deceased: Deceased.fromJson(json['deceased']),
      transport: Transport.fromJson(json['transport']),
      attachment: Attachment.fromJson(json['attachment']),
      status: json['status'],
      applicationNo: json['application_no'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      verifiedAt: json['verified_at'] != null
          ? DateTime.parse(json['verified_at'])
          : null,
      verifiedBy: json['verified_by'],
      approvedAt: json['approved_at'] != null
          ? DateTime.parse(json['approved_at'])
          : null,
      approvedBy: json['approved_by'],
      processedAt: json['processed_at'] != null
          ? DateTime.parse(json['processed_at'])
          : null,
    );
  }
}

class Applicant {
  final String id;
  final String name;
  final String mobile;
  final District district;
  final String locality;
  final String bankName;
  final String accountNo;
  final String ifscCode;

  Applicant({
    required this.id,
    required this.name,
    required this.mobile,
    required this.district,
    required this.locality,
    required this.bankName,
    required this.accountNo,
    required this.ifscCode,
  });

  factory Applicant.fromJson(Map<String, dynamic> json) {
    return Applicant(
      id: json['_id'],
      name: json['name'],
      mobile: json['mobile'],
      district: District.fromJson(json['district']),
      locality: json['locality'],
      bankName: json['bank_name'],
      accountNo: json['account_no'],
      ifscCode: json['ifsc_code'],
    );
  }
}

class Deceased {
  final String id;
  final String name;
  final Relation relation;
  final String relativeName;
  final String dob;
  final String gender;
  final District district;
  final String locality;
  final Constituency constituency;
  final String timeOfDeath;
  final String placeOfDeath;

  Deceased({
    required this.id,
    required this.name,
    required this.relation,
    required this.relativeName,
    required this.dob,
    required this.gender,
    required this.district,
    required this.locality,
    required this.constituency,
    required this.timeOfDeath,
    required this.placeOfDeath,
  });

  factory Deceased.fromJson(Map<String, dynamic> json) {
    return Deceased(
      id: json['_id'],
      name: json['name'],
      relation: Relation.fromJson(json['relation']),
      relativeName: json['relative_name'],
      dob: json['dob'],
      gender: json['gender'],
      district: District.fromJson(json['district']),
      locality: json['locality'],
      constituency: Constituency.fromJson(json['constituency']),
      timeOfDeath: json['time_of_death'],
      placeOfDeath: json['place_of_death'],
    );
  }
}

class Transport {
  final String id;
  final District sourceDistrict;
  final District destinationDistrict;
  final String sourceLocality;
  final String destinationLocality;
  final String vehicleNumber;
  final String driverName;
  final String driverPhone;
  final double sourceLat;
  final double sourceLng;
  final double destinationLat;
  final double destinationLng;
  final double distance;
  final String transportCost;

  Transport({
    required this.id,
    required this.sourceDistrict,
    required this.destinationDistrict,
    required this.sourceLocality,
    required this.destinationLocality,
    required this.vehicleNumber,
    required this.driverName,
    required this.driverPhone,
    required this.sourceLat,
    required this.sourceLng,
    required this.destinationLat,
    required this.destinationLng,
    required this.distance,
    required this.transportCost,
  });

  factory Transport.fromJson(Map<String, dynamic> json) {
    return Transport(
      id: json['_id'],
      sourceDistrict: District.fromJson(json['source_district']),
      destinationDistrict: District.fromJson(json['destination_district']),
      sourceLocality: json['source_locality'],
      destinationLocality: json['destination_locality'],
      vehicleNumber: json['vehicle_number'],
      driverName: json['driver_name'],
      driverPhone: json['driver_phone'],
      sourceLat: json['source_lat'],
      sourceLng: json['source_lng'],
      destinationLat: json['destination_lat'],
      destinationLng: json['destination_lng'],
      distance: json['distance'].toDouble(),
      transportCost: json['transport_cost'],
    );
  }
}

class Attachment {
  final String id;
  final String idProof;
  final String receipt;
  final String deathCertificate;
  final String additionalDocument;

  Attachment({
    required this.id,
    required this.idProof,
    required this.receipt,
    required this.deathCertificate,
    required this.additionalDocument,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      id: json['_id'],
      idProof: json['id_proof'],
      receipt: json['receipt'],
      deathCertificate: json['death_certificate'],
      additionalDocument: json['additional_document'],
    );
  }
}

class District {
  final String id;
  final String name;

  District({required this.id, required this.name});

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      id: json['_id'],
      name: json['name'],
    );
  }
}

class Relation {
  final String id;
  final String name;

  Relation({required this.id, required this.name});

  factory Relation.fromJson(Map<String, dynamic> json) {
    return Relation(
      id: json['_id'],
      name: json['name'],
    );
  }
}

class Constituency {
  final String id;
  final String name;

  Constituency({required this.id, required this.name});

  factory Constituency.fromJson(Map<String, dynamic> json) {
    return Constituency(
      id: json['_id'],
      name: json['name'],
    );
  }
}
