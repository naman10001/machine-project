import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:machine/Src/Constant/Strings.dart';
import 'package:machine/Src/Constant/color_const.dart';
import 'package:machine/Src/View/calculation/calculation_item/calculationPage.dart';
import 'package:machine/Src/View/calculation/calculation_item/imagePick.dart';
import 'package:machine/Src/View/calculation/calculation_item/other.dart';
import 'package:machine/Src/View/calculation/calculation_item/other1.dart';
import 'package:machine/Src/View/calculation/calculation_item/other2.dart';
import 'package:machine/Src/View/calculation/calculation_item/other3.dart';
import 'package:machine/Src/View/calculation/calculation_item/product.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({Key? key}) : super(key: key);

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
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
    // print(totalvalue);
    // print(siramicvalue);
    // print(lcdvalue);
    // print(kastivalue);
    // print(othervalue);
    setState(() {
      tAmount += totalvalue;
      siramic += siramicvalue;
      lcd += lcdvalue;
      kasti += kastivalue;
      other += othervalue;
    });
  }

  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.costingcal),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  if (_designName.text.isEmpty) {
                    _errorDailog();
                  } else {
                    FirebaseFirestore.instance.collection('Machine').add(
                      {
                        'id': '',
                        'Design_Name': _designName.text,
                        'Time': DateTime.now().toIso8601String(),
                        'Product_total': total1,
                        'Other1': total2,
                        'Other2': total3,
                        'Other3': total4,
                        'Other4': total5,
                        'Total_siramic': siramic,
                        'Total_lcd': lcd,
                        'Total_kasti': kasti,
                        'Total_other': other,
                        'Total_amount': tAmount,
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
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  onChanged: (value) {
                    value.isNotEmpty ? isValid = false : isValid = true;
                  },
                  controller: _designName,
                  cursorColor: ColorConst.grey,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: ColorConst.grey,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: ColorConst.grey,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    labelText: Strings.designname,
                    labelStyle: const TextStyle(color: ColorConst.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ImagePick(
                image1: '',
                image2: '',
                image3: '',
              ),
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
      ),
    );
  }

  Future<void> _errorDailog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error for User'),
          content: const Text('Please fill required field'),
          actions: [
            MaterialButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              color: ColorConst.amber,
              child: const Text(Strings.ok),
            ),
          ],
        );
      },
    );
  }
}
