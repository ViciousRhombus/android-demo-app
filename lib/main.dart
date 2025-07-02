import 'package:atlanta_assignment/blocs/user_bloc.dart';
import 'package:atlanta_assignment/screens/user_screen.dart';
import 'package:atlanta_assignment/services/api_service.dart';
import 'package:atlanta_assignment/services/database_service.dart';
import 'package:atlanta_assignment/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // init notifications
  NotificationService().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserBloc(ApiService(), DatabaseService())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: UserScreen(),
      ),
    );
  }
}
