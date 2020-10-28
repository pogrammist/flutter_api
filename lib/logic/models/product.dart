class Product {
  String sId;
  int id;
  String name;
  double price;

  Product({this.sId, this.id, this.name, this.price});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
