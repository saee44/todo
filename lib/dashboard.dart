import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController task = TextEditingController();
  List todo = [];
  List colors = [];

  CollectionReference tasks = FirebaseFirestore.instance.collection("tasks");
  Future<void> addData() async {
    await tasks.add({"task": task.text});
    task.clear();
  }

  Future<void> delete(String docid) async {
    tasks.doc(docid).delete();
  }

  void change_color(int index) {
    setState(() {
      if (colors[index] == Colors.white) {
        colors[index] = Color(0xff50C2C9);
      } else {
        colors[index] = Colors.white;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Color(0xff50C2C9),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        //color: Colors.amber,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.amber,
                          image: DecorationImage(
                            image: AssetImage("assets/image3.png"),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          height: 27,
                          width: 225,
                          //color: Colors.amber,
                          child: Center(
                            child: Text(
                              "Welcome Saee jambhale",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                        //color: Color(0xff50C2C9),
                      ),
                      Positioned(
                        left: 95,
                        top: -12,
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(300),
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
                            borderRadius: BorderRadius.circular(300),
                            color: Color(0X968FE1D7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 250),
              child: Text(
                "Good Afternoon",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(120),
                image: DecorationImage(image: AssetImage("assets/clock.png")),
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(right: 300),
              child: Text(
                "Task list",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 309,
              width: 382,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(137, 68, 68, 68),
                    offset: Offset(0, 0),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 289,
                          color: Color(0xffEDD7D7),
                          child: Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 12,
                                ),
                                border: InputBorder.none,
                              ),
                              controller: task,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            addData();
                          },
                          child: Container(
                            height: 27,
                            width: 24,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/plus.png"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Expanded(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: tasks.snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          var docs = snapshot.data!.docs;

                          if (colors.length < docs.length) {
                            for (int i = colors.length; i < docs.length; i++) {
                              colors.add(Colors.white);
                            }
                          }

                          //var docs = snapshot.data!.docs;
                          return Container(
                            height: 200,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: docs.length,
                              itemBuilder: (context, index) {
                                var doc = docs[index];

                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          change_color(index);
                                        },
                                        child: Container(
                                          height: 17,
                                          width: 17,
                                          decoration: BoxDecoration(
                                            color: colors[index],
                                            border: Border.all(
                                              color: const Color.fromARGB(
                                                255,
                                                25,
                                                1,
                                                1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        height: 18,

                                        //color: Colors.black,
                                        child: InkWell(
                                          onTap: () {
                                            delete(doc.id);
                                          },
                                          child: Text(doc["task"]),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
