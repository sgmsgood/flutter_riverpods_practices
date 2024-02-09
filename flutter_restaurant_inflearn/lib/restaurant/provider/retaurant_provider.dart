import 'package:flutter_restaurant_inflearn/common/model/cursor_pagination_model.dart';
import 'package:flutter_restaurant_inflearn/common/model/pagination_params.dart';
import 'package:flutter_restaurant_inflearn/restaurant/model/restaurant_model.dart';
import 'package:flutter_restaurant_inflearn/restaurant/repository/restaurant_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final restaurantProvider =
    StateNotifierProvider<RestaurantStateNotifier, CursorPaginationBase>((ref) {
  final repository = ref.watch(restaurantRepositoryProvider);
  final notifier = RestaurantStateNotifier(repository: repository);

  return notifier;
});

class RestaurantStateNotifier extends StateNotifier<CursorPaginationBase> {
  final RestaurantRepository repository;

  RestaurantStateNotifier({required this.repository})
      : super(CursorPaginationLoading()) {
    paginate();
  }

  paginate(
      {int fetchCount = 20,
      //true: 추가로 데이터 더 가져옴
      //false: 새로고침 (현재 상태를 덮어씌움)
      bool fetchMore = false,
      // 강제로 다시 로딩하기
      // true = CursorPaginationLoading
      bool forceRefetch = false}) async {
    //5가지 가능성
    // state의 상태
    // 상태가
    // 1) CursorPagination - 정상적으로 데이터가 있는 상태
    // 2) CursorPaginationLoading - 데이터가 로딩중인 상태 (현재 캐시 없음)
    // 3) CursorPaginationError - 에러가 있는 상태
    // 4) CursorPaginationRefetching - 첫번째 페이지부터 다시 데이터를 가지고 올 때
    // 5) CursorPaginationFetchMore - 추가 데이터를 pagination 해오라는 요청을 받았을 때

    // 바로 반환하는 상황

    try {
      if (state is CursorPagination && !forceRefetch) {
        final pState = state as CursorPagination;

        //  1) hasMore - false (기존 상태에서 이미 다음 데이터가 없다는 값을 들고 있다면)
        if (!pState.meta.hasMore) {
          return;
        }
      }

      // 2) 로딩 중
      // fetchMore: true => 즉시 반환
      // fetchMore: false => 새로 고침의 의도가 있다고 볼 수 있음
      final isLoading = state is CursorPaginationLoading;
      final isRefetching = state is CursorPaginationRefetching;
      final isFetchingMore = state is CursorPaginationFetchingMore;

      if (fetchMore && (isLoading || isRefetching || isFetchingMore)) {
        return;
      }

      // PaginationParams 생성
      PaginationParams paginationParams = PaginationParams(count: fetchCount);

      // fetchMore
      // 데이터를 추가로 더 가져오는 상황
      if (fetchMore) {
        final pState = state as CursorPagination;
        state =
            CursorPaginationFetchingMore(meta: pState.meta, data: pState.data);

        paginationParams =
            paginationParams.copyWith(after: pState.data.last.id);
      } else {
        // 만약 데이터가 있는 상황이라면
        // 기존 데이터를 보존한 채로 Fetch(API 요청)를 진행
        if (state is CursorPagination && !forceRefetch) {
          final pState = state as CursorPagination;
          state =
              CursorPaginationRefetching(meta: pState.meta, data: pState.data);
        } else {
          state = CursorPaginationLoading();
        }
      }

      final resp =
          await repository.paginate(paginationParams: paginationParams);

      if (state is CursorPaginationFetchingMore) {
        final pState = state as CursorPaginationFetchingMore;
        // 기존 데이터에 새로운 데이터 추가
        state = resp.copyWith(data: [...pState.data, ...resp.data]);
      } else {
        state = resp;
      }
    } catch (e) {
      state = CursorPaginationError(message: '데이터를 가지고 오지 못했습니다.');
    }
  }
}
