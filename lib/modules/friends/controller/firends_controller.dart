import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pan_code_test/core/abstract/base_controller.dart';
import 'package:pan_code_test/core/abstract/usecase.dart';
import 'package:pan_code_test/core/di/injector.dart';
import 'package:pan_code_test/core/domain/entity/user_entity.dart';
import 'package:pan_code_test/core/domain/usecase/get_firends_usecase.dart';

class FriendsController extends BaseController {
  final _getFriends = injector<GetFriendUsecase>();
  final PagingController<int, UserEntity> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() {
    pagingController.addPageRequestListener((_) {
      getFriend();
    });
    super.onInit();
  }

  Future<void> getFriend() async {
    final result = await _getFriends(NoParams());
    result.fold(
      (failure) {
        pagingController.error = failure.message;
      },
      (result) {
        pagingController.appendLastPage(result);
      },
    );
  }
}
