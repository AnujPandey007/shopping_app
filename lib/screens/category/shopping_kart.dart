import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/screens/category/product_card.dart';
import 'package:shopping_app/shared/constant.dart';

class ShoppingKart extends StatefulWidget {
  const ShoppingKart({Key? key}) : super(key: key);

  @override
  State<ShoppingKart> createState() => _ShoppingKartState();
}

class _ShoppingKartState extends State<ShoppingKart> {
  List<Product> allProducts = [];
  List<Product> filteredProducts = [];
  List<String> categories = [];

  String selectedCategory = '';

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
            'Shopping Kart App',
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: selectedCategory == category,
                    selectedColor: AppColors.themeColor,
                    onSelected: (isSelected) {
                      filterProductsByCategory(isSelected ? category : '');
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return ProductCard(product: filteredProducts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  void loadProducts() async {
    String data = await rootBundle.loadString('assets/products.json');
    List<dynamic> productsJson = jsonDecode(data);
    List<Product> products = productsJson.map((productJson) => Product.fromJson(productJson)).toList();

    categories = products.map((product) => product.p_category).toSet().toList();
    categories.insert(0, 'All');

    setState(() {
      allProducts = products;
      filteredProducts = allProducts;
    });
  }

  void filterProductsByCategory(String? category) {
    setState(() {
      selectedCategory = category!;
      if (category.isEmpty || category == 'All') {
        filteredProducts = allProducts;
      } else {
        filteredProducts = allProducts.where((product) => product.p_category == category).toList();
      }
    });
  }
}
