import 'package:expense_calculator/widgets/product_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showData;

  const ProductsGrid({super.key, required this.showData});
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products=showData ? productData.Favitems:productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value:products[index],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 3 / 2),
    );
  }
}
