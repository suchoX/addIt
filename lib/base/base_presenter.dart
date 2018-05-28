import 'package:add_it/base/base_view.dart';
import 'package:add_it/Injector.dart';
import 'package:add_it/utils/pref_utils.dart';

abstract class BasePresenter<T extends BaseView> {
  T _view;
  Injector _injector;
  PreferenceUtils _preferenceUtils;

  BasePresenter(this._view) {
    _injector = new Injector();
    _preferenceUtils = _injector.preferenceUtils;
  }

  PreferenceUtils get preferenceUtils => _preferenceUtils;

  T get view => _view;
}