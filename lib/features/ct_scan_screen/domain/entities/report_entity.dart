class ReportEntity {
  final String? id;
  final String? patientId;
  final String? doctorId;
  final String? findings;
  final String? impression;
  final String? date;
  final String? title;
  final String? description;
  final String? ctScanImageUrl;

  ReportEntity({
    this.id,
    this.patientId,
    this.doctorId,
    this.findings,
    this.impression,
    this.date,
    this.title,
    this.description,
    this.ctScanImageUrl,
  });
}
