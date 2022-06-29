import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:machine/Src/Constant/Strings.dart';
import 'package:machine/Src/Widget/common_text_style.dart';

class ListDetail extends StatefulWidget {
  const ListDetail({
    Key? key,
    required this.design,
    this.time,
    this.productTotal,
    this.kasti,
    this.lcd,
    this.other1,
    this.other2,
    this.other3,
    this.other4,
    this.otherTotal,
    this.siramic,
    this.totalAmount,
  }) : super(key: key);

  final String design;
  final String? time;
  final double? productTotal;
  final double? other1;
  final double? other2;
  final double? other3;
  final double? other4;
  final double? otherTotal;
  final double? siramic;
  final double? kasti;
  final double? lcd;
  final double? totalAmount;

  @override
  State<ListDetail> createState() => _ListDetailState();
}

class _ListDetailState extends State<ListDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            Strings.viewDetails,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 8,
            right: 8,
            top: 12,
          ),
          child: Column(
            children: [
              _fieldAndValue(
                  name: 'Design Name :-', value: widget.design.toUpperCase()),
              _spacer(height: 0.01, width: 0),
              _fieldAndValue(
                  name: 'Created By :-',
                  value: DateFormat('MMMM dd, yyyy')
                      .format(DateTime.parse(widget.time ?? ''))),
              _spacer(height: 0.01, width: 0),
              _fieldAndValue(
                  name: 'Product Total :-',
                  value: widget.productTotal.toString()),
              _spacer(height: 0.01, width: 0),
              _fieldAndValue(
                  name: 'Other! Total :-', value: widget.other1.toString()),
              _spacer(height: 0.01, width: 0),
              _fieldAndValue(
                  name: 'Other2 Total :-', value: widget.other2.toString()),
              _spacer(height: 0.01, width: 0),
              _fieldAndValue(
                  name: 'Other3 Total :-', value: widget.other3.toString()),
              _spacer(height: 0.01, width: 0),
              _fieldAndValue(
                  name: 'Other4 Total :-', value: widget.other4.toString()),
              _spacer(height: 0.01, width: 0),
              _fieldAndValue(
                  name: 'Other Total :-', value: widget.otherTotal.toString()),
              _spacer(height: 0.01, width: 0),
              _fieldAndValue(
                  name: 'Siramic Total :-', value: widget.siramic.toString()),
              _spacer(height: 0.01, width: 0),
              _fieldAndValue(
                  name: 'Kasti Total :-', value: widget.kasti.toString()),
              _spacer(height: 0.01, width: 0),
              _fieldAndValue(
                  name: 'Total Amount Total :-',
                  value: widget.totalAmount.toString()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fieldAndValue({
    required String name,
    required String value,
  }) {
    return Row(
      children: [
        Text(
          name,
          style: textStyle(context: context),
        ),
        _spacer(width: 0.02, height: 0),
        Text(
          _answerCheck(value),
          style: textStyle(context: context),
        ),
      ],
    );
  }

  String _answerCheck(String value) {
    if (value.contains('null')) {
      return value = '0';
    }
    return value.isEmpty ? '' : value;
  }

  Widget _imageBox() {
    return Row(
      children: [],
    );
  }

  Widget _spacer({required double height, required double width}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * height,
      width: MediaQuery.of(context).size.height * width,
    );
  }
}
