import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant_inflearn/common/const/data.dart';
import 'package:flutter_restaurant_inflearn/common/dio/dio.dart';
import 'package:flutter_restaurant_inflearn/common/model/cursor_pagination_model.dart';
import 'package:flutter_restaurant_inflearn/restaurant/component/restaurant_card.dart';
import 'package:flutter_restaurant_inflearn/restaurant/model/restaurant_model.dart';
import 'package:flutter_restaurant_inflearn/restaurant/provider/retaurant_provider.dart';
import 'package:flutter_restaurant_inflearn/restaurant/repository/restaurant_repository.dart';
import 'package:flutter_restaurant_inflearn/restaurant/view/restaurant_detail_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantScreen extends ConsumerStatefulWidget{
  const RestaurantScreen({super.key});

  @override
  ConsumerState<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends ConsumerState<RestaurantScreen> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(scrollListener);
  }

  void scrollListener() {
    //현재 위치가
    // 최대 길이보다 조금 덜 되는 위치까지 왔다면
    // 새로운 데이터를 추가 요청
    if(controller.offset > controller.position.maxScrollExtent - 300) {
      ref.read(restaurantProvider.notifier).paginate(fetchMore: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(restaurantProvider);

    if (data is CursorPaginationLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (data is CursorPaginationError) {
      return Center(
        child: Text(data.message),
      );
    }

    // CursorPagination
    // CursorPaginationFetchingMore
    // CursorPaginationRefetching
    final cp = data as CursorPagination;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          controller: controller,
          itemCount: cp.data.length + 1,
          itemBuilder: (_, index) {
            if(index == cp.data.length) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Center(child: data is CursorPaginationFetchingMore ? CircularProgressIndicator() : Text('마지막 데이터입니다. ㅠㅠ')),
              );
            }

            return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) =>
                          RestaurantDetailScreen(id: cp.data[index].id),
                    ),
                  );
                },
                child: RestaurantCard.fromModel(model: cp.data[index]));
          },
          separatorBuilder: (_, index) => const SizedBox(height: 16),
        ),
      ),
    );
  }
}
