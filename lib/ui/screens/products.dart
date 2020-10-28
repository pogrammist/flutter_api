import 'package:flutter/material.dart';
import 'package:flutter_api/logic/view_models/viewmodel_products.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductsViewModel model = ProductsViewModel();

  @override
  void initState() {
    model.loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: buildListView(model),
    );
  }

  Widget buildListView(ProductsViewModel model) {
    return ChangeNotifierProvider<ProductsViewModel>(
      create: (context) => model,
      child: Consumer<ProductsViewModel>(
        builder: (context, model, child) => ListView.builder(
          itemCount: model.products.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: SizedBox(
                  width: 60,
                  child: Text(
                    '${model.products[index].id}',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                title: Text('${model.products[index].name}'),
                subtitle: Text('${model.products[index].price}'),
                trailing: Text('${model.products[index].sId}'),
                onTap: null,
              ),
            );
          },
        ),
      ),
    );
  }
}
