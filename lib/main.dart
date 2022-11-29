import 'package:flutter/material.dart';
import 'package:recruitment_transisi_azizalfauzi/cubit/api/create_user/create_user_cubit.dart';
import 'package:recruitment_transisi_azizalfauzi/cubit/api/get_user/get_user_cubit.dart';
import 'package:recruitment_transisi_azizalfauzi/cubit/api/list_user/list_user_cubit.dart';
import 'package:recruitment_transisi_azizalfauzi/cubit/api/login_cubit/login_cubit.dart';
import 'package:recruitment_transisi_azizalfauzi/views/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/routes/routes_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RoutesCubit(),
        ),
        BlocProvider(
          create: (_) => LoginCubit(),
        ),
        BlocProvider(
          create: (_) => GetUserCubit(),
        ),
        BlocProvider(
          create: (_) => ListUserCubit(),
        ),
        BlocProvider(
          create: (_) => CreateUserCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WrapperPage(),
      ),
    );
  }
}
