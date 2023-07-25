import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_app/shared/constant.dart';
import 'package:shopping_app/shared/custom_dialog.dart';
import '../../models/product.dart';

class ConfirmationDialog extends StatelessWidget {
  final Product product;

  const ConfirmationDialog({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      backgroundColor: Colors.white,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      child: Container(
        width: width(context)*0.9,
        decoration: BoxDecoration(
            color: AppColors.themeColor,
          borderRadius: BorderRadius.circular(15)
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                iconSize: 30,
                tooltip: 'Close',
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ),
            Text(jsonEncode(product)),
            const SizedBox(height: 25,),
            Text("Product Name: ${product.p_name}",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),),
            Text("Total Quantity: ${product.quantity}",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),),
            Text("Total Cost: ${product.p_cost}",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),),
            const SizedBox(height: 25,),
            MaterialButton(
                color: Colors.white,
                elevation: 0,
                height: 45,
                minWidth: MediaQuery.of(context).size.width*0.5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: const Text(
                  "Confirm NOW",
                  style: TextStyle(
                      color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                }
            ),
          ],
        ),
      )
    );
  }
}
