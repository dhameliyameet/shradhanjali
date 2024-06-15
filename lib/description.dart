import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Discription extends StatefulWidget {
  int initialSelectedIndex;
  Discription({super.key, this.initialSelectedIndex = -1});

  @override
  State<Discription> createState() => _DiscriptionState();
}

List desc = [
  "પિતા",
  "માતા frtyuiytrtghjtrtyudfghjhgfeertyuidfghjkrertyuirewertykltrertyuytrertyhgdeghgfdhytre4rtyuiuytrtyuk",
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

class _DiscriptionState extends State<Discription> {
  late int selectedIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = widget.initialSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("વર્ણન પસંદ કરો"),
        centerTitle: true,
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: true,
      ),
      body: ListView.separated(
          physics: RangeMaintainingScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                    "${desc[index]}",
                    style: TextStyle(fontSize: 15),
                  )),
                  Radio(
                    value: index,
                    groupValue: selectedIndex,
                    activeColor: Color(0xff9DA0E8),
                    onChanged: (value) {
                      setState(() {
                        selectedIndex = value!;
                        print("${desc[selectedIndex]}---");
                        Navigator.pop(context, selectedIndex);
                        // selectedIndex = index;
                      });
                    },
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(color: Color.fromARGB(255, 49, 53, 181));
          },
          itemCount: desc.length),
    );
  }
}
