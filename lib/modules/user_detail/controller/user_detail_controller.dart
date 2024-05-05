import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pan_code_test/core/abstract/base_controller.dart';
import 'package:pan_code_test/core/data/model/params/pagination_params.dart';
import 'package:pan_code_test/core/di/injector.dart';
import 'package:pan_code_test/core/domain/entity/post_entity.dart';
import 'package:pan_code_test/core/domain/entity/user_entity.dart';
import 'package:pan_code_test/core/domain/usecase/add_friend_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/add_liked_post_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/check_is_friend_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/check_like_status_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/get_post_by_user_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/get_user_by_id_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/remove_friend_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/remove_liked_post_usecase.dart';

class UserDetailController extends BaseController {
  final _getUserDetail = injector<GetUserByIdUsecase>();
  final _getUserPost = injector<GetPostByUserUsecase>();
  final _addFriend = injector<AddFriendUsecase>();
  final _removeFriend = injector<RemoveFriendUsecase>();
  final _checIsFriend = injector<CheckIsFriendUsecase>();
    final _addLike = injector<AddLikedPostUsecase>();
  final _removeLike = injector<RemoveLikedPostUsecase>();
  final _checkLike = injector<CheckLikeStatusUsecase>();

  Rxn<UserEntity> userData = Rxn();
  final PagingController<int, PostEntity> pagingController =
      PagingController(firstPageKey: 0);
  final _numberOfPostsPerRequest = 20;
  int currentPage = 0;
  RxBool isFriend = false.obs;

  @override
  void onInit() {
    initData();
    pagingController.addPageRequestListener((page) {
      getPostList(page);
    });
    getUserDetail();
    super.onInit();
  }

  Future<void> initData() async {
    if (Get.arguments is UserEntity) {
      userData.value = Get.arguments as UserEntity;
      loadFriendStatus();
    }
  }

  Future<void> getUserDetail() async {
    isLoading.value = true;
    final result = await _getUserDetail(userData.value?.id ?? "");
    isLoading.value = false;
    result.fold(
      (l) => toastError(title: "Failed", message: l.message),
      (r) => userData.value = r,
    );
  }

  Future<void> getPostList(int page) async {
    final params = PaginationParams<String>(
      limit: _numberOfPostsPerRequest,
      page: page,
      data: userData.value?.id,
    );
    final result = await _getUserPost(params);
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

  Future<void> addFriend() async {
    final result = await _addFriend.call(userData.value!);
    await result.fold(
      (failure) async {
        toastError(title: "Failed", message: failure.message);
      },
      (successMessage) async {
        toastSuccess(title: "Succes", message: successMessage);
      },
    );
    await loadFriendStatus();
  }

  Future<void> removeFriend() async {
    final result = await _removeFriend.call(userData.value!);
    await result.fold(
      (failure) async {
        toastError(title: "Failed", message: failure.message);
      },
      (successMessage) async {
        toastSuccess(title: "Succes", message: successMessage);
      },
    );
    await loadFriendStatus();
  }

  Future<void> loadFriendStatus() async {
    final result = await _checIsFriend.call(userData.value!);
    await result.fold(
      (failure) async {},
      (data) async {
        isFriend.value = data;
      },
    );
  }


  Future<void> addLike(PostEntity post) async {
    final result = await _addLike.call(post);
    await result.fold(
      (failure) async {
        toastError(title: "Failed", message: failure.message);
      },
      (successMessage) async {
        toastSuccess(title: "Succes", message: successMessage);
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
  }

  Future<bool> loadLikeStatus(PostEntity post) async {
    final result = await _checkLike.call(post);
    return result.fold(
      (failure) => false,
      (data) => data,
    );
  }

  @override
  Future<void> refresh() async {
    await getUserDetail();
    pagingController.refresh();
  }
}
