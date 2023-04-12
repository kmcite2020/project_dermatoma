import 'dart:convert';

class Contact {
  final int countryCode;
  final int mnp;
  final int phoneCode;
  Contact({
    required this.countryCode,
    required this.mnp,
    required this.phoneCode,
  }) {
    final phoneNumber = countryCode.toString() + mnp.toString() + phoneCode.toString();
    if (phoneNumber.length <= 10 || phoneNumber.length > 14) {
      throw Exception('Wrong phone number');
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'countryCode': countryCode,
      'mnp': mnp,
      'phoneCode': phoneCode,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      countryCode: map['countryCode'] as int,
      mnp: map['mnp'] as int,
      phoneCode: map['phoneCode'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) => Contact.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => '+$countryCode $mnp $phoneCode';
}
