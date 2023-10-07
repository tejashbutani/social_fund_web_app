import 'package:flutter/material.dart';
import 'package:social_fund_web_app/UI/comp_page.dart';
import 'package:social_fund_web_app/UI/orgs_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  buttonOnClicked(bool isOrg) {
    if (isOrg) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => OrgPage()), (Route route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => CompPage()), (Route route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
             children: [
              SizedBox(height: 200, width: MediaQuery.of(context).size.width,),
              Column(
                children: [
                  Text('Social Funds.', style: TextStyle(fontSize: 60, fontWeight: FontWeight.w800),),
                Text('Your search for funds, ends here.', style: TextStyle(fontSize: 48, fontWeight: FontWeight.w800)),
                ],
              ),
            Row(
              children: [
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => buttonOnClicked(true),
                    child: const Text('Looking for sponsors'),
                  ),
                ),
                SizedBox(
              width: 50,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () => buttonOnClicked(false),
                child: const Text('Want to Sponsor'),
              ),
            ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
