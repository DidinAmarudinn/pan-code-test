import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pan_code_test/core/abstract/base_controller.dart';
import 'package:pan_code_test/core/data/model/params/pagination_params.dart';
import 'package:pan_code_test/core/di/injector.dart';
import 'package:pan_code_test/core/domain/entity/user_entity.dart';
import 'package:pan_code_test/core/domain/usecase/get_user_list_usecase.dart';

class UserListController extends BaseController {
  // Usecase
  final GetUserListUsecase _getProducts = injector<GetUserListUsecase>();

  // Variable
  final PagingController<int, UserEntity> pagingController =
      PagingController(firstPageKey: 0);
  final _numberOfPostsPerRequest = 20;
  int currentPage = 0;

  @override
  void onInit() {
    pagingController.addPageRequestListener((page) {
      getUserList(page);
    });
    super.onInit();
  }

  Future<void> getUserList(int page) async {
    final params = PaginationParams(
      limit: _numberOfPostsPerRequest,
      page: page,
    );
    final result = await _getProducts(params);
    result.fold(
      (failure) {
        pagingController.error = failure.message;
      },
      (result) {
        if (result.length < _numberOfPostsPerRequest) {
          pagingController.appendLastPage(result);
        } else {
          final nextPageKey = page + 1;
          currentPage = nextPageKey;
          pagingController.appendPage(result, nextPageKey);
        }
      },
    );
  }

  @override
  Future<void> refresh() async {
    pagingController.refresh();
  }
}
