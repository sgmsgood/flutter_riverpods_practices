import 'package:flutter/material.dart';
import 'package:flutter_restaurant_inflearn/restaurant/component/restaurant_card.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RestaurantCard(
          image: Image.asset('assets/img/food/ddeok_bok_gi.jpg'),
          name: '불타는 떡볶이',
          tags: ['떡볶이', '치즈', '매운맛'],
          ratingCount: 100,
          deliveryTime: 15,
          deliveryFee: 2000,
          rating: 4.52,
        ),
      ),
    );
  }
}
