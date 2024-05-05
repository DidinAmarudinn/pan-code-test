import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pan_code_test/core/abstract/base_controller.dart';
import 'package:pan_code_test/core/abstract/usecase.dart';
import 'package:pan_code_test/core/di/injector.dart';
import 'package:pan_code_test/core/domain/entity/post_entity.dart';
import 'package:pan_code_test/core/domain/usecase/get_liked_post_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/remove_liked_post_usecase.dart';

class LikeController extends BaseController {
  final _getLikedPost = injector<GetLikedPostUsecase>();
  final _removeLike = injector<RemoveLikedPostUsecase>();
  final PagingController<int, PostEntity> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() {
    pagingController.addPageRequestListener((_) {
      getLikedPost();
    });
    super.onInit();
  }

  Future<void> getLikedPost() async {
    final result = await _getLikedPost(NoParams());
    result.fold(
      (failure) {
        pagingController.error = failure.message;
      },
      (result) {
        pagingController.appendLastPage(result);
      },
    );
  }

  Future<void> removeLike(PostEntity post) async {
    final result = await _removeLike.call(post);
    await result.fold(
      (failure) async {
        toastError(title: "Failed", message: failure.message);
      },
      (successMessage) async {
        toastSuccess(title: "Succes", message: successMessage);
      },
    );
    pagingController.refresh();
  }
}
