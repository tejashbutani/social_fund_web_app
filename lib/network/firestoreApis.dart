import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_fund_web_app/models/compModel.dart';
import 'package:social_fund_web_app/models/requestModel.dart';

class FirestoreApis {
  Future<List<RequestModel>> getOrgRequests(String orgId) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('requests').where('orgUid', isEqualTo: orgId).get();

      List<RequestModel> reqs = [];

      querySnapshot.docs.forEach((element) {
        reqs.add(RequestModel.fromMap(element.data()));
        print(element.get('uid'));
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
         print(element.get('uid'));
      });

      return comps;
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }
}
