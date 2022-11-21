import 'package:eflatun_task/models/product.model.dart';
import 'package:flutter/material.dart';

// Provider for cart items and count

CartNotifier cartNotifier = CartNotifier();

class CartNotifier with ChangeNotifier {
  List<ProductModel> cartItems = [];
  
  
  void add(ProductModel product) {
    cartItems.add(product);
    notifyListeners();
  }

  void remove(ProductModel product) {
    cartItems.remove(product);
    notifyListeners();
  }

  bool contains(ProductModel product) {
    return cartItems.contains(product);
  }
}
