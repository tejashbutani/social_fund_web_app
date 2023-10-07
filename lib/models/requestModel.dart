class RequestModel {
  String orgUid;
  String orgName;
  String orgEmail;
  String orgWebsite;
  int orgEventDate;
  String compUid;
  String compName;
  String compEmail;
  String compWebsite;
  String compLogo;
  String uid;
  String status;
  int createdDate;

  RequestModel(
    this.orgUid,
    this.orgName,
    this.orgEmail,
    this.orgWebsite,
    this.orgEventDate,
    this.compUid,
    this.compName,
    this.compEmail,
    this.compWebsite,
    this.compLogo,
    this.uid,
    this.status,
    this.createdDate
  );

  factory RequestModel.fromMap(map) {
    return RequestModel(
      map['orgUid'] ?? '',
      map['orgName'] ?? '',
      map['orgEmail'] ?? '',
      map['orgWebsite'] ?? '',
      map['orgEventDate'] ?? 0,
      map['compUid'] ?? '',
      map['compName'] ?? '',
      map['compEmail'] ?? '',
      map['compWebsite'] ?? '',
      map['compLogo'] ?? '',
      map['uid'] ?? '',
      map['status'] ?? '',
      map['createdDate'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orgUid': orgUid,
      'orgName': orgName,
      'orgEmail': orgEmail,
      'orgWebsite': orgWebsite,
      'orgEventDate': orgEventDate,
      'compUid': compUid,
      'compName': compName,
      'compEmail': compEmail,
      'compWebsite': compWebsite,
      'compLogo': compLogo,
      'uid': uid,
      'status': status,
      'createdDate': createdDate,
    };
  }

  @override
  String toString() {
    return 'RequestModel{orgUid: $orgUid, orgName: $orgName, orgEmail: $orgEmail, orgWebsite: $orgWebsite, orgEventDate: $orgEventDate, compUid: $compUid, compName: $compName, compEmail: $compEmail, compWebsite: $compWebsite, compLogo: $compLogo, uid: $uid, status: $status, createdDate: $createdDate}';
  }
}
