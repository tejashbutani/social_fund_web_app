import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:social_fund_web_app/models/compModel.dart';
import 'package:social_fund_web_app/models/orgModel.dart';
import 'package:social_fund_web_app/network/firestoreApis.dart';
import 'package:social_fund_web_app/utils.dart';
import 'package:social_fund_web_app/widgets/custom_loader.dart';
import 'package:http/http.dart' as http;

class ApplyPage extends StatefulWidget {
  CompModel compModel;
  String orgId;
  ApplyPage(this.compModel, this.orgId, {Key? key}) : super(key: key);

  @override
  State<ApplyPage> createState() => _ApplyPageState();
}

class _ApplyPageState extends State<ApplyPage> {
  late OrgModel orgModel;
  bool aiProcessing = false;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    orgModel = await FirestoreApis().getOrg(widget.orgId);
  }

  uploadClicked() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);
    setState(() {
      aiProcessing = true;
    });
    generateAiProposal();
  }

  generateAiProposal() async {
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      aiProcessing = false;
    });
    animateText();
  }

  animateText() async {
    controller.text = "";
    for (int i = 0; i < Utils().AiInput.characters.length; i++) {
     controller.text = controller.text.toString() + Utils().AiInput.characters.elementAt(i);
      await Future.delayed(Duration(microseconds: 100));
    }
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
      body: body(),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  'Apply to ${widget.compModel.name}',
                  style: const TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Text(
                'Secure Support for Your Social Event, apply to ${widget.compModel.name} for Sponsorship',
                style: const TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            uploadWidget(),
            const Center(
              child: Text(
                'or',
                style: TextStyle(color: Colors.black45, fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            textBox(),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.only(right: 36),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Text("Submit Application", style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget uploadWidget() {
    return InkWell(
      onTap: () {
        if (!aiProcessing) {
          uploadClicked();
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.fromLTRB(36, 24, 36, 16),
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: Colors.grey.shade100,
        ),
        alignment: Alignment.center,
        child: aiProcessing
            ? CustomLoader()
            : Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.upload_file_outlined,
                    size: 48,
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'upload your sponsorship deck to generate custom sponsorship proposal for ${widget.compModel.name}.',
                    style: const TextStyle(color: Colors.black45, fontSize: 16),
                  ),
                ],
              ),
      ),
    );
  }

  Widget textBox() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.fromLTRB(36, 0, 36, 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: Colors.grey.shade100,
      ),
      alignment: Alignment.center,
      child: TextField(
        controller: controller,
        maxLines: 20,
        minLines: 20,
        decoration: InputDecoration(border: InputBorder.none, hintText: 'Type your Formal Proposal for ${widget.compModel.name} here ...', hintStyle: TextStyle(color: Colors.grey)),
      ),
    );
  }
}
