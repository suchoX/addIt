import 'package:add_it/blocs/play_screen/play_bloc.dart';
import 'package:add_it/screens/home_screen.dart';
import 'package:add_it/utils/pref_utils.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'blocs/SimpleBlocDelegate.dart';
import 'blocs/home/home_bloc.dart';
import 'blocs/home/home_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PreferenceUtils.preferences = await SharedPreferences.getInstance();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<PlayBloc>(
          create: (context) => PlayBloc(),
        )
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, homeState) {
        return MaterialApp(
          title: 'Add-IT',
          theme: new ThemeData(
            primarySwatch: Colors.teal,
          ),
          home: BlocProvider(
            create: (context) => HomeBloc(),
            child: HomeScreen(),
          ),
        );
      },
    );
  }
}
