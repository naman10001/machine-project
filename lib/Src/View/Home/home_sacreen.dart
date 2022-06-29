import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:machine/Src/Constant/Strings.dart';
import 'package:machine/Src/Constant/color_const.dart';
import 'package:machine/Src/View/calculation/calculation.dart';
import 'package:machine/Src/View/home/list_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchQuery = TextEditingController();
  String _searchKey = '';
  Stream<QuerySnapshot<Map<String, dynamic>>>? serachClear;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(Strings.yourList),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const CalculationScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Column(
            children: [
              _topSearch(),
              Expanded(
                child: StreamBuilder(
                  stream: _searchKey.isNotEmpty
                      ? FirebaseFirestore.instance
                          .collection('Machine')
                          .where('Design_Name',
                              isGreaterThanOrEqualTo: _searchKey)
                          .where('Design_Name', isLessThan: _searchKey + 'z')
                          .snapshots()
                      : FirebaseFirestore.instance
                          .collection('Machine')
                          .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        serachClear = FirebaseFirestore.instance
                            .collection('Machine')
                            .snapshots();
                        return _card(
                            index: (index + 1).toString(),
                            text:
                                snapshot.data?.docs[index]['Design_Name'] ?? '',
                            time: snapshot.data?.docs[index]['Time'] ?? '',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => ListDetail(
                                    //id: snapshot.data?.docs[index]['id'] ?? '',
                                    design: snapshot.data?.docs[index]
                                            ['Design_Name'] ??
                                        '',
                                    time: snapshot.data?.docs[index]['Time'] ??
                                        '',
                                    productTotal: snapshot.data?.docs[index]
                                            ['Product_total'] ??
                                        '',
                                    other1: snapshot.data?.docs[index]
                                            ['Other1'] ??
                                        '',
                                    other2: snapshot.data?.docs[index]
                                            ['Other2'] ??
                                        '',
                                    other3: snapshot.data?.docs[index]
                                            ['Other3'] ??
                                        '',
                                    other4: snapshot.data?.docs[index]
                                            ['Other4'] ??
                                        '',
                                    otherTotal: snapshot.data?.docs[index]
                                            ['Total_other'] ??
                                        '',
                                    siramic: snapshot.data?.docs[index]
                                            ['Total_siramic'] ??
                                        '',
                                    kasti: snapshot.data?.docs[index]
                                            ['Total_kasti'] ??
                                        '',
                                    lcd: snapshot.data?.docs[index]
                                            ['Total_lcd'] ??
                                        '',
                                    totalAmount: snapshot.data?.docs[index]
                                            ['Total_amount'] ??
                                        '',
                                  ),
                                ),
                              );
                            });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topSearch() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: TextField(
        textInputAction: TextInputAction.done,
        controller: _searchQuery,
        cursorColor: ColorConst.grey,
        onChanged: (value) {
          setState(() {
            _searchKey = value;
            // serachClear;
          });
        },
        decoration: InputDecoration(
          hintText: 'SEARCH ITEM',
          helperStyle: const TextStyle(color: ColorConst.grey),
          prefixIcon: const Icon(
            Icons.search,
            color: ColorConst.grey,
          ),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.clear,
              color: ColorConst.grey,
            ),
            onPressed: () {
              _searchQuery.clear();
              //FirebaseFirestore.instance.collection('Machine').snapshots();
              // serachClear;
              // _searchKey.isEmpty;
            },
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
        ),
      ),
    );
  }

  Widget _card({
    required String text,
    required String index,
    required String time,
    void Function()? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: ColorConst.grey),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          child: Text(
            index,
            style: const TextStyle(color: ColorConst.black),
          ),
          backgroundColor: ColorConst.amber,
        ),
        title: Text(
          text.toUpperCase(),
          style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02),
        ),
        subtitle: Text(
          DateFormat('MMMM dd, yyyy').format(DateTime.parse(time)),
          style:
              TextStyle(fontSize: MediaQuery.of(context).size.height * 0.015),
        ),
      ),
    );
  }
}
