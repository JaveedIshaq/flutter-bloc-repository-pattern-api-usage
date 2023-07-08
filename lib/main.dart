import 'package:blocwithapi/crews/bloc/crews_bloc.dart';
import 'package:blocwithapi/crews/data/crew_repository.dart';
import 'package:blocwithapi/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CrewRepository>(
          create: ((context) => CrewRepository()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CrewsBloc>(
            create: (context) => CrewsBloc(
              repository: context.read<CrewRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'SpaceXApp',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              brightness: Brightness.dark,
              secondary: Colors.white,
            ),
            primaryColor: Colors.black,
            scaffoldBackgroundColor: Colors.black,
            dividerTheme: const DividerThemeData(
              indent: 16,
              space: 0,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
              ),
            ),
          ),
          home: const HomeView(),
        ),
      ),
    );
  }
}
