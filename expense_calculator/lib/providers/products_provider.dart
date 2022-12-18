import 'package:flutter/foundation.dart';

import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: 'p1',
        title: 'A Table',
        description: 'keep items on it',
        price: 49.99,
        imageUrl:
            'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg'),
    Product(
        id: 'p2',
        title: 'A Pan',
        description: 'Prepare any meal you want',
        price: 49.99,
        imageUrl:
            'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg'),
    Product(
        id: 'p3',
        title: 'A Car',
        description: 'Go for a Long Drive',
        price: 49.99,
        imageUrl:
            'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg'),
    Product(
        id: 'p4',
        title: 'A Bed',
        description: 'Have a good Night Sleep',
        price: 49.99,
        imageUrl:
            'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg'),
  ];
  var _showFavouritesOnly = false;
  List<Product> get Favitems {
    return _items.where((element) => element.isFavourite).toList();
  }
  List<Product> get items {
    return [..._items];
  }
  Product findbyId(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
