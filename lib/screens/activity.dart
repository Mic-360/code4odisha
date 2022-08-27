import 'dart:ffi';

import 'package:code4odisha/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  String? broadcast = 'Broadcasting Disabled';
  String? teamNames;
  String? tid;
  String? status;
  MaterialColor? color;

  @override
  void initState() {
    super.initState();
    _Status();
    _broadcast();
  }

  Future _Status() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      tid = pref.getString('tid');
    });
    await TeamList.getList(tid);
    setState(() {
      teamNames = pref.getString('teams');
      status = pref.getString('status');
    });
    _setcolor();
  }

  Future _broadcast() async {
    await Broadcast.getcast();
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      broadcast = pref.getString('broadcast');
    });
  }

  void _setcolor() {
    if (status == 'GREEN') {
      setState(() {
        color = Colors.green;
      });
    } else if (status == 'YELLOW') {
      setState(() {
        color = Colors.yellow;
      });
    } else {
      setState(() {
        color = Colors.red;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: MarqueeText(
                text: TextSpan(
                  text: broadcast ?? 'No broadcast',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 5,
                    blurRadius: 9,
                    offset: Offset(10.0, 6.0),
                  ),
                ],
              ),
              height: 380,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "TEAM STATUS",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Image.asset('images/soft_dev.png'),
                  const Text(
                    "\nYOU ARE IN",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Text(
                    "${status} ZONE",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 66.6),
              alignment: Alignment.topRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  textStyle: const TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                child: const Text('Team List'),
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('TEAM STATUS'),
                    content: Text(
                      teamNames ?? 'No Teams',
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
