import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{

  //list of item on sale
  final List _shopItem = [
    //[itemName, itemPrice, imagePath, color]
    ["Avocado","4.0","lib/images/avocado.png", Colors.green],
    ["Banana","2.50","lib/images/banana.png", Colors.yellow],
    ["Chicken","12.8","lib/images/chicken.png", Colors.brown],
    ["Water","1.0","lib/images/water.png", Colors.blue],
  ];

  //list of cart items
  List _cartItems = [];

  get shopItem => _shopItem;

  get cartItem => _cartItems;

  //add item to cart
  void addItemToCart(int index){
    _cartItems.add(_shopItem[index]);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calculate total price
  String caculateTotal(){
    double totalPrice = 0;
    for(int i= 0; i < _cartItems.length; i++){
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
  
}