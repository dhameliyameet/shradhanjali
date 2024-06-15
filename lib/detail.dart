import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shradhanjalipage/description.dart';
import 'package:shradhanjalipage/edit.dart';

class Userdetail extends StatefulWidget {
  const Userdetail({super.key});

  @override
  State<Userdetail> createState() => _UserdetailState();
}

class _UserdetailState extends State<Userdetail> {
  String imgpath = "";
  var CardName = TextEditingController();
  var fName = TextEditingController();
  var lName = TextEditingController();
  var cName = TextEditingController();
  var Age = TextEditingController();
  var Date = TextEditingController();
  var village = TextEditingController();
  var lDate = TextEditingController();
  var Time = TextEditingController();
  var Address = TextEditingController();
  // var Title = TextEditingController();
  // var Name = TextEditingController();
  // var Phoneno = TextEditingController();
  var Desc = TextEditingController();
  int selectedIndex = -1;

  // List<Widget> _row = [];
  List<ContainerModel> _container = [];
  List relation = [
    "પિતા",
    "માતા",
    "કાકા",
    "કાકી",
    "દાદા",
    "દાદી",
    "નાના",
    "નાની",
    "મામા",
    "મામી",
    "સસરા",
    "સાસુ",
    "પતિ",
    "પત્ની",
    "ભાઈ",
    "બહેન",
    "દીકરો",
    "દીકરી",
    "બનેવી",
    "સાળા",
    "પુત્રવધુ",
    "જમાઈ",
    "ભત્રીજા (ભાઈનો દીકરો)",
    "ભત્રીજા (બહેનનો દીકરો)",
    "ભત્રીજી (ભાઈની દીકરી)",
    "ભત્રીજી (બહેનની દીકરી)",
    "મિત્ર",
    "સબંધી"
  ];
  List foundUser = [];
  // int index = 0;
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // addNewRow();
    addNewContainer();
    foundUser = relation;
    fName.text = "સ્વ.";
    CardName.text = "શ્રદ્ધાંજલિ";
  }

  void _removeContainer(int index) {
    setState(() {
      // Remove the row with the specific identifier
      _container.removeWhere((container) => container.id == index);
    });
  }

  void addNewContainer() {
    _container.add(ContainerModel(count, notifyParent));
    print("$count+++++++co+++++++");
    count++;
    setState(() {});
  }

  void notifyParent() {
    setState(() {});
  }

  XFile? file;

  Future<void> cropImage(String path) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      compressFormat: ImageCompressFormat.jpg,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Your Image',
          toolbarColor: Color(0xff9DA0E8),
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false,
          activeControlsWidgetColor: Color(0xff9DA0E8),

          // aspectRatioPresets: [
          //   CropAspectRatioPreset.original,
          //   CropAspectRatioPreset.square,
          //   CropAspectRatioPreset.ratio4x3,
          //   // CropAspectRatioPresetCustom(),
          // ],
        ),
        IOSUiSettings(
          title: 'Crop Your Image',
          // aspectRatioPresets: [
          //   CropAspectRatioPreset.original,
          //   CropAspectRatioPreset.square,
          //   CropAspectRatioPreset.ratio4x3,
          //   CropAspectRatioPresetCustom(),
          // ],
        ),
      ],
    );
    file = XFile(croppedFile!.path);
    setState(() {});
  }

  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("શ્રદ્ધાંજલિ"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.restart_alt_outlined,
                size: 30,
              ))
        ],
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor: Colors.transparent,
                              insetPadding: EdgeInsets.all(10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  child: file == null
                                      ? Image.asset("assets/profile.png")
                                      : Image.file(File(file!.path)),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.blue,
                        backgroundImage: file == null
                            ? Image.asset("assets/profile.png").image
                            : Image.file(File(file!.path)).image,
                      ),
                    ),
                    Positioned(
                        bottom: 1,
                        right: 1,
                        child: InkWell(
                          onTap: () async {
                            ImagePicker imagePicker = ImagePicker();
                            file = await imagePicker.pickImage(
                                source: ImageSource.gallery);
                            if (file!.path.isNotEmpty) {
                              imgpath = file!.path;
                              cropImage(imgpath);
                            }
                            setState(() {});
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(Icons.camera_enhance),
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "કાર્ડ નું નામ",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                child: TextFormField(
                  controller: CardName,
                  cursorOpacityAnimates: true,
                  cursorRadius: Radius.circular(10),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      border: InputBorder.none,
                      hintText: "કાર્ડ નું નામ"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "મૃતકનું નામ",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    width: mq.width / 5,
                    child: Card(
                      child: TextFormField(
                        controller: fName,
                        cursorOpacityAnimates: true,
                        cursorRadius: Radius.circular(10),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(18, 12, 18, 12),
                          border: InputBorder.none,
                          hintText: "સ્વ.",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: TextFormField(
                        controller: lName,
                        cursorOpacityAnimates: true,
                        cursorRadius: Radius.circular(10),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                            border: InputBorder.none,
                            hintText: "મૃતકનું નામ"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "મૃતક સાથેનો સંબંધ",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                child: TextFormField(
                  controller: cName,
                  readOnly: true,
                  cursorOpacityAnimates: true,
                  cursorRadius: Radius.circular(10),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      border: InputBorder.none,
                      hintText: "મૃતક સાથેનો સંબંધ"),
                  onTap: () {
                    showAlertDialog(context);
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: mq.width / 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ઉંમર",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Card(
                          child: TextFormField(
                            controller: Age,
                            keyboardType: TextInputType.number,
                            cursorOpacityAnimates: true,
                            cursorRadius: Radius.circular(10),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(18, 12, 18, 12),
                              border: InputBorder.none,
                              hintText: "ઉંમર",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "દેવલોક પામ્યાની તારીખ",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Card(
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  readOnly: true,
                                  controller: Date,
                                  cursorOpacityAnimates: true,
                                  onTap: () async {
                                    var date = await showDatePicker(
                                        builder: (BuildContext context,
                                            Widget? child) {
                                          return Theme(
                                            data: ThemeData().copyWith(
                                                colorScheme:
                                                    const ColorScheme.light(
                                              primary: Color(0xff9DA0E8),
                                              onPrimary: Colors.white,
                                              onSurface: Colors.black,
                                            )),
                                            child: child!,
                                          );
                                        },
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2025, 5));
                                    if (date != null) {
                                      String formatedDate =
                                          DateFormat('dd-MM-yyyy, EEEE')
                                              .format(date);
                                      setState(() {
                                        Date.text = formatedDate;
                                      });
                                    }
                                    // Date.text =
                                    // "${date!.day}-${date.month}-${date.year}";
                                  },
                                  cursorRadius: Radius.circular(10),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(12, 12, 12, 12),
                                    border: InputBorder.none,
                                    hintText: "દેવલોક પામ્યાની તારીખ",
                                  ),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  "assets/calendar.png",
                                  scale: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: mq.width / 2.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ગામનું નામ",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Card(
                          child: TextFormField(
                            controller: village,
                            cursorOpacityAnimates: true,
                            cursorRadius: Radius.circular(10),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(18, 12, 18, 12),
                              border: InputBorder.none,
                              hintText: "ગામનું નામ",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "અંતિમ સંસ્કારની તારીખ",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Card(
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  readOnly: true,
                                  controller: lDate,
                                  cursorOpacityAnimates: true,
                                  onTap: () async {
                                    if (Date.text.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text('Date required'),
                                        ),
                                      );
                                    } else {
                                      var date = await showDatePicker(
                                          builder: (BuildContext context,
                                              Widget? child) {
                                            return Theme(
                                              data: ThemeData().copyWith(
                                                  colorScheme:
                                                      const ColorScheme.light(
                                                primary: Color(0xff9DA0E8),
                                                onPrimary: Colors.white,
                                                onSurface: Colors.black,
                                              )),
                                              child: child!,
                                            );
                                          },
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2025, 5));
                                      if (date != null) {
                                        String formatedDate =
                                            DateFormat('dd-MM-yyyy, EEEE')
                                                .format(date);
                                        setState(() {
                                          lDate.text = formatedDate;
                                        });
                                      }
                                      // lDate.text =
                                      //     "${date!.day}-${date.month}-${date.year}";
                                    }
                                  },
                                  cursorRadius: Radius.circular(10),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(12, 12, 12, 12),
                                    border: InputBorder.none,
                                    hintText: "અંતિમ સંસ્કારની તારીખ",
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  "assets/calendar.png",
                                  scale: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "પ્રારંભ સમય",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: TextFormField(
                          readOnly: true,
                          controller: Time,
                          cursorOpacityAnimates: true,
                          onTap: () async {
                            var time = await showTimePicker(
                                builder: (BuildContext context, Widget? child) {
                                  return Theme(
                                    data: ThemeData().copyWith(
                                        colorScheme: const ColorScheme.light(
                                      primary: Color(0xff9DA0E8),
                                      onPrimary: Colors.white,
                                      onSurface: Colors.black,
                                    )),
                                    child: child!,
                                  );
                                },
                                context: context,
                                initialTime: TimeOfDay.now());
                            if (time != null) {
                              final now = DateTime.now();
                              String formatedtime = DateFormat('hh:mm a')
                                  .format(DateTime(now.year, now.month, now.day,
                                      time.hour, time.minute));
                              setState(() {
                                Time.text = formatedtime;
                              });
                            }
                          },
                          cursorRadius: Radius.circular(10),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                            border: InputBorder.none,
                            hintText: "પ્રારંભ સમય",
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        // color: Colors.amber,
                        image: DecorationImage(
                          image: AssetImage("assets/clock.png"),
                          scale: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "સરનામું",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                child: TextFormField(
                  controller: Address,
                  cursorOpacityAnimates: true,
                  cursorRadius: Radius.circular(10),
                  maxLines: 4,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      border: InputBorder.none,
                      hintText: "સરનામું"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "વર્ણન",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                child: Column(
                  children: [
                    TextFormField(
                      controller: Desc,
                      cursorOpacityAnimates: true,
                      cursorRadius: Radius.circular(10),
                      maxLines: 5,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                        border: InputBorder.none,
                      ),
                    ),
                    Divider(),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextButton(
                          onPressed: () async {
                            var response = await Navigator.of(context)
                                .push(CupertinoPageRoute(
                              builder: (context) => Discription(
                                  initialSelectedIndex: selectedIndex),
                            ));
                            print("$response--res");
                            if (response != null) {
                              selectedIndex = response;
                              Desc.text = response != -1 ? desc[response] : "";
                            }

                            setState(() {});
                          },
                          child: Text(
                            "બદલો",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "લિ.",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: containerHeight(_container.length, mq),
                // color: Colors.amber,
                child: ListView.builder(
                  itemCount: _container.length,
                  itemBuilder: (context, index) {
                    return _container[index]
                        .buildContainer(context, mq, _removeContainer);
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (_container.length < 5) {
                        addNewContainer();
                      }
                    });
                  },
                  child: Visibility(
                    visible: _container.length < 5 ? true : false,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.add_circle_outline_rounded,
                        color: Colors.black,
                        size: 35,
                      ),
                      radius: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => Masterpage(),
                    ));
                    print(
                        "${CardName.text}-${fName.text}-${lName.text}-${cName.text}-${Age.text}-${Date.text}-${lDate.text}-${village.text}-${Time.text}-${Address.text}-----");
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        "SAVE",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  void _runFilter(String word) {
    List result = [];
    if (word.isEmpty) {
      result = relation;
    } else {
      result = relation
          .where(
              (element) => element.toLowerCase().contains(word.toLowerCase()))
          .toList();
    }

    setState(() {
      foundUser = result;
      print("$foundUser---");
    });
  }

  Future<dynamic> showAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Search",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(children: [
                CupertinoSearchTextField(
                  placeholder: "મૃતક સાથેનો સંબંધ",
                  placeholderStyle: TextStyle(color: Color(0xff9DA0E8)),
                  padding: const EdgeInsets.all(10.0),
                  backgroundColor: Colors.white,
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: Color(0xff9DA0E8),
                  ),
                  onChanged: (value) {
                    {
                      setState(() {});
                      _runFilter(value);
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                    child: foundUser.isNotEmpty
                        ? ListView.builder(
                            itemCount: foundUser.length,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      cName.text = foundUser[index];
                                      Navigator.of(context).pop();
                                    },
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          foundUser[index],
                                          style: TextStyle(
                                            color: Color(0xff9DA0E8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.black54.withBlue(80),
                                  )
                                ],
                              );
                            },
                          )
                        : const Center(
                            child: Text("No match found......"),
                          ))
              ]);
            },
          ),
        );
      },
    );
  }

  double containerHeight(int number, Size mq) {
    double ans = 0.0;
    switch (number) {
      case 1:
        ans = mq.width / 2.4;
        break;
      case 2:
        ans = mq.width / 1.2;
        break;
      case 3:
        ans = mq.width / 1;
        break;
      case 4:
        ans = mq.width / 0.7;
        break;
      case 5:
        ans = mq.width / 0.8;
        break;
    }
    return ans;
  }
}

