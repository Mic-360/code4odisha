import 'package:code4odisha/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../buttons/helproundedbuttons.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  String? memID;
  String? teamID;
  String? tName;
  String? email;

  void initState() {
    super.initState();
    getID();
  }

  @override
  void getID() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      memID = pref.getString('uid');
      teamID = pref.getString('tid');
      email = pref.getString('email');
      tName = pref.getString('tName');
    });
  }

  final TextEditingController _msgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            color: Colors.black,
            height: 850,
            width: 700,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(35, 35, 35, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "The Odisha's Biggest Coding Hackathon. A 24-hour offline hackathon where participants will ideate, innovate and present solutions to the problems of the state Odisha.",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.amber.shade900,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        height: 350,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                          child: Column(
                            children: [
                              const Text(
                                'For Any Queries click',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              HelpRoundedButtonWidget(
                                width: MediaQuery.of(context).size.width * 0.8,
                                buttonText: 'Technical Support',
                                onpressed: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text(
                                      'Technical Support',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    content: const Text(
                                      'You want to confirm',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'No'),
                                        child: const Text(
                                          'No',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 111, 0, 1)),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async =>
                                            await Issue.issues(
                                                    memID,
                                                    teamID,
                                                    'Technical Support',
                                                    context)
                                                .whenComplete(() {
                                          Navigator.pop(context, 'Yes');
                                        }),
                                        child: const Text(
                                          'Yes',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 111, 0, 1)),
                                        ),
                                      ),
                                    ],
                                    backgroundColor: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              HelpRoundedButtonWidget(
                                width: MediaQuery.of(context).size.width * 0.8,
                                buttonText: 'Medical Support',
                                onpressed: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text(
                                      'Medical Support',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    content: const Text(
                                      'You want to confirm',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'No'),
                                        child: const Text(
                                          'No',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 111, 0, 1)),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async =>
                                            await Issue.issues(memID, teamID,
                                                    'Medical Support', context)
                                                .whenComplete(() {
                                          Navigator.pop(context, 'Yes');
                                        }),
                                        child: const Text(
                                          'Yes',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 111, 0, 1)),
                                        ),
                                      ),
                                    ],
                                    backgroundColor: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              HelpRoundedButtonWidget(
                                width: MediaQuery.of(context).size.width * 0.8,
                                buttonText: 'Others',
                                onpressed: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text(
                                      'Support',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    content: const Text(
                                      'You want to confirm',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'No'),
                                        child: const Text(
                                          'No',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 111, 0, 1)),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async =>
                                            await Issue.issues(memID, teamID,
                                                    'Others', context)
                                                .whenComplete(() {
                                          Navigator.pop(context, 'Yes');
                                        }),
                                        child: const Text(
                                          'Yes',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 111, 0, 1)),
                                        ),
                                      ),
                                    ],
                                    backgroundColor: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              HelpRoundedButtonWidget(
                                width: MediaQuery.of(context).size.width * 0.8,
                                buttonText: 'Feedback Form',
                                onpressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          scrollable: true,
                                          title: const Text('Feedback'),
                                          content: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Form(
                                              child: Column(
                                                children: <Widget>[
                                                  TextFormField(
                                                    controller: _msgController,
                                                    decoration:
                                                        const InputDecoration(
                                                      labelText: 'Message',
                                                      icon: Icon(Icons.message),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          actions: [
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  // minimumSize: Size(1,3),
                                                  foregroundColor: Colors.white,
                                                  backgroundColor:
                                                      Colors.amber.shade900,
                                                ),
                                                child: const Text(
                                                  "Submit",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                onPressed: () async {
                                                  await Feed.issues(
                                                          email,
                                                          tName,
                                                          _msgController.text,
                                                          context)
                                                      .whenComplete(() {
                                                    _msgController.clear();
                                                    Navigator.pop(context);
                                                  });
                                                })
                                          ],
                                        );
                                      });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'code4odisha@gmail.com',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Phone',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Saswat Samal (Coordinator)',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    '+91 8637247879',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  const Text(
                    'Sanket S. Pattanaik (Coordinator)',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    '+91 7735020517',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  const Text(
                    'Nandan Singh (Coordinator)',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    '+91 9337195193',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Copyright © 2022 Code 4 Odisha. All rights reserved.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
