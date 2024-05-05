import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pan_code_test/core/abstract/base_controller.dart';
import 'package:pan_code_test/core/abstract/usecase.dart';
import 'package:pan_code_test/core/di/injector.dart';
import 'package:pan_code_test/core/domain/entity/post_entity.dart';
import 'package:pan_code_test/core/domain/usecase/add_liked_post_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/check_like_status_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/get_all_post_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/get_post_by_tag_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/remove_liked_post_usecase.dart';

import '../../../core/data/model/params/pagination_params.dart';

class PostListController extends BaseController {
  final _getAllPost = injector<GetAllPostUsecase>();
  final _getPostByTag = injector<GetPostByTagUsecase>();
  final _addLike = injector<AddLikedPostUsecase>();
  final _removeLike = injector<RemoveLikedPostUsecase>();
  final _checkLike = injector<CheckLikeStatusUsecase>();
  final PagingController<int, PostEntity> pagingController =
      PagingController(firstPageKey: 0);
  final _numberOfPostsPerRequest = 20;
  int currentPage = 0;
  Rxn<String> selectedTag = Rxn();

  @override
  void onInit() {
    pagingController.addPageRequestListener((page) {
      getPostList(page);
    });
    super.onInit();
  }

  Future<void> getPostList(int page) async {
    final params = PaginationParams<String>(
        limit: _numberOfPostsPerRequest, page: page, data: selectedTag.value);
    late Either<Failure, List<PostEntity>> result;
    if (selectedTag.value == null) {
      result = await _getAllPost(params);
    } else {
      result = await _getPostByTag(params);
    }
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

  Future<void> filterByTag(String tag) async {
    selectedTag.value = tag;
    pagingController.refresh();
  }

  Future<void> removeFilterByTag() async {
    selectedTag.value = null;
    pagingController.refresh();
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
}
