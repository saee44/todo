import 'package:flutter/material.dart';
import 'package:todo/dashboard.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  

  

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
                      Container(height: 300, width: 270),
                      Positioned(
                        left: 95,
                        top: -12,
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            color: Color(0X968FE1D7),
                          ),
                        ),
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
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Container(
              height: 27,
              width: 139,
              //color: Colors.amber,
              child: Text(
                "Welcome back",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff000000),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 138,
              width: 184,
              //color: Colors.black,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/image2.png")),
              ),
            ),
            SizedBox(height: 70),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 380,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        hintText: "Enter your Email",
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                      validator: (value) {
                        if (value != "saee.jambhale") {
                          return "invalid username";
                        }
                      },
                      controller: namecontroller,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    width: 380,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Password",
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                      validator: (value) {
                        if (value != "12345") {
                          return "invalid password";
                        }
                      },
                      controller: passcontroller,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Forget password ?",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff50C2C9),
                    ),
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dashboard()),
                        );
                      }
                    },
                    child: Container(
                      height: 60,
                      width: 380,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff50C2C9),
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 25,
                    width: 295,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account ?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            " Sign Up",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff50C2C9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
