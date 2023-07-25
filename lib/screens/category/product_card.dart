import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/screens/category/product_detail.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetail(product:product)));
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        leading: Hero(
          tag: product.p_id,
          child: Image.asset(
            'assets/images/${product.p_image}',
            width: 80,
            height: 80,
          ),
        ),
        title: Text(
          product.p_name,
          style: const TextStyle(
              fontSize: 19
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 3,),
            Text(product.p_details),
          ],
        ),
        // isThreeLine: true,
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(product.p_availability ? 'In Stock' : 'Out of Stock'),
            const SizedBox(height: 3,),
            if(product.p_availability)...[
              Text(
                'Rs: ${product.p_cost}',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}