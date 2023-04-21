import 'dart:convert';

class MedicalRecord {
  final DateTime date;
  MedicalRecord({
    required this.date,
  });
  int get id => date.millisecondsSinceEpoch;

  MedicalRecord copyWith({
    DateTime? date,
  }) {
    return MedicalRecord(
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory MedicalRecord.fromMap(Map<String, dynamic> map) {
    return MedicalRecord(
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicalRecord.fromJson(String source) => MedicalRecord.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MedicalRecord(date: $date)';

  @override
  bool operator ==(covariant MedicalRecord other) {
    if (identical(this, other)) return true;

    return other.date == date;
  }

  @override
  int get hashCode => date.hashCode;
}
