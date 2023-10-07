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
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => buttonOnClicked(true),
                child: const Text('Orgainser'),
              ),
            ),
            const SizedBox(
              width: 100,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () => buttonOnClicked(false),
                child: const Text('Company'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
