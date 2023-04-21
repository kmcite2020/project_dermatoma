// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Patterns {
  final bool? localizedOrGeneralized;
  final bool? unilateralOrBilateral;
  final bool? symmetricalOrAssymetrical;
  final bool? truncalOrAcral;
  final bool? flexorOrExtensor;
  final bool? expsedOrCovered;
  Patterns({
    this.localizedOrGeneralized,
    this.unilateralOrBilateral,
    this.symmetricalOrAssymetrical,
    this.truncalOrAcral,
    this.flexorOrExtensor,
    this.expsedOrCovered,
  });

  Patterns copyWith({
    bool? localizedOrGeneralized,
    bool? unilateralOrBilateral,
    bool? symmetricalOrAssymetrical,
    bool? truncalOrAcral,
    bool? flexorOrExtensor,
    bool? expsedOrCovered,
  }) {
    return Patterns(
      localizedOrGeneralized: localizedOrGeneralized ?? this.localizedOrGeneralized,
      unilateralOrBilateral: unilateralOrBilateral ?? this.unilateralOrBilateral,
      symmetricalOrAssymetrical: symmetricalOrAssymetrical ?? this.symmetricalOrAssymetrical,
      truncalOrAcral: truncalOrAcral ?? this.truncalOrAcral,
      flexorOrExtensor: flexorOrExtensor ?? this.flexorOrExtensor,
      expsedOrCovered: expsedOrCovered ?? this.expsedOrCovered,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'localizedOrGeneralized': localizedOrGeneralized,
      'unilateralOrBilateral': unilateralOrBilateral,
      'symmetricalOrAssymetrical': symmetricalOrAssymetrical,
      'truncalOrAcral': truncalOrAcral,
      'flexorOrExtensor': flexorOrExtensor,
      'expsedOrCovered': expsedOrCovered,
    };
  }

  factory Patterns.fromMap(Map<String, dynamic> map) {
    return Patterns(
      localizedOrGeneralized: map['localizedOrGeneralized'] != null ? map['localizedOrGeneralized'] as bool : null,
      unilateralOrBilateral: map['unilateralOrBilateral'] != null ? map['unilateralOrBilateral'] as bool : null,
      symmetricalOrAssymetrical: map['symmetricalOrAssymetrical'] != null ? map['symmetricalOrAssymetrical'] as bool : null,
      truncalOrAcral: map['truncalOrAcral'] != null ? map['truncalOrAcral'] as bool : null,
      flexorOrExtensor: map['flexorOrExtensor'] != null ? map['flexorOrExtensor'] as bool : null,
      expsedOrCovered: map['expsedOrCovered'] != null ? map['expsedOrCovered'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Patterns.fromJson(String source) => Patterns.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Patterns(localizedOrGeneralized: $localizedOrGeneralized, unilateralOrBilateral: $unilateralOrBilateral, symmetricalOrAssymetrical: $symmetricalOrAssymetrical, truncalOrAcral: $truncalOrAcral, flexorOrExtensor: $flexorOrExtensor, expsedOrCovered: $expsedOrCovered)';
  }

  @override
  bool operator ==(covariant Patterns other) {
    if (identical(this, other)) return true;

    return other.localizedOrGeneralized == localizedOrGeneralized &&
        other.unilateralOrBilateral == unilateralOrBilateral &&
        other.symmetricalOrAssymetrical == symmetricalOrAssymetrical &&
        other.truncalOrAcral == truncalOrAcral &&
        other.flexorOrExtensor == flexorOrExtensor &&
        other.expsedOrCovered == expsedOrCovered;
  }

  @override
  int get hashCode {
    return localizedOrGeneralized.hashCode ^
        unilateralOrBilateral.hashCode ^
        symmetricalOrAssymetrical.hashCode ^
        truncalOrAcral.hashCode ^
        flexorOrExtensor.hashCode ^
        expsedOrCovered.hashCode;
  }
}
