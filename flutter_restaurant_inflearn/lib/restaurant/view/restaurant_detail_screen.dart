import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant_inflearn/common/const/data.dart';
import 'package:flutter_restaurant_inflearn/common/dio/dio.dart';
import 'package:flutter_restaurant_inflearn/common/model/cursor_pagination_model.dart';
import 'package:flutter_restaurant_inflearn/layout/default_layout.dart';
import 'package:flutter_restaurant_inflearn/product/component/product_card.dart';
import 'package:flutter_restaurant_inflearn/restaurant/component/restaurant_card.dart';
import 'package:flutter_restaurant_inflearn/restaurant/model/restaurant_detail_model.dart';
import 'package:flutter_restaurant_inflearn/restaurant/model/restaurant_model.dart';
import 'package:flutter_restaurant_inflearn/restaurant/provider/retaurant_provider.dart';
import 'package:flutter_restaurant_inflearn/restaurant/repository/restaurant_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletons/skeletons.dart';

class RestaurantDetailScreen extends ConsumerStatefulWidget {
  final String id;

  const RestaurantDetailScreen({required this.id, super.key});

  @override
  ConsumerState<RestaurantDetailScreen> createState() =>
      _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState
    extends ConsumerState<RestaurantDetailScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(restaurantProvider.notifier).getDetail(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(restaurantDetailProvider(widget.id));

    if (state == null) {
      return DefaultLayout(
          child: Center(
        child: CircularProgressIndicator(),
      ));
    }

    return DefaultLayout(
      title: '불타는 떡볶이',
      child: CustomScrollView(
        slivers: [
          renderTop(model: state),
          if(state is! RestaurantDetailModel) renderLoading(),
          if (state is RestaurantDetailModel) renderLabel(),
          if (state is RestaurantDetailModel)
            renderProducts(products: state.products)
        ],
      ),
    );
  }

  SliverPadding renderLoading() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          List.generate(
            3,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: SkeletonParagraph(
                style: SkeletonParagraphStyle(lines: 5, padding: EdgeInsets.zero),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SliverPadding renderLabel() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: Text(
          '메뉴',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  SliverPadding renderProducts(
      {required List<RestaurantProductModel> products}) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ProductCard.fromModel(model: products[index]),
          );
        }, childCount: products.length),
      ),
    );
  }

  SliverToBoxAdapter renderTop({required RestaurantModel model}) {
    return SliverToBoxAdapter(
      child: RestaurantCard.fromModel(
        model: model,
        isDetail: true,
      ),
    );
  }
}