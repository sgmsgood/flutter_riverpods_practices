import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_restaurant_inflearn/common/const/data.dart';
import 'package:flutter_restaurant_inflearn/common/dio/dio.dart';
import 'package:flutter_restaurant_inflearn/common/model/cursor_pagination_model.dart';
import 'package:flutter_restaurant_inflearn/common/model/pagination_params.dart';
import 'package:flutter_restaurant_inflearn/common/repository/base_pagination_repository.dart';
import 'package:flutter_restaurant_inflearn/restaurant/model/restaurant_detail_model.dart';
import 'package:flutter_restaurant_inflearn/restaurant/model/restaurant_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'restaurant_repository.g.dart';

final restaurantRepositoryProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);

  final repository =
      RestaurantRepository(dio, baseUrl: 'http://$localIp/restaurant');

  return repository;
});

@RestApi()
abstract class RestaurantRepository implements IBasePaginationRepository<RestaurantModel>{
  // base = http://$ip/restaurant
  factory RestaurantRepository(Dio dio, {String baseUrl}) =
      _RestaurantRepository;

  // http://$ip/restaurant/
  @GET('/')
  @Headers({'accessToken': 'true'})
  Future<CursorPagination<RestaurantModel>> paginate({
      @Queries()
      PaginationParams? paginationParams = const PaginationParams()
  });

  // http://$ip/restaurant/:id
  @GET('/{id}')
  @Headers({'accessToken': 'true'})
  Future<RestaurantDetailModel> getRestaurantDetail(
      {@Path() required String id});
}
