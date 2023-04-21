// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PictureModel {
  final String? picture;
  final DateTime? date;
  PictureModel({
    this.picture,
    this.date,
  });

  PictureModel copyWith({
    String? picture,
    DateTime? date,
  }) {
    return PictureModel(
      picture: picture ?? this.picture,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'picture': picture,
      'date': date?.millisecondsSinceEpoch,
    };
  }

  factory PictureModel.fromMap(Map<String, dynamic> map) {
    return PictureModel(
      picture: map['picture'] != null ? map['picture'] as String : null,
      date: map['date'] != null ? DateTime.fromMillisecondsSinceEpoch(map['date'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PictureModel.fromJson(String source) => PictureModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PictureModel(picture: $picture, date: $date)';

  @override
  bool operator ==(covariant PictureModel other) {
    if (identical(this, other)) return true;

    return other.picture == picture && other.date == date;
  }

  @override
  int get hashCode => picture.hashCode ^ date.hashCode;
}
