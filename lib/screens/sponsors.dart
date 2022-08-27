import 'package:code4odisha/buttons/roundedbuttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Sponsers extends StatelessWidget {
  const Sponsers({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange.shade100,
        body: Center(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.8, 1),
                  colors: <Color>[
                    Color(0xff1f005c),
                    Color(0xff5b0060),
                    Color(0xff870160),
                    Color(0xffac255e),
                    Color(0xffca485c),
                    Color(0xffe16b5c),
                    Color(0xfff39060),
                    Color(0xffffb56b),
                  ],
                  tileMode: TileMode.mirror,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: RoundedButtonWidget(
                      buttonText: 'Our Sponsors',
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/logos/1 (13).png',
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'images/logos/1 (1).jpg',
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'images/logos/1 (14).png',
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/logos/1 (17).png',
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        'images/logos/1 (2).png',
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        'images/logos/1 (3).png',
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/logos/1 (6).png',
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'images/logos/1 (12).png',
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'images/logos/1 (2).jpg',
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/logos/1 (10).png',
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                      Image.asset(
                        'images/logos/1 (11).png',
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'images/logos/1 (4).png',
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/logos/1 (9).png',
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'images/logos/1 (7).png',
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'images/logos/1 (13).png',
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/logos/1 (5).png',
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'images/logos/1 (1).png',
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                      SizedBox(
                        width: 5,
                      ),

                      ///image
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/logos/1 (15).png',
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'images/logos/1 (16).png',
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/logos/new (1).png',
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'images/logos/new (2).png',
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
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
