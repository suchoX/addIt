
import 'package:add_it/Injector.dart';
import 'package:add_it/utils/pref_utils.dart';

abstract class BaseBloc {
  Injector _injector;
  PreferenceUtils _preferenceUtils;

  BaseBloc() {
    _injector = Injector();
    _preferenceUtils = _injector.preferenceUtils;
  }

  PreferenceUtils get preferenceUtils => _preferenceUtils;

}