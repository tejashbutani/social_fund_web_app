class CompModel {
  String uid;
  String name;
  String email;
  String website;
  String logo;

  CompModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.website,
    required this.logo,
  });

  factory CompModel.fromMap(json) {
    return CompModel(
      uid: json['uid'] ?? '',
      name: json['name'] ?? '',
      email: json['mail'] ?? '',
      website: json['website'] ?? '',
      logo: json['logo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'mail': email,
      'website': website,
      'logo': logo,
    };
  }
}
