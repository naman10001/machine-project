import 'package:flutter/material.dart';
import 'package:machine/Src/Constant/Strings.dart';
import 'package:machine/Src/Widget/custom_box.dart';

class Product extends StatefulWidget {
  double total;
  Function getTotal;

  Product({Key? key, required this.total, required this.getTotal})
      : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  TextEditingController name1 = TextEditingController();
  TextEditingController name2 = TextEditingController();
  TextEditingController name3 = TextEditingController();
  TextEditingController name4 = TextEditingController();
  TextEditingController name5 = TextEditingController();
  TextEditingController name6 = TextEditingController();
  TextEditingController name7 = TextEditingController();

  TextEditingController stitch1 = TextEditingController();
  TextEditingController stitch2 = TextEditingController();
  TextEditingController stitch3 = TextEditingController();
  TextEditingController stitch4 = TextEditingController();
  TextEditingController stitch5 = TextEditingController();
  TextEditingController stitch6 = TextEditingController();
  TextEditingController stitch7 = TextEditingController();

  TextEditingController head1 = TextEditingController();
  TextEditingController head2 = TextEditingController();
  TextEditingController head3 = TextEditingController();
  TextEditingController head4 = TextEditingController();
  TextEditingController head5 = TextEditingController();
  TextEditingController head6 = TextEditingController();
  TextEditingController head7 = TextEditingController();

  TextEditingController sRate1 = TextEditingController();
  TextEditingController sRate2 = TextEditingController();
  TextEditingController sRate3 = TextEditingController();
  TextEditingController sRate4 = TextEditingController();
  TextEditingController sRate5 = TextEditingController();
  TextEditingController sRate6 = TextEditingController();
  TextEditingController sRate7 = TextEditingController();

  var n1;
  var n2;
  var n3;
  var n4;
  var n5;
  var n6;
  var n7;

  var s1;
  var s2;
  var s3;
  var s4;
  var s5;
  var s6;
  var s7;

  var h1;
  var h2;
  var h3;
  var h4;
  var h5;
  var h6;
  var h7;

  var sr1;
  var sr2;
  var sr3;
  var sr4;
  var sr5;
  var sr6;
  var sr7;

