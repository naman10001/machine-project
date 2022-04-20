import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:machine/Src/Constant/Strings.dart';
import 'package:machine/Src/View/Home/calculation/calculationPage.dart';
import 'package:machine/Src/View/Home/calculation/imagePick.dart';
import 'package:machine/Src/View/Home/calculation/other.dart';
import 'package:machine/Src/View/Home/calculation/other1.dart';
import 'package:machine/Src/View/Home/calculation/other2.dart';
import 'package:machine/Src/View/Home/calculation/other3.dart';
import 'package:machine/Src/View/Home/calculation/product.dart';
import 'package:machine/Src/View/List/ListScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _designName = TextEditingController();
  double total1 = 0.0;
  double total2 = 0.0;
  double total3 = 0.0;
  double total4 = 0.0;
  double total5 = 0.0;

  double o1 = 0.0;
  double o2 = 0.0;
  double o3 = 0.0;
  double o4 = 0.0;

  double o11 = 0.0;
  double o12 = 0.0;
  double o13 = 0.0;
  double o14 = 0.0;

  double o21 = 0.0;
  double o22 = 0.0;
  double o23 = 0.0;
  double o24 = 0.0;

  double o31 = 0.0;
  double o32 = 0.0;
  double o33 = 0.0;
  double o34 = 0.0;

  double siramic = 0.0;
  double lcd = 0.0;
  double kasti = 0.0;
  double other = 0.0;
  double tAmount = 0.0;

  getTotal(
    double totalvalue,
    double siramicvalue,
    double lcdvalue,
    double kastivalue,
    double othervalue,
  ) {
    print(totalvalue);
    print(siramicvalue);
    print(lcdvalue);
    print(kastivalue);
    print(othervalue);
    setState(() {
      tAmount += totalvalue;
      siramic += siramicvalue;
      lcd += lcdvalue;
      kasti += kastivalue;
      other += othervalue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.costingcal),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                if (_designName.text.isEmpty) {
                  return null;
                } else {
                  FirebaseFirestore.instance.collection('Machine').add(
                    {
                      'id': '',
                      'Design_Name': _designName.text,
                      'Time': DateTime.now().toIso8601String(),
                    },
                  ).then(
                    (value) => FirebaseFirestore.instance
                        .collection('Machine')
                        .doc(value.id)
                        .update(
                      {
                        'id': value.id,
                      },
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              icon: const Icon(Icons.done))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: _designName,
                decoration: const InputDecoration(
                  labelText: Strings.designname,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const ImagePick(),
            const SizedBox(
              height: 8,
            ),
            Product(
              total: total1,
              getTotal: getTotal,
            ),
            const SizedBox(height: 2),
            Other(
              total: total2,
              rate1: o1,
              rate2: o2,
              rate3: o3,
              rate4: o4,
              getTotal: getTotal,
            ),
            const SizedBox(height: 2),
            Other1(
              total: total3,
              rate1: o11,
              rate2: o12,
              rate3: o13,
              rate4: o14,
              getTotal: getTotal,
            ),
            const SizedBox(height: 2),
            Other2(
              total: total4,
              rate1: o21,
              rate2: o22,
              rate3: o23,
              rate4: o24,
              getTotal: getTotal,
            ),
            const SizedBox(height: 2),
            Other3(
              total: total5,
              rate1: o31,
              rate2: o32,
              rate3: o33,
              rate4: o34,
              getTotal: getTotal,
            ),
            const SizedBox(height: 8),
            const Divider(
              thickness: 2,
              color: Colors.black,
            ),
            CalculationPage(
              siramic: siramic,
              lcd: lcd,
              kasti: kasti,
              other: other,
              tAmount: tAmount,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
