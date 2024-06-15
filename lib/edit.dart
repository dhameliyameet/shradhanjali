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
            height: MediaQuery.of(context).size.height * 0.7,
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
              color: Colors.deepPurpleAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: mq.width * 0.46,
                        height: mq.height * 0.06,
                        color: Colors.white,
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
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          width: mq.width * 0.46,
                          height: mq.height * 0.06,
                          color: Colors.white,
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
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: mq.width * 0.46,
                        height: mq.height * 0.06,
                        color: Colors.white,
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
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  color: Colors.orange,
                                  height: 250,
                                );
                              },
                            );
                          },
                          child: Container(
                            width: mq.width * 0.46,
                            height: mq.height * 0.06,
                            color: Colors.white,
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
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      width: mq.width * 0.60,
                      height: mq.height * 0.06,
                      color: Colors.white,
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
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
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
