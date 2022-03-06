import 'package:flutter/material.dart';

class Other2 extends StatefulWidget {
  double total = 0.0;
  double rate1;
  double rate2;
  double rate3;
  double rate4;
  Function getTotal;
  Other2({
    required this.total,
    required this.rate1,
    required this.rate2,
    required this.rate3,
    required this.rate4,
    required this.getTotal,
  });

  @override
  _OtherState createState() => _OtherState();
}

class _OtherState extends State<Other2> {
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
    Widget boxList1(
      String name,
    ) {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.all(4),
          height: 25,
          width: 75,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(6))),
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15),
          ),
        ),
      );
    }

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
              border: Border.all(color: Colors.grey, width: 1),
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
        Container(
          padding: const EdgeInsets.all(10),
          height: 50,
          width: 150,
          child: const TextField(
            decoration: InputDecoration(
              labelText: 'Item Name',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              boxList1('Siramic'),
              const SizedBox(width: 20),
              boxList2('Diamond', dn1, d1),
              const SizedBox(width: 20),
              boxList2('Rate', rt1, r1),
              const SizedBox(width: 20),
              boxList1(widget.rate1.toString()),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              boxList1('LCD'),
              const SizedBox(width: 20),
              boxList2('Diamond', dn2, d2),
              const SizedBox(width: 20),
              boxList2('Rate', rt2, r2),
              const SizedBox(width: 20),
              boxList1(widget.rate2.toString()),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              boxList1('kasti'),
              const SizedBox(width: 20),
              boxList2('Diamond', dn3, d3),
              const SizedBox(width: 20),
              boxList2('Rate', rt3, r3),
              const SizedBox(width: 20),
              boxList1(widget.rate3.toString()),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              boxList1('other'),
              const SizedBox(width: 20),
              boxList2('Diamond', dn4, d4),
              const SizedBox(width: 20),
              boxList2('Rate', rt4, r4),
              const SizedBox(width: 20),
              boxList1(widget.rate4.toString()),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const Expanded(
                  child: Text(
                'Total Amount :- ',
                style: TextStyle(fontSize: 16),
              )),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(4),
                  height: 25,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(6))),
                  child: Text(
                    widget.total.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
