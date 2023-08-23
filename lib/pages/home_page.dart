import 'package:flutter/material.dart';
import 'package:glocery/model/cart_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/grocery_item_tlie.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => CartPage())),
        child: Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),

            //good morning
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Good morning",
              ),
            ),

            //let's order fresh items for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Let's order fresh items for you",
                style: GoogleFonts.notoSerif(
                    fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(
              height: 24,
            ),

            //divider
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),

            const SizedBox(
              height: 24,
            ),

            //fresh item + grid
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "Fresh Items",
                style: TextStyle(fontSize: 16),
              ),
            ),

            Expanded(
                child: Consumer<CartModel>(
              builder: (context, value, child) => GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                  padding: EdgeInsets.all(12),
                  itemCount: value.shopItem.length,
                  itemBuilder: (context, index) => GroceryItemTile(
                        itemName: value.shopItem[index][0],
                        itemPrice: value.shopItem[index][1],
                        imagePath: value.shopItem[index][2],
                        color: value.shopItem[index][3],
                        onTap: () {
                          Provider.of<CartModel>(context, listen: false)
                              .addItemToCart(index);
                        },
                      )),
            ))
          ],
        ),
      ),
    );
  }
}