  @override
  Widget build(BuildContext context) {
    Widget boxList2(
      String name,
      TextEditingController controller,
      TextInputType type,
      var _val,
    ) {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.all(4),
          height: 25,
          width: 67,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(6))),
          child: TextField(
            decoration: InputDecoration(
              isCollapsed: true,
              hintText: name,
            ),
            controller: controller,
            keyboardType: type,
            textInputAction: TextInputAction.next,
            onSubmitted: (val) {
              setState(() {
                _val = val;
                var tr1 = (((double.tryParse(stitch1.text) ?? 00.00) *
                        (double.tryParse(head1.text) ?? 00.00) *
                        (double.tryParse(sRate1.text) ?? 00.00)) /
                    1000);
                var tr2 = (((double.tryParse(stitch2.text) ?? 00.00) *
                        (double.tryParse(head2.text) ?? 00.00) *
                        (double.tryParse(sRate2.text) ?? 00.00)) /
                    1000);
                var tr3 = (((double.tryParse(stitch3.text) ?? 00.00) *
                        (double.tryParse(head3.text) ?? 00.00) *
                        (double.tryParse(sRate3.text) ?? 00.00)) /
                    1000);
                var tr4 = (((double.tryParse(stitch4.text) ?? 00.00) *
                        (double.tryParse(head4.text) ?? 00.00) *
                        (double.tryParse(sRate4.text) ?? 00.00)) /
                    1000);
                var tr5 = (((double.tryParse(stitch5.text) ?? 00.00) *
                        (double.tryParse(head5.text) ?? 00.00) *
                        (double.tryParse(sRate5.text) ?? 00.00)) /
                    1000);
                var tr6 = (((double.tryParse(stitch6.text) ?? 00.00) *
                        (double.tryParse(head6.text) ?? 00.00) *
                        (double.tryParse(sRate6.text) ?? 00.00)) /
                    1000);
                var tr7 = (((double.tryParse(stitch7.text) ?? 00.00) *
                        (double.tryParse(head7.text) ?? 00.00) *
                        (double.tryParse(sRate7.text) ?? 00.00)) /
                    1000);
                widget.total = tr1 + tr2 + tr3 + tr4 + tr5 + tr6 + tr7;
                widget.getTotal(widget.total, 0.0, 0.0, 0.0, 0.0);
              });
            },
          ),
        ),
      );
    }

    var tr1 = (((double.tryParse(stitch1.text) ?? 00.00) *
            (double.tryParse(head1.text) ?? 00.00) *
            (double.tryParse(sRate1.text) ?? 00.00)) /
        1000);
    var tr2 = (((double.tryParse(stitch2.text) ?? 00.00) *
            (double.tryParse(head2.text) ?? 00.00) *
            (double.tryParse(sRate2.text) ?? 00.00)) /
        1000);
    var tr3 = (((double.tryParse(stitch3.text) ?? 00.00) *
            (double.tryParse(head3.text) ?? 00.00) *
            (double.tryParse(sRate3.text) ?? 00.00)) /
        1000);
    var tr4 = (((double.tryParse(stitch4.text) ?? 00.00) *
            (double.tryParse(head4.text) ?? 00.00) *
            (double.tryParse(sRate4.text) ?? 00.00)) /
        1000);
    var tr5 = (((double.tryParse(stitch5.text) ?? 00.00) *
            (double.tryParse(head5.text) ?? 00.00) *
            (double.tryParse(sRate5.text) ?? 00.00)) /
        1000);
    var tr6 = (((double.tryParse(stitch6.text) ?? 00.00) *
            (double.tryParse(head6.text) ?? 00.00) *
            (double.tryParse(sRate6.text) ?? 00.00)) /
        1000);
    var tr7 = (((double.tryParse(stitch7.text) ?? 00.00) *
            (double.tryParse(head7.text) ?? 00.00) *
            (double.tryParse(sRate7.text) ?? 00.00)) /
        1000);
    widget.total = tr1 + tr2 + tr3 + tr4 + tr5 + tr6 + tr7;

    return Container(
      padding: const EdgeInsets.all(16),
      //margin: EdgeInsets.all(10),
      child: Column(
        children: [
          const Center(
            child: Text(
              Strings.product,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            padding: const EdgeInsets.all(2),
            child: Row(
              children: const [
                Expanded(child: Text(Strings.name)),
                SizedBox(width: 34),
                Expanded(child: Text(Strings.stitch)),
                SizedBox(width: 32),
                Expanded(child: Text(Strings.head)),
                SizedBox(width: 32),
                Expanded(child: Text(Strings.stitchRate)),
                SizedBox(width: 30),
                Expanded(child: Text(Strings.rate)),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
            color: Colors.black,
          ),
          Container(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                boxList2(Strings.name, name1, TextInputType.name, n1),
                const SizedBox(width: 2),
                boxList2(Strings.stitch, stitch1, TextInputType.number,
                    s1.toString()),
                const SizedBox(width: 2),
                boxList2(
                    Strings.head, head1, TextInputType.number, h1.toString()),
                const SizedBox(width: 2),
                boxList2(Strings.sRate, sRate1, TextInputType.number,
                    sr1.toString()),
                const SizedBox(width: 2),
                boxList1(tr1.toString()),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                boxList2(Strings.name, name2, TextInputType.name, n2),
                const SizedBox(width: 2),
                boxList2(Strings.stitch, stitch2, TextInputType.number,
                    s2.toString()),
                const SizedBox(width: 2),
                boxList2(
                    Strings.head, head2, TextInputType.number, h2.toString()),
                const SizedBox(width: 2),
                boxList2(Strings.sRate, sRate2, TextInputType.number,
                    sr2.toString()),
                const SizedBox(width: 2),
                boxList1(
                  tr2.toString(),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                boxList2(Strings.name, name3, TextInputType.name, n3),
                const SizedBox(width: 2),
                boxList2(Strings.stitch, stitch3, TextInputType.number,
                    s3.toString()),
                const SizedBox(width: 2),
                boxList2(
                    Strings.head, head3, TextInputType.number, h3.toString()),
                const SizedBox(width: 2),
                boxList2(Strings.sRate, sRate3, TextInputType.number,
                    sr3.toString()),
                const SizedBox(width: 2),
                boxList1(
                  tr3.toString(),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                boxList2(Strings.name, name4, TextInputType.name, n4),
                const SizedBox(width: 2),
                boxList2(Strings.stitch, stitch4, TextInputType.number,
                    s4.toString()),
                const SizedBox(width: 2),
                boxList2(
                    Strings.head, head4, TextInputType.number, h4.toString()),
                const SizedBox(width: 2),
                boxList2(Strings.sRate, sRate4, TextInputType.number,
                    sr4.toString()),
                const SizedBox(width: 2),
                boxList1(
                  tr4.toString(),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                boxList2(Strings.name, name5, TextInputType.name, n5),
                const SizedBox(width: 2),
                boxList2(Strings.stitch, stitch5, TextInputType.number,
                    s5.toString()),
                const SizedBox(width: 2),
                boxList2(
                    Strings.head, head5, TextInputType.number, h5.toString()),
                const SizedBox(width: 2),
                boxList2(Strings.sRate, sRate5, TextInputType.number,
                    sr5.toString()),
                const SizedBox(width: 2),
                boxList1(
                  tr5.toString(),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                boxList2(Strings.name, name6, TextInputType.name, n6),
                const SizedBox(width: 2),
                boxList2(Strings.stitch, stitch6, TextInputType.number,
                    s6.toString()),
                const SizedBox(width: 2),
                boxList2(
                    Strings.head, head6, TextInputType.number, h6.toString()),
                const SizedBox(width: 2),
                boxList2(Strings.sRate, sRate6, TextInputType.number,
                    sr6.toString()),
                const SizedBox(width: 2),
                boxList1(
                  tr6.toString(),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                boxList2(Strings.name, name7, TextInputType.name, n7),
                const SizedBox(width: 2),
                boxList2(Strings.stitch, stitch7, TextInputType.number,
                    s7.toString()),
                const SizedBox(width: 2),
                boxList2(
                    Strings.head, head7, TextInputType.number, h7.toString()),
                const SizedBox(width: 2),
                boxList2(Strings.sRate, sRate7, TextInputType.number,
                    sr7.toString()),
                const SizedBox(width: 2),
                boxList1(
                  tr7.toString(),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Row(
            children: [
              const Expanded(
                  child: Text(
                Strings.totakAmount,
                style: TextStyle(fontSize: 16),
              )),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(4),
                  height: 25,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
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
        ],
      ),
    );
  }
}
