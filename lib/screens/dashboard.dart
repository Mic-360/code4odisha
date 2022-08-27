import 'package:code4odisha/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../buttons/roundedbuttons.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List list = [];

  var uName;
  var tName;
  var tid;
  var statement;
  var table;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await SharedPreferences.getInstance().then((prefs) {
      list = [
        '${prefs.getString('m1Name')}',
        '${prefs.getString('m2Name')}',
      ];
      if (prefs.getString('m3Name') != null) {
        setState(() {
          list.add(prefs.getString('m3Name'));
        });
      }

      if (prefs.getString('m4Name') != null) {
        setState(() {
          list.add(prefs.getString('m4Name'));
        });
      }

      if (prefs.getString('lName') != null) {
        setState(() {
          list.add(prefs.getString('lName'));
        });
      }

      setState(() {
        uName = prefs.getString('uName');
        tName = prefs.getString('tName');
        table = prefs.getString('table');
        tid = prefs.getString('tid');
        statement = prefs.getString('probStatement');
        table = prefs.getString('table');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 41,
                      child: Icon(
                        Icons.groups,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      tName ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: [
                        const Text(
                          'Team ID',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: RoundedButtonWidget(
                            width: MediaQuery.of(context).size.width * 0.1,
                            buttonText: tid ?? '0',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          'Table Number ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: RoundedButtonWidget(
                            width: MediaQuery.of(context).size.width * 0.1,
                            buttonText: table ?? ' 2 ',
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      for (var text in list)
                        RoundedButtonWidget(
                          buttonText: text,
                          width: MediaQuery.of(context).size.width * 0.8,
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Problem Statement',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          statement ?? 'Problem Statement',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
