// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SettingsModel {
  final bool? isColorsVisible;
  final bool? isSearching;
  SettingsModel({
    this.isColorsVisible,
    this.isSearching,
  });

  SettingsModel copyWith({
    bool? isColorsVisible,
    bool? isSearching,
  }) {
    return SettingsModel(
      isColorsVisible: isColorsVisible ?? this.isColorsVisible,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isColorsVisible': isColorsVisible,
      'isSearching': isSearching,
    };
  }

  factory SettingsModel.fromMap(Map<String, dynamic> map) {
    return SettingsModel(
      isColorsVisible: map['isColorsVisible'] != null ? map['isColorsVisible'] as bool : null,
      isSearching: map['isSearching'] != null ? map['isSearching'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsModel.fromJson(String source) => SettingsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SettingsModel(isColorsVisible: $isColorsVisible, isSearching: $isSearching)';

  @override
  bool operator ==(covariant SettingsModel other) {
    if (identical(this, other)) return true;

    return other.isColorsVisible == isColorsVisible && other.isSearching == isSearching;
  }

  @override
  int get hashCode => isColorsVisible.hashCode ^ isSearching.hashCode;
}
