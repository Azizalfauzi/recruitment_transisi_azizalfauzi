import 'package:flutter/material.dart';
import 'package:recruitment_transisi_azizalfauzi/views/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit/routes_cubit.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: const WrapperPage(),
      ),
    );
  }
}
