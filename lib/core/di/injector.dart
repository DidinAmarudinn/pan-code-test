import 'package:get_it/get_it.dart';
import 'package:pan_code_test/core/data/datasource/local/local_datasource.dart';
import 'package:pan_code_test/core/data/datasource/local/local_datasource_impl.dart';
import 'package:pan_code_test/core/data/datasource/remote/post_service.dart';
import 'package:pan_code_test/core/data/datasource/remote/user_service.dart';
import 'package:pan_code_test/core/data/repostiories/post_repository_impl.dart';
import 'package:pan_code_test/core/data/repostiories/user_repostiory_impl.dart';
import 'package:pan_code_test/core/domain/repositories/post_repository.dart';
import 'package:pan_code_test/core/domain/repositories/user_repository.dart';
import 'package:pan_code_test/core/domain/usecase/add_friend_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/add_liked_post_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/check_is_friend_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/check_like_status_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/get_all_post_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/get_firends_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/get_liked_post_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/get_post_by_tag_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/get_post_by_user_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/get_user_by_id_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/get_user_list_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/remove_friend_usecase.dart';
import 'package:pan_code_test/core/domain/usecase/remove_liked_post_usecase.dart';
import 'package:pan_code_test/core/helper/database_helper.dart';

import '../services/dio_services.dart';

final injector = GetIt.I;

Future<void> initializeDependencies() async {
  injector.registerLazySingleton(
    () => dioServices(),
  );
  injector.registerLazySingleton(
    () => DatabaseHelper(),
  );

  // Services
  injector.registerLazySingleton(
    () => UserService(
      injector(),
    ),
  );
  injector.registerLazySingleton(
    () => PostService(
      injector(),
    ),
  );
  injector.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(
      injector(),
    ),
  );

  // Repository
  injector.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      injector(),
      injector()
    ),
  );
  injector.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(
      injector(),
      injector()
    ),
  );

  // Usecase
  injector.registerLazySingleton(
    () => GetUserListUsecase(
      injector(),
    ),
  );
  injector.registerLazySingleton(
    () => GetUserByIdUsecase(
      injector(),
    ),
  );
  injector.registerLazySingleton(
    () => GetPostByUserUsecase(
      injector(),
    ),
  );
  injector.registerLazySingleton(
    () => GetAllPostUsecase(
      injector(),
    ),
  );
  injector.registerLazySingleton(
    () => GetPostByTagUsecase(
      injector(),
    ),
  );
  injector.registerLazySingleton(
    () => AddFriendUsecase(
      injector(),
    ),
  );
  injector.registerLazySingleton(
    () => RemoveFriendUsecase(
      injector(),
    ),
  );
  injector.registerLazySingleton(
    () => CheckIsFriendUsecase(
      injector(),
    ),
  );
  injector.registerLazySingleton(
    () => GetFriendUsecase(
      injector(),
    ),
  );
  injector.registerLazySingleton(
    () => AddLikedPostUsecase(
      injector(),
    ),
  );
  injector.registerLazySingleton(
    () => RemoveLikedPostUsecase(
      injector(),
    ),
  );
  injector.registerLazySingleton(
    () => CheckLikeStatusUsecase(
      injector(),
    ),
  );
  injector.registerLazySingleton(
    () => GetLikedPostUsecase(
      injector(),
    ),
  );
}
