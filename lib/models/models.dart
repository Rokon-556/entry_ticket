import 'dart:convert';




List<ListModel> memberModelFromJson(String str) =>
    List<ListModel>.from(
        json.decode(str).map((x) => ListModel.fromJson(x)));

String memberModelToJson(List<ListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));




class ListModel {
  
  List<Items>? items;
  bool? hasMore;
  int? limit;
  int? offset;
  int? count;
  List<Links>? links;

  ListModel(
      {this.items,
      this.hasMore,
      this.limit,
      this.offset,
      this.count,
      this.links});


      

  ListModel.fromJson(Map<String, dynamic> json) {
    print("4--");
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    hasMore = json['hasMore'];
    limit = json['limit'];
    offset = json['offset'];
    count = json['count'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['hasMore'] = this.hasMore;
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    data['count'] = this.count;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? pk;
  Null? customerIdFk;
  String? mobileNumber;
  int? total;
  int? discountAmount;
  int? subTotal;
  int? receivedAmount;
  int? returnAmount;
  String? paymentType;
  String? sellPerson;
  int? bunitFk;
  String? sellDate;
  String? couponCode;
  int? vat;
  Null? slType;
  Null? trnId;
  int? discountAble;
  String? discountCoupon;
  int? discountPct;
  int? vatableAmt;
  int? netAmt;
  Null? appAvil;
  Null? unixtimestamp;
  Null? usedBranch;
  Null? useDate;
  Null? startDate;

  Items(
      {this.pk,
      this.customerIdFk,
      this.mobileNumber,
      this.total,
      this.discountAmount,
      this.subTotal,
      this.receivedAmount,
      this.returnAmount,
      this.paymentType,
      this.sellPerson,
      this.bunitFk,
      this.sellDate,
      this.couponCode,
      this.vat,
      this.slType,
      this.trnId,
      this.discountAble,
      this.discountCoupon,
      this.discountPct,
      this.vatableAmt,
      this.netAmt,
      this.appAvil,
      this.unixtimestamp,
      this.usedBranch,
      this.useDate,
      this.startDate});

  Items.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    customerIdFk = json['customer_id_fk'];
    mobileNumber = json['mobile_number'];
    total = json['total'];
    discountAmount = json['discount_amount'];
    subTotal = json['sub_total'];
    receivedAmount = json['received_amount'];
    returnAmount = json['return_amount'];
    paymentType = json['payment_type'];
    sellPerson = json['sell_person'];
    bunitFk = json['bunit_fk'];
    sellDate = json['sell_date'];
    couponCode = json['coupon_code'];
    vat = json['vat'];
    slType = json['sl_type'];
    trnId = json['trn_id'];
    discountAble = json['discount_able'];
    discountCoupon = json['discount_coupon'];
    discountPct = json['discount_pct'];
    vatableAmt = json['vatable_amt'];
    netAmt = json['net_amt'];
    appAvil = json['app_avil'];
    unixtimestamp = json['unixtimestamp'];
    usedBranch = json['used_branch'];
    useDate = json['use_date'];
    startDate = json['start_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk'] = this.pk;
    data['customer_id_fk'] = this.customerIdFk;
    data['mobile_number'] = this.mobileNumber;
    data['total'] = this.total;
    data['discount_amount'] = this.discountAmount;
    data['sub_total'] = this.subTotal;
    data['received_amount'] = this.receivedAmount;
    data['return_amount'] = this.returnAmount;
    data['payment_type'] = this.paymentType;
    data['sell_person'] = this.sellPerson;
    data['bunit_fk'] = this.bunitFk;
    data['sell_date'] = this.sellDate;
    data['coupon_code'] = this.couponCode;
    data['vat'] = this.vat;
    data['sl_type'] = this.slType;
    data['trn_id'] = this.trnId;
    data['discount_able'] = this.discountAble;
    data['discount_coupon'] = this.discountCoupon;
    data['discount_pct'] = this.discountPct;
    data['vatable_amt'] = this.vatableAmt;
    data['net_amt'] = this.netAmt;
    data['app_avil'] = this.appAvil;
    data['unixtimestamp'] = this.unixtimestamp;
    data['used_branch'] = this.usedBranch;
    data['use_date'] = this.useDate;
    data['start_date'] = this.startDate;
    return data;
  }
}

class Links {
  String? rel;
  String? href;

  Links({this.rel, this.href});

  Links.fromJson(Map<String, dynamic> json) {
    rel = json['rel'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rel'] = this.rel;
    data['href'] = this.href;
    return data;
  }
}