import 'package:flutter_restaurant_inflearn/common/model/cursor_pagination_model.dart';
import 'package:flutter_restaurant_inflearn/common/provider/pagination_provider.dart';
import 'package:flutter_restaurant_inflearn/rating/model/rating_model.dart';
import 'package:flutter_restaurant_inflearn/restaurant/model/restaurant_model.dart';
import 'package:flutter_restaurant_inflearn/restaurant/repository/restaurant_rating_repository.dart';
import 'package:flutter_restaurant_inflearn/restaurant/repository/restaurant_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final restaurantRatingProvider = StateNotifierProvider.family<
    RestaurantRatingStateNotifier, CursorPaginationBase, String>((ref, id) {
  final repo = ref.watch(restaurantRatingRepositoryProvider(id));

  return RestaurantRatingStateNotifier(repository: repo);
});

class RestaurantRatingStateNotifier
    extends PaginationProvider<RatingModel, RestaurantRatingRepository> {
  RestaurantRatingStateNotifier({
    required super.repository,
  });
}