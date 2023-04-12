// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Patterns {
  final bool localizedOrGeneralized;
  final bool unilateralOrBilateral;
  final bool symmetricalOrAssymetrical;
  final bool truncalOrAcral;
  final bool flexorOrExtensor;
  final bool expsedOrCovered;
  Patterns({
    required this.localizedOrGeneralized,
    required this.unilateralOrBilateral,
    required this.symmetricalOrAssymetrical,
    required this.truncalOrAcral,
    required this.flexorOrExtensor,
    required this.expsedOrCovered,
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
      localizedOrGeneralized: map['localizedOrGeneralized'] as bool,
      unilateralOrBilateral: map['unilateralOrBilateral'] as bool,
      symmetricalOrAssymetrical: map['symmetricalOrAssymetrical'] as bool,
      truncalOrAcral: map['truncalOrAcral'] as bool,
      flexorOrExtensor: map['flexorOrExtensor'] as bool,
      expsedOrCovered: map['expsedOrCovered'] as bool,
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
