import 'package:flutter/material.dart';
import 'package:machine/Src/Constant/Strings.dart';
import 'package:machine/Src/Widget/custom_box.dart';

class Other extends StatefulWidget {
  double total = 0.0;
  double rate1;
  double rate2;
  double rate3;
  double rate4;
  Function getTotal;
  TextEditingController controller;
  Other({
    Key? key,
    required this.total,
    required this.rate1,
    required this.rate2,
    required this.rate3,
    required this.rate4,
    required this.getTotal,
    required this.controller,
  }) : super(key: key);

  @override
  _OtherState createState() => _OtherState();
}

class _OtherState extends State<Other> {
  TextEditingController name1 = TextEditingController();
  TextEditingController name2 = TextEditingController();
  TextEditingController name3 = TextEditingController();
  TextEditingController name4 = TextEditingController();

  TextEditingController dn1 = TextEditingController();
  TextEditingController dn2 = TextEditingController();
  TextEditingController dn3 = TextEditingController();
  TextEditingController dn4 = TextEditingController();

  TextEditingController rt1 = TextEditingController();
  TextEditingController rt2 = TextEditingController();
  TextEditingController rt3 = TextEditingController();
  TextEditingController rt4 = TextEditingController();

  var d1;
  var d2;
  var d3;
  var d4;

  var r1;
  var r2;
  var r3;
  var r4;

  @override
  Widget build(BuildContext context) {
    Widget boxList2(
      String name,
      TextEditingController controller,
      var _val,
    ) {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.all(4),
          height: 25,
          width: 75,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(6))),
          child: TextField(
            decoration: InputDecoration(
              isCollapsed: true,
              hintText: name,
            ),
            controller: controller,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            onSubmitted: (val) {
              setState(() {
                _val = val;
                widget.rate1 = (double.tryParse(dn1.text) ?? 0.0) *
                    (double.tryParse(rt1.text) ?? 0.0);
                widget.rate2 = (double.tryParse(dn2.text) ?? 0.0) *
                    (double.tryParse(rt2.text) ?? 0.0);
                widget.rate3 = (double.tryParse(dn3.text) ?? 0.0) *
                    (double.tryParse(rt3.text) ?? 0.0);
                widget.rate4 = (double.tryParse(dn4.text) ?? 0.0) *
                    (double.tryParse(rt4.text) ?? 0.0);
                widget.total =
                    widget.rate1 + widget.rate2 + widget.rate3 + widget.rate4;
                widget.getTotal(widget.total, widget.rate1, widget.rate2,
                    widget.rate3, widget.rate4);
              });
            },
          ),
        ),
      );
    }

    widget.rate1 =
        (double.tryParse(dn1.text) ?? 0.0) * (double.tryParse(rt1.text) ?? 0.0);
    widget.rate2 =
        (double.tryParse(dn2.text) ?? 0.0) * (double.tryParse(rt2.text) ?? 0.0);
    widget.rate3 =
        (double.tryParse(dn3.text) ?? 0.0) * (double.tryParse(rt3.text) ?? 0.0);
    widget.rate4 =
        (double.tryParse(dn4.text) ?? 0.0) * (double.tryParse(rt4.text) ?? 0.0);
    widget.total = widget.rate1 + widget.rate2 + widget.rate3 + widget.rate4;

    return Column(
      children: [
        textFeild(controller: widget.controller),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              boxList1(Strings.siramic),
              const SizedBox(width: 20),
              boxList2(Strings.diamond, dn1, d1),
              const SizedBox(width: 20),
              boxList2(Strings.rate, rt1, r1),
              const SizedBox(width: 20),
              boxList1(widget.rate1.toString()),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              boxList1(Strings.lcd),
              const SizedBox(width: 20),
              boxList2(Strings.diamond, dn2, d2),
              const SizedBox(width: 20),
              boxList2(Strings.rate, rt2, r2),
              const SizedBox(width: 20),
              boxList1(widget.rate2.toString()),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              boxList1(Strings.kasti),
              const SizedBox(width: 20),
              boxList2(Strings.diamond, dn3, d3),
              const SizedBox(width: 20),
              boxList2(Strings.rate, rt3, r3),
              const SizedBox(width: 20),
              boxList1(widget.rate3.toString()),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              boxList1(Strings.other),
              const SizedBox(width: 20),
              boxList2(Strings.diamond, dn4, d4),
              const SizedBox(width: 20),
              boxList2(Strings.rate, rt4, r4),
              const SizedBox(width: 20),
              boxList1(widget.rate4.toString()),
            ],
          ),
        ),
        totalValue(value: widget.total.toString()),
      ],
    );
  }
}
