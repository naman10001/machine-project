import 'package:flutter/material.dart';
import 'package:machine/Src/Constant/Strings.dart';

Widget boxList1(
  String name,
) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(4),
      height: 25,
      width: 75,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(6))),
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
    ),
  );
}

Widget totalValue({
  required String value,
}) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: Row(
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
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget textFeild() {
  return Container(
    padding: const EdgeInsets.all(10),
    height: 50,
    width: 150,
    child: const TextField(
      decoration: InputDecoration(
          labelText: Strings.itemName,
          border: OutlineInputBorder(),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
    ),
  );
}