class ContainerModel {
  final int id;
  final Function notifyParent;
  List<Widget> _rows = [];
  int _rowIndex = 0;

  ContainerModel(this.id, this.notifyParent) {
    addNewRow();
  }

  void addNewRow() {
    _rows.add(addRow(_rowIndex++));
    print("$_rowIndex----row");
    notifyParent();
  }

  void _removeRow(int id) {
    _rows.removeWhere((row) => (row.key as ValueKey).value == id);
    // _rowIndex--;
    // print("$_rowIndex+++++row-");
    notifyParent();
  }

  Widget addRow(int index) {
    // printv(index);
    return Row(
      key: ValueKey(index),
      children: [
        Expanded(
          child: Card(
            child: TextFormField(
              cursorOpacityAnimates: true,
              cursorRadius: Radius.circular(10),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                  border: InputBorder.none,
                  hintText: "લિ. નામ"),
            ),
          ),
        ),
        Expanded(
          child: Card(
            child: TextFormField(
              keyboardType: TextInputType.number,
              cursorOpacityAnimates: true,
              cursorRadius: Radius.circular(10),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                  border: InputBorder.none,
                  hintText: "મોબાઈલ નંબર"),
            ),
          ),
        ),
        index > 0
            ? IconButton(
                onPressed: () {
                  _removeRow(index);
                },
                icon: Icon(
                  Icons.close_rounded,
                ))
            : SizedBox()
      ],
    );
  }

  Widget buildContainer(
      BuildContext context, Size mq, Function(int) removeContainer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        key: ValueKey(id),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Card(
                      child: TextFormField(
                        controller: TextEditingController(),
                        cursorOpacityAnimates: true,
                        cursorRadius: Radius.circular(10),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                            border: InputBorder.none,
                            hintText: "શીર્ષક"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        addNewRow();
                      },
                      child: Container(
                        height: mq.height / 12.6,
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Text("નવું ઉમેરો"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  id > 0
                      ? IconButton(
                          onPressed: () {
                            removeContainer(id);
                          },
                          icon: Icon(
                            Icons.delete_rounded,
                          ))
                      : SizedBox()
                ],
              ),
              ..._rows,
            ],
          ),
        ),
      ),
    );
  }
}


