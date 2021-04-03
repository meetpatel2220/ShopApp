import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/products_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFav;
  ProductsGrid(this.showFav);
  
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context,);
    final products = showFav? productData.favoriteItems : productData.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 /3 ,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (ctx, index) {
          return ChangeNotifierProvider.value(
           value: products[index],
            child: ProductItem(),
          );
        });
  }
}

