// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api_manager/api_manager.dart' as _i3;
import '../data/repository/dao_repository/posts_dao/post_api_datasource.dart'
    as _i4;
import '../data/repository/dao_repository_implemntation/posts_dao_implementation/posts_api_dao_implementation.dart'
    as _i5;
import '../data/repository/dao_repository_implemntation/posts_dao_implementation/posts_cache_dao_implementation.dart'
    as _i6;
import '../data/repository/data_repository/posts_repository.dart' as _i7;
import '../data/repository/data_repository_implementation/posts_repository_implementation.dart'
    as _i8;
import '../ui/posts/view_model/posts_cubit.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(_i3.ApiManager());
    gh.singleton<_i4.PostsDataSource>(
      _i5.PostsAPiDataSourceImplementation(),
      instanceName: 'api',
    );
    gh.singleton<_i4.PostsDataSource>(
      _i6.PostsCacheDaoImpl(),
      instanceName: 'cache',
    );
    gh.factory<_i7.PostsRepository>(() => _i8.PostsRepositoryImpl(
          gh<_i4.PostsDataSource>(instanceName: 'api'),
          gh<_i4.PostsDataSource>(instanceName: 'cache'),
        ));
    gh.factory<_i9.PostsCubit>(() => _i9.PostsCubit(gh<_i7.PostsRepository>()));
    return this;
  }
}