// void addNewRow() {
  //   _row.add(addRow(index));
  //   print("$index++++++++++++++");
  //   index++;
  //   setState(() {});
  // }

  // void _removeRow(int id) {
  //   setState(() {
  //     // Remove the row with the specific identifier
  //     _row.removeWhere((row) => (row.key as ValueKey).value == id);
  //   });
  // }

// Widget addRow(int index) {
  //   return Row(
  //     key: ValueKey(index),
  //     children: [
  //       Expanded(
  //         child: Card(
  //           child: TextFormField(
  //             controller: Name,
  //             cursorOpacityAnimates: true,
  //             cursorRadius: Radius.circular(10),
  //             decoration: InputDecoration(
  //                 contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
  //                 border: InputBorder.none,
  //                 hintText: "લિ. નામ"),
  //           ),
  //         ),
  //       ),
  //       Expanded(
  //         child: Card(
  //           child: TextFormField(
  //             controller: Phoneno,
  //             keyboardType: TextInputType.number,
  //             cursorOpacityAnimates: true,
  //             cursorRadius: Radius.circular(10),
  //             decoration: InputDecoration(
  //                 contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
  //                 border: InputBorder.none,
  //                 hintText: "મોબાઈલ નંબર"),
  //           ),
  //         ),
  //       ),
  //       index > 0
  //           ? IconButton(
  //               onPressed: () {
  //                 print("$index++++++in+++++++");
  //                 _removeRow(index);
  //               },
  //               icon: Icon(
  //                 Icons.close_rounded,
  //               ))
  //           : SizedBox()
  //     ],
  //   );
  // }

