import 'package:flutter/material.dart';
import 'package:social_fund_web_app/UI/comp_page.dart';
import 'package:social_fund_web_app/UI/orgs_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  buttonOnClicked(bool isOrg) {
    if (isOrg) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const OrgPage()), (Route route) => false);
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
          child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
            ),
            Column(
              children: const [
                Text(
                  'Social Funds.',
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.w800),
                ),
                Text('Your search for funds, ends here.', style: TextStyle(fontSize: 48, color: Colors.black54, fontWeight: FontWeight.w700)),
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => buttonOnClicked(true),
                    child: const Text(
                      'Looking for sponsors',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => buttonOnClicked(false),
                    child: const Text(
                      'Want to Sponsor',
                      style: TextStyle(fontSize: 24),
                    ),
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
