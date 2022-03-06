import 'package:flutter/material.dart';
import 'package:machine/calculation/calculationPage.dart';
import 'package:machine/calculation/imagePick.dart';
import 'package:machine/calculation/other.dart';
import 'package:machine/calculation/other1.dart';
import 'package:machine/calculation/other2.dart';
import 'package:machine/calculation/other3.dart';
import 'package:machine/calculation/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  double? siramic;
  double? lcd;
  double? kasti;
  double? other;
  double? tAmount;

  @override
  Widget build(BuildContext context) {
    double siramic = o1 + o11 + o21 + o31;
    double lcd = o2 + o12 + o22 + o32;
    double kasti = o3 + o13 + o23 + o33;
    double other = o4 + o14 + o24 + o34;
    double tAmount =total1 + total2 + total3 + total4 + total5 ;
        
    return Scaffold(
      appBar: AppBar(
        title: Text('Costing Calculation'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.done))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Your Design Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ImagePick(),
            SizedBox(
              height: 8,
            ),
            Product(total: total1),
            SizedBox(height: 2),
            Other(
              total: total2,
              rate1: o1,
              rate2: o2,
              rate3: o3,
              rate4: o4,
            ),
            SizedBox(height: 2),
            Other1(
              total: total3,
              rate1: o11,
              rate2: o12,
              rate3: o13,
              rate4: o14,
            ),
            SizedBox(height: 2),
            Other2(
              total: total4,
              rate1: o21,
              rate2: o22,
              rate3: o23,
              rate4: o24,
            ),
            SizedBox(height: 2),
            Other3(
              total: total5,
              rate1: o31,
              rate2: o32,
              rate3: o33,
              rate4: o34,
            ),
            SizedBox(height: 8),
            Divider(
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
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
