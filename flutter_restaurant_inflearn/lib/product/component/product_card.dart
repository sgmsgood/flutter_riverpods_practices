import 'package:flutter/material.dart';
import 'package:flutter_restaurant_inflearn/common/const/colors.dart';
import 'package:flutter_restaurant_inflearn/common/const/data.dart';
import 'package:flutter_restaurant_inflearn/restaurant/model/restaurant_detail_model.dart';

class ProductCard extends StatelessWidget {
  final Image image;
  final String name;
  final String detail;
  final int price;

  const ProductCard({required this.image,
    required this.name, required this.detail, required this.price, required super.key});

  factory ProductCard.fromModel({required RestaurantProductModel model}){
    return ProductCard(
      image:Image.network(
        model.imgUrl,
        width: 110,
        height: 110,
        fit: BoxFit.cover,
      ),
      name: model.name,
      detail: model.detail,
      price: model.price, key: null,
    );
  }



  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: image
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  detail,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(color: BODY_TEXT_COLOR, fontSize: 14),
                ),
                Text('$price',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: PRIMARY_COLOR,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
