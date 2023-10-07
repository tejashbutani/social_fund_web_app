import 'package:flutter/material.dart';
import 'package:social_fund_web_app/models/compModel.dart';
import 'package:social_fund_web_app/models/requestModel.dart';
import 'package:social_fund_web_app/network/firestoreApis.dart';
import 'package:social_fund_web_app/utils.dart';
import 'package:social_fund_web_app/widgets/custom_loader.dart';

class OrgPage extends StatefulWidget {
  const OrgPage({Key? key}) : super(key: key);

  @override
  State<OrgPage> createState() => _OrgPageState();
}

class _OrgPageState extends State<OrgPage> {
  bool isLoading = true;
  String OrgId = "Ed9fbUlRNdgqlE11kQxG";
  List<RequestModel> requests = [];
  List<CompModel> comps = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    final requestsData = await FirestoreApis().getOrgRequests(OrgId);
    final compData = await FirestoreApis().getAllComps();
    setState(() {
      isLoading = false;
      requests = requestsData;
      comps = compData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: const [
            SizedBox(
              width: 24,
            ),
            Icon(
              Icons.home_filled,
              color: Colors.blue,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              'Home',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
        actions: const [
          Center(
              child: Padding(
            padding: EdgeInsets.only(right: 24),
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          )),
        ],
      ),
      body: isLoading ? CustomLoader() : body(),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 24,
            ),
            const Text(
              'Your Applications',
              style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: requests.isEmpty ? 0 : 24,
            ),
            requests.isEmpty
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Colors.grey.shade100,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'You haven\'t applied to any sponsorships yet.',
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                  )
                : ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: requests.length,
                    itemBuilder: (context, index) {
                      return requestItem(requests[index]);
                    },
                  ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Apply to Sponsors',
              style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 24,
            ),
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: comps.length,
                itemBuilder: (BuildContext context, int index) {
                  return sponsorItem(comps[index]);
                }),
          ],
        ),
      ),
    );
  }

  Widget requestItem(RequestModel requestModel) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      elevation: 6,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 60, child: Image.network(requestModel.compLogo)),
                    Text(
                      requestModel.compName,
                      style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Utils().getStatusColor(requestModel.status).withOpacity(0.1),
                  ),
                  child: Text(
                    requestModel.status,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Utils().getStatusColor(requestModel.status), fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Applied on ${DateTime.fromMillisecondsSinceEpoch(requestModel.createdDate).day}/${DateTime.fromMillisecondsSinceEpoch(requestModel.createdDate).month}/${DateTime.fromMillisecondsSinceEpoch(requestModel.createdDate).year}",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget sponsorItem(CompModel comp) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      elevation: 6,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: SizedBox(width: 180, child: Image.network(comp.logo)),
      ),
    );
  }
}
