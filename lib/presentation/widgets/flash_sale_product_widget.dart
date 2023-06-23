import 'package:flutter/material.dart';

import '../../models/home_reponse_model.dart';

class FlashSaleProductWidget extends StatelessWidget {
  final ProductModel product;
  const FlashSaleProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        border: Border.all(
          color: Color(0xffEBF0FF),
        ),
      ),
      child: Column(
        children: [
          // image
          Image.network(
            product.image,
            height: 80,
            width: 80,
          ),

          // product name
          Text(product.name, overflow: TextOverflow.ellipsis),

          // Price
          Text('${product.price} EGP'),
        ],
      ),
    );
  }
}
