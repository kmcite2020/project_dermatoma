// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:project_dermatoma/src/features/home/models/picture.dart';

class PicturesModel {
  final List<PictureModel> pictures;
  PicturesModel({
    required this.pictures,
  });

  PicturesModel copyWith({
    List<PictureModel>? pictures,
  }) {
    return PicturesModel(
      pictures: pictures ?? this.pictures,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pictures': pictures.map((x) => x.toMap()).toList(),
    };
  }

  factory PicturesModel.fromMap(Map<String, dynamic> map) {
    return PicturesModel(
      pictures: List<PictureModel>.from(
        (map['pictures']).map<PictureModel>(
          (x) => PictureModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PicturesModel.fromJson(String? source) {
    if (source == null) return init;
    return PicturesModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  @override
  String toString() => 'PicturesModel(pictures: $pictures)';

  @override
  bool operator ==(covariant PicturesModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.pictures, pictures);
  }

  @override
  int get hashCode => pictures.hashCode;
  static PicturesModel get init => PicturesModel(pictures: []);
}
