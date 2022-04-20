import 'package:flutter/material.dart';
import 'package:machine/Src/Constant/Strings.dart';

class CalculationPage extends StatefulWidget {
  double siramic;
  double lcd;
  double kasti;
  double other;
  double tAmount;

  CalculationPage({
    Key? key,
    required this.siramic,
    required this.lcd,
    required this.kasti,
    required this.other,
    required this.tAmount,
  }) : super(key: key);

  @override
  _CalculationPageState createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
  @override
  Widget build(BuildContext context) {
    Widget boxList1(
      String name,
      String name1,
    ) {
      return Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(4),
              height: 25,
              width: 175,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(6))),
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(4),
              height: 25,
              width: 175,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(6))),
              child: Text(
                name1,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: boxList1(Strings.total + '  ' + Strings.siramic,
              widget.siramic.toString()),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Container(
          padding: const EdgeInsets.all(10),
          child: boxList1(
              Strings.total + '  ' + Strings.lcd, widget.lcd.toString()),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Container(
          padding: const EdgeInsets.all(10),
          child: boxList1(
              Strings.total + '  ' + Strings.kasti, widget.kasti.toString()),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Container(
          padding: const EdgeInsets.all(10),
          child: boxList1(
              Strings.total + '  ' + Strings.other, widget.other.toString()),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Container(
            height: 30,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 7),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Text(
              'YOUR TOTAL AMOUNT :- ' + ' ' + widget.tAmount.toString(),
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
