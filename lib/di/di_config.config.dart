// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i23;
import '../module_category/category_module.dart' as _i22;
import '../module_category/manager/category_manager.dart' as _i16;
import '../module_category/repository/category_repository.dart' as _i12;
import '../module_category/service/category_serivce.dart' as _i17;
import '../module_category/state_manager/category_state_manager.dart' as _i20;
import '../module_category/ui/screen/category_screen.dart' as _i21;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i4;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i5;
import '../module_network/http_client/http_client.dart' as _i10;
import '../module_settings/settings_module.dart' as _i19;
import '../module_settings/ui/settings_page/settings_page.dart' as _i13;
import '../module_splash/splash_module.dart' as _i14;
import '../module_splash/ui/screen/splash_screen.dart' as _i7;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i8;
import '../module_theme/service/theme_service/theme_service.dart' as _i11;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i15;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i9;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i18;
import '../utils/helpers/fire_store_helper.dart' as _i3;
import '../utils/logger/logger.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.FireStoreHelper>(() => _i3.FireStoreHelper());
  gh.factory<_i4.LocalizationPreferencesHelper>(
      () => _i4.LocalizationPreferencesHelper());
  gh.factory<_i5.LocalizationService>(
      () => _i5.LocalizationService(get<_i4.LocalizationPreferencesHelper>()));
  gh.factory<_i6.Logger>(() => _i6.Logger());
  gh.factory<_i7.SplashScreen>(() => _i7.SplashScreen());
  gh.factory<_i8.ThemePreferencesHelper>(() => _i8.ThemePreferencesHelper());
  gh.factory<_i9.UploadRepository>(() => _i9.UploadRepository());
  gh.factory<_i10.ApiClient>(() => _i10.ApiClient(get<_i6.Logger>()));
  gh.factory<_i11.AppThemeDataService>(
      () => _i11.AppThemeDataService(get<_i8.ThemePreferencesHelper>()));
  gh.factory<_i12.CategoryRepository>(
      () => _i12.CategoryRepository(get<_i10.ApiClient>()));
  gh.factory<_i13.SettingsScreen>(() => _i13.SettingsScreen(
      get<_i5.LocalizationService>(), get<_i11.AppThemeDataService>()));
  gh.factory<_i14.SplashModule>(
      () => _i14.SplashModule(get<_i7.SplashScreen>()));
  gh.factory<_i15.UploadManager>(
      () => _i15.UploadManager(get<_i9.UploadRepository>()));
  gh.factory<_i16.CategoryManager>(
      () => _i16.CategoryManager(get<_i12.CategoryRepository>()));
  gh.factory<_i17.CategoryService>(
      () => _i17.CategoryService(get<_i16.CategoryManager>()));
  gh.factory<_i18.ImageUploadService>(
      () => _i18.ImageUploadService(get<_i15.UploadManager>()));
  gh.factory<_i19.SettingsModule>(
      () => _i19.SettingsModule(get<_i13.SettingsScreen>()));
  gh.factory<_i20.CategoriesStateManager>(
      () => _i20.CategoriesStateManager(get<_i17.CategoryService>()));
  gh.factory<_i21.CategoriesScreen>(
      () => _i21.CategoriesScreen(get<_i20.CategoriesStateManager>()));
  gh.factory<_i22.CategoryModule>(
      () => _i22.CategoryModule(get<_i21.CategoriesScreen>()));
  gh.factory<_i23.MyApp>(() => _i23.MyApp(
      get<_i11.AppThemeDataService>(),
      get<_i5.LocalizationService>(),
      get<_i14.SplashModule>(),
      get<_i19.SettingsModule>(),
      get<_i22.CategoryModule>()));
  return get;
}
