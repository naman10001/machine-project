import 'package:flutter/material.dart';

class CalculationPage extends StatefulWidget {
  double siramic;
  double lcd;
  double kasti;
  double other;
  double tAmount;

  CalculationPage({
    required this.siramic,
    required this.lcd,
    required this.kasti,
    required this.other,
    required this.tAmount,
  });

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
                  border: Border.all(color: Colors.grey, width: 1),
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
                  border: Border.all(color: Colors.grey, width: 1),
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
          child:
              boxList1('Total Siramic Amount :- ', widget.siramic.toString()),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(10),
          child: boxList1('Total LCD Amount :- ', widget.lcd.toString()),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(10),
          child: boxList1('Total kasti Amount :- ', widget.kasti.toString()),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(10),
          child: boxList1('Total Other Amount :- ', widget.other.toString()),
        ),
        const SizedBox(height: 8),
        Container(
          height: 30,
          width: 250,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Text(
            'Your Total Amount :- ' + widget.tAmount.toString(),
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }
}
