import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/loginscreen.dart';

class Splashscreen extends StatelessWidget {
  Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  //color: Color.fromARGB(148, 233, 252, 250)
                ),
                Positioned(
                    left: -100,
                    top: -87,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 300,
                          width: 270,
                        ),
                        Positioned(
                          left: 95,
                          top: -12,
                          child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  color: Color(0X968FE1D7))),
                        ),
                        Positioned(
                          left: -12,
                          top: 50,
                          child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Color(0X968FE1D7),
                              )),
                        )
                      ],
                    ))
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 194,
              width: 254,
              //color: Colors.amber,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("assets/image1.png"))),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 27,
              width: 201,
              child: Text(
                "Gets things with TODs",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Color(0xff000000)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 120,
              width: 203,
              child: Center(
                child: Text(
                  "Lorem ipsum dolor sit amet consectetur. Eget sit nec et euismod. Consequat urna quam felis interdum quisque. Malesuada adipiscing tristique ut eget sed.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Color(0xff000000)),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Loginscreen(),
                    ));
              },
              child: Container(
                height: 60,
                width: 380,
                decoration: BoxDecoration(
                    color: Color(0xff50C2C9),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
