import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant_inflearn/common/const/data.dart';
import 'package:flutter_restaurant_inflearn/restaurant/component/restaurant_card.dart';
import 'package:flutter_restaurant_inflearn/restaurant/model/restaurant_model.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  Future<List> paginateRestaurant() async {
    final dio = Dio();
    // access => 5분
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final resp = await dio.get(
      'http://$localIp/restaurant',
      options: Options(
        headers: {'authorization': 'Bearer $accessToken'},
      ),
    );

    return resp.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FutureBuilder<List>(
            future: paginateRestaurant(),
            builder: (context, AsyncSnapshot<List> snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }

              return ListView.separated(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (_, index) {
                  final item = snapshot.data![index];
                  final pItem = RestaurantModel(
                    id: item['id'],
                    name: item['name'].toString(),
                    thumbUrl: item['thumbUrl'],
                    priceRange: RestaurantPriceRange.values
                        .firstWhere((e) => e.name == item['priceRange']),
                    ratings: item['ratings'],
                    ratingsCount: item['ratingsCount'],
                    deliveryTime: item['deliveryTime'],
                    deliveryFee: item['deliveryFee'],
                    tags: List<String>.from(item['tags']),
                  );

                  return RestaurantCard(
                    image: Image.network("http://$localIp/${pItem.thumbUrl}", fit: BoxFit.cover),
                    name: pItem.name,
                    tags: pItem.tags,
                    ratingsCount: pItem.ratingsCount,
                    deliveryTime: pItem.deliveryTime,
                    deliveryFee: pItem.deliveryFee,
                    ratings: pItem.ratings,
                  );
                },
                separatorBuilder: (_, index) => const SizedBox(height: 16),
              );
            },
          ),
        ),
      ),
    );
  }
}
