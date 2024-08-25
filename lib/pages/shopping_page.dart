import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  List<Product> products = [
    Product(name: 'Tanaman Hias', price: 50000),
    Product(name: 'Pupuk Organik', price: 25000),
    Product(name: 'Sekop Kecil', price: 15000),
    Product(name: 'Sprayer', price: 30000),
    Product(name: 'Gunting Pemangkas', price: 45000),
  ];

  Map<String, int> cart = {};

  void addToCart(BuildContext context, String productName) {
    if (cart.containsKey(productName)) {
      setState(() {
        cart[productName] = (cart[productName]! + 1);
      });
    } else {
      setState(() {
        cart[productName] = 1;
      });
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$productName berhasil ditambahkan ke keranjang'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void viewCart(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        int total = 0;
        cart.forEach((productName, quantity) {
          final product =
              products.firstWhere((product) => product.name == productName);
          total += product.price * quantity;
        });

        List<Widget> cartList = cart.entries.map((entry) {
          final product =
              products.firstWhere((product) => product.name == entry.key);
          return ListTile(
            title: Text(entry.key),
            subtitle: Text('Rp ${product.price} x ${entry.value}'),
            trailing: Text('Rp ${product.price * entry.value}'),
          );
        }).toList();

        List<Widget> cartListWithDividers = [];
        for (var item in cartList) {
          cartListWithDividers.add(item);
          if (item != cartList.last) {
            cartListWithDividers
                .add(Divider()); 
          }
        }

        cartListWithDividers.add(ListTile(
          title: Text('Total'),
          trailing: Text('Rp $total'),
        ));

        if (cartList.isEmpty) {
          cartListWithDividers.clear(); 
          cartListWithDividers
              .add(Center(child: Text('Keranjang Anda kosong')));
        }

        return Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: cartListWithDividers,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitur Belanja'),
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        color: Colors.lightBlue.shade50,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(products[index].name),
                      subtitle: Text('Rp ${products[index].price}'),
                      trailing: IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () =>
                            addToCart(context, products[index].name),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => viewCart(context),
                child: Text('Lihat Keranjang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
