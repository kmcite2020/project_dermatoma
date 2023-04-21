import 'dart:convert';

class MainModel {
  final int? selectedIndex;
  final bool? isSearching;
  MainModel({
    this.selectedIndex,
    this.isSearching,
  });

  MainModel copyWith({
    int? selectedIndex,
    bool? isSearching,
  }) {
    return MainModel(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'selectedIndex': selectedIndex,
      'isSearching': isSearching,
    };
  }

  factory MainModel.fromMap(Map<String, dynamic> map) {
    return MainModel(
      selectedIndex: map['selectedIndex'] != null ? map['selectedIndex'] as int : null,
      isSearching: map['isSearching'] != null ? map['isSearching'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MainModel.fromJson(String source) => MainModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MainModel(selectedIndex: $selectedIndex, isSearching: $isSearching)';

  @override
  bool operator ==(covariant MainModel other) {
    if (identical(this, other)) return true;

    return other.selectedIndex == selectedIndex && other.isSearching == isSearching;
  }

  @override
  int get hashCode => selectedIndex.hashCode ^ isSearching.hashCode;
}
