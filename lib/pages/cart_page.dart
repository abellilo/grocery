import 'package:flutter/material.dart';
import 'package:glocery/model/cart_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<CartModel>(
        builder: (context, value, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
              child: Text("My Cart",
                style: GoogleFonts.notoSerif(
                    fontSize: 36, fontWeight: FontWeight.bold),),
            ),

            Expanded(
                child: ListView.builder(
                    itemCount: value.cartItem.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8)),
                            child: ListTile(
                              leading: Image.asset(
                                value.cartItem[index][2],
                                height: 36,
                              ),
                              title: Text(value.cartItem[index][0]),
                              subtitle: Text('\$' + value.cartItem[index][1]),
                              trailing: IconButton(
                                onPressed: () => Provider.of<CartModel>(context,
                                        listen: false)
                                    .removeItemFromCart(index),
                                icon: Icon(Icons.cancel),
                              ),
                            ),
                          ),
                        ))),

            // total + pay now
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Price",
                            style: TextStyle(color: Colors.green[100]),
                          ),
                          Text(
                            '₦'+value.caculateTotal(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Text(
                              "Pay now",
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 16,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
