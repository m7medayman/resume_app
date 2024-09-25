// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:resume_app/core/Di/injection.dart' as _i381;
import 'package:resume_app/core/resources/device_manager.dart/device_manager.dart'
    as _i224;
import 'package:resume_app/core/theme_manager/font/font_stayle_manager.dart'
    as _i794;
import 'package:resume_app/core/theme_manager/theme_manager.dart' as _i176;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.singleton<_i224.DeviceManager>(
        () => appModule.createDeviceManager(gh<double>()));
    gh.singleton<_i794.FontStyleManager>(
        () => _i794.FontStyleManager(gh<_i224.DeviceManager>()));
    gh.singleton<_i176.MyTheme>(
        () => _i176.MyTheme(fontStyleManager: gh<_i794.FontStyleManager>()));
    return this;
  }
}

class _$AppModule extends _i381.AppModule {}