// Widget addContainer(int index) {
  //   return Container(
  //     key: ValueKey(index),
  //     // height: mq.height / 5.5,
  //     decoration: BoxDecoration(
  //         border: Border.all(
  //           color: Colors.white,
  //         ),
  //         borderRadius: BorderRadius.circular(12)),
  //     child: Padding(
  //       padding: const EdgeInsets.all(5.0),
  //       child: Column(
  //         children: [
  //           Row(
  //             children: [
  //               Expanded(
  //                 child: Card(
  //                   child: TextFormField(
  //                     controller: Title,
  //                     cursorOpacityAnimates: true,
  //                     cursorRadius: Radius.circular(10),
  //                     decoration: InputDecoration(
  //                         contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
  //                         border: InputBorder.none,
  //                         hintText: "શીર્ષક"),
  //                   ),
  //                 ),
  //               ),
  //               Expanded(
  //                 child: InkWell(
  //                   onTap: addNewRow,
  //                   child: Container(
  //                     height: 50,
  //                     // height: mq.height / 12.5,
  //                     child: Card(
  //                       elevation: 0,
  //                       child: Padding(
  //                         padding: const EdgeInsets.all(10.0),
  //                         child: Center(
  //                           child: Text("નવું ઉમેરો"),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               index > 0
  //                   ? IconButton(
  //                       onPressed: () {
  //                         print("$index++++++in+++++++");
  //                         setState(() {
  //                           _removeContainer(index);
  //                         });
  //                       },
  //                       icon: Icon(
  //                         Icons.delete_rounded,
  //                       ))
  //                   : SizedBox()
  //             ],
  //           ),
  //           ..._row
  //         ],
  //       ),
  //     ),
  //   );
  // }
 