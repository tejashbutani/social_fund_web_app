import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_fund_web_app/models/compModel.dart';
import 'package:social_fund_web_app/models/orgModel.dart';
import 'package:social_fund_web_app/models/requestModel.dart';

class FirestoreApis {
  Future<OrgModel> getOrg(String orgId) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('requests').doc(orgId).get();
    if (snapshot.exists) {
      return OrgModel.fromMap(snapshot.data());
    } else {
      return OrgModel("", "", "", "", 0);
    }
  }

  Future<List<RequestModel>> getOrgRequests(String orgId) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('requests').where('orgUid', isEqualTo: orgId).get();

      List<RequestModel> reqs = [];

      querySnapshot.docs.forEach((element) {
        reqs.add(RequestModel.fromMap(element.data()));
      });

      return reqs;
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  Future<List<CompModel>> getAllComps() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('comps').get();

      List<CompModel> comps = [];

      querySnapshot.docs.forEach((element) {
        comps.add(CompModel.fromMap(element.data()));
      });

      return comps;
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }
}
