import 'package:add_it/utils/pref_utils.dart';

class Injector {

  static final Injector injector = new Injector._injector();
   PreferenceUtils _preferenceUtils;

  Injector._injector(){
    _preferenceUtils = new PreferenceUtils();
  }

  factory Injector() {
    return injector;
  }

  PreferenceUtils get preferenceUtils => _preferenceUtils;

}