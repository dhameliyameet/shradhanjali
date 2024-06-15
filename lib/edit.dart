import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Masterpage extends StatefulWidget {
  const Masterpage({super.key});

  @override
  State<Masterpage> createState() => _MasterpageState();
}

class _MasterpageState extends State<Masterpage> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: Text(
          "શ્રદ્ધાંજલિ",
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Container(
            width: mq.width,
            height: MediaQuery.of(context).size.height * 0.65,
            child: SingleChildScrollView(
              child: Container(
                color: Colors.blue,
                child: Image(
                  image: NetworkImage(
                      "https://www.desievite.com/sample-ecard/language/Gujarati-bhavpurna-shradhanjali-invitation-card-template-75.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              // color: Colors.deepPurpleAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: mq.width * 0.46,
                        height: mq.height * 0.06,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.white,
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.blue.shade50,
                                  Colors.blue.shade100,
                                  Colors.blue.shade200,
                                  Colors.blue.shade300
                                ]),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.download),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Download",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: mq.width * 0.46,
                        height: mq.height * 0.06,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.blue.shade50,
                                  Colors.blue.shade100,
                                  Colors.blue.shade200,
                                  Colors.blue.shade300
                                ]),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.share),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Share",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: mq.width * 0.46,
                        height: mq.height * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.blue.shade50,
                                Colors.blue.shade100,
                                Colors.blue.shade200,
                                Colors.blue.shade300
                              ]),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.credit_card_sharp),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Card",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                decoration: BoxDecoration(
                                    // color: Colors.orange,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25))),
                                height: 250,
                              );
                            },
                          );
                        },
                        child: Container(
                          width: mq.width * 0.46,
                          height: mq.height * 0.06,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.blue.shade50,
                                    Colors.blue.shade100,
                                    Colors.blue.shade200,
                                    Colors.blue.shade300
                                  ]),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.edit),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Edit",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: mq.width * 0.46,
                    height: mq.height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.blue.shade50,
                              Colors.blue.shade100,
                              Colors.blue.shade200,
                              Colors.blue.shade300
                            ])),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.audiotrack),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Audio",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
