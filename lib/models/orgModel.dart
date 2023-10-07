class OrgModel {
  String uid;
  String name;
  String email;
  String website;
  int eventDate;

  OrgModel(this.uid, this.name, this.email, this.website, this.eventDate);

  factory OrgModel.fromMap(Map<String, dynamic> map) {
    return OrgModel(
      map['uid'] ?? '',
      map['name'] ?? '',
      map['email'] ?? '',
      map['website'] ?? '',
      map['eventDate'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'website': website,
      'eventDate': eventDate,
    };
  }

  @override
  String toString() {
    return 'OrgModel{uid: $uid, name: $name, email: $email, website: $website, eventDate: $eventDate}';
  }
}
