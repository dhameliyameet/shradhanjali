import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shradhanjalipage/detail.dart';

class section extends StatefulWidget {
  const section({super.key});

  @override
  State<section> createState() => _sectionState();
}

class _sectionState extends State<section> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        automaticallyImplyLeading: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.blue.shade100,
              Colors.blue.shade200,
              Colors.blue.shade300
            ])),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: mq.width,
                // color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/apkimg.png",
                        height: mq.height / 6.5,
                        width: mq.width / 3,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => Userdetail(),
                        ));
                      },
                      child: Container(
                        height: 50,
                        width: mq.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Center(
                            child: Text(
                          "Shradhanjali",
                          style: TextStyle(fontSize: 20),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: mq.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                          child: Text(
                        "Besnu",
                        style: TextStyle(fontSize: 20),
                      )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: mq.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                          child: Text(
                        "Panidhol",
                        style: TextStyle(fontSize: 20),
                      )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: mq.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                          child: Text(
                        "OM shanti",
                        style: TextStyle(fontSize: 20),
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
