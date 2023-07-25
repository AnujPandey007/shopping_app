import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/screens/category/confirmation_dialog.dart';
import 'package:shopping_app/shared/constant.dart';

class ProductDetail extends StatefulWidget {
  final Product product;
  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int productCost = 1;
  int productQuantity = 1;

  @override
  void initState() {
    super.initState();
    productCost = widget.product.p_cost * widget.product.quantity;
    productQuantity = widget.product.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 70,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.p_name,
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 3,),
                Text(
                  widget.product.p_details,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Hero(
              tag: widget.product.p_id,
              child: Image.asset(
                'assets/images/${widget.product.p_image}',
                width: MediaQuery.of(context).size.width*0.7,
              ),
            ),
          ),
          const SizedBox(height: 100,),
          Center(
            child: Divider(
              color: Colors.black,
              indent: MediaQuery.of(context).size.width/3,
              endIndent: MediaQuery.of(context).size.width/3,
            ),
          ),
          Spacer(),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40)
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sagittis eros non ex interdum, vel malesuada urna faucibus. Maecenas vitae risus dolor. In ut turpis ac mi faucibus dapibus. Sed vestibulum odio eu hendrerit malesuada. Duis et suscipit enim. Nulla facilisi."),
                ),
                if(widget.product.p_availability)...[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              color: Colors.black,
                              onPressed: () {
                                if(productQuantity>=2){
                                  setState(() {
                                    productQuantity--;
                                    productCost =widget.product.p_cost *productQuantity;
                                  });
                                }
                              },
                            ),
                            const SizedBox(width: 10,),
                            Text(
                              "$productQuantity",
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(width: 10,),
                            IconButton(
                              icon: const Icon(Icons.add),
                              color: Colors.black,
                              onPressed: () {
                                if(productQuantity<=9){
                                  setState(() {
                                    productQuantity++;
                                    productCost =widget.product.p_cost *productQuantity;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                        Text(
                          "Rs: $productCost",
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ),
                ]

              ],
            ),
          )

        ],
      ),
      bottomNavigationBar: Container(
        color: AppColors.themeColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 16,),
            IconButton(
              iconSize: 30,
              tooltip: 'Add to cart',
              icon: const Icon(Icons.shopping_cart_outlined),
              onPressed: () {  },
            ),
            const Spacer(),
            MaterialButton(
              color: Colors.white,
              elevation: 0,
              height: 45,
              minWidth: MediaQuery.of(context).size.width*0.5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              child: const Text(
                "BUY NOW",
                style: TextStyle(
                    color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: () async{
                Product updatedProduct = Product(
                  p_name: widget.product.p_name,
                  p_id: widget.product.p_id,
                  p_availability: widget.product.p_availability,
                  p_category: widget.product.p_category,
                  p_details: widget.product.p_details,
                  p_image: widget.product.p_image,
                  p_cost: productCost,
                  quantity: productQuantity,
                );

                bool productBought = await showDialog(
                  context: context,
                  builder: (context) {
                    return ConfirmationDialog(product: updatedProduct);
                  }
                );

                SnackBar snackBar = SnackBar(
                  content: Text(productBought ? 'Product is bought successfully' : "Product is not bought"),
                  backgroundColor: (Colors.black),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            ),
            const SizedBox(width: 16,),
          ],
        ),
      ),
    );
  }
}
