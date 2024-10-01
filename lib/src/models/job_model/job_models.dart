import 'package:uuid/uuid.dart';

class JobModel {
  int srNo; // Serial number as an integer
  String? jobId; // Unique job ID
  String? clientId; // Unique client ID
  String? radishaId; // Unique Radisha ID
  String? jobTitle;
  String? clientName;
  String? radishaName;
  String? date;
  String? jobStatus;
  String? completionDate;
  String? disputeReason;
  String? dateFiled;
  String? skillRequired;

  // Constructor
  JobModel({
    required this.srNo, // Assigned sequentially
    this.jobId,
    this.clientId,
    this.radishaId,
    this.jobTitle,
    this.clientName,
    this.radishaName,
    this.date,
    this.jobStatus,
    this.completionDate,
    this.disputeReason,
    this.dateFiled,
    this.skillRequired,
  });

  // Factory method to generate random IDs and assign srNo
  factory JobModel.create({
    required int srNo, // Sequentially passed from outside
    String? jobId,
    String? clientId,
    String? radishaId,
    required String jobTitle,
    required String clientName,
    required String radishaName,
    required String date,
    required String jobStatus,
    required String completionDate,
    required String disputeReason,
    required String dateFiled,
    required String skillRequired,
  }) {
    return JobModel(
      srNo: srNo, // This is passed from outside
      jobId: jobId ?? Uuid().v4(), // Generates random jobId if not provided
      clientId:
          clientId ?? Uuid().v4(), // Generates random clientId if not provided
      radishaId: radishaId ??
          Uuid().v4(), // Generates random radishaId if not provided
      jobTitle: jobTitle,
      clientName: clientName,
      radishaName: radishaName,
      date: date,
      jobStatus: jobStatus,
      completionDate: completionDate,
      disputeReason: disputeReason,
      dateFiled: dateFiled,
      skillRequired: skillRequired,
    );
  }

  // Method to convert JobModel to a Map (for JSON serialization)
  Map<String, dynamic> toJson() {
    return {
      'srNo': srNo,
      'jobId': jobId,
      'clientId': clientId,
      'radishaId': radishaId,
      'jobTitle': jobTitle,
      'clientName': clientName,
      'radishaName': radishaName,
      'date': date,
      'jobStatus': jobStatus,
      'completionDate': completionDate,
      'disputeReason': disputeReason,
      'dateFiled': dateFiled,
      'skillRequired': skillRequired,
    };
  }

  // Method to create a JobModel instance from a Map (for JSON deserialization)
  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      srNo: json['srNo'],
      jobId: json['jobId'],
      clientId: json['clientId'],
      radishaId: json['radishaId'],
      jobTitle: json['jobTitle'],
      clientName: json['clientName'],
      radishaName: json['radishaName'],
      date: json['date'],
      jobStatus: json['jobStatus'],
      completionDate: json['completionDate'],
      disputeReason: json['disputeReason'],
      dateFiled: json['dateFiled'],
      skillRequired: json['skillRequired'],
    );
  }
}
