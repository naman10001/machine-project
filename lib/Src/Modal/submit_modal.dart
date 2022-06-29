class SubmitModal {
  SubmitModal(
      {this.designName,
      this.image,
      this.productTotal,
      this.totalAmount,
      this.totalKasti,
      this.totalLCD,
      this.totalOther});

  String? designName;
  List<String>? image = ['', '', ''];
  double? productTotal;
  double? totalLCD;
  double? totalKasti;
  double? totalOther;
  double? totalAmount;
}
