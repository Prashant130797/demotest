import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_main/Alluser_api_call_bloc.dart/Alluser_bloc.dart';
import 'package:flutter_bloc_main/Api_user_call_bloc/Api_Usercall_bloc.dart';
import 'package:flutter_bloc_main/Counter_Bloc/counter_bloc.dart';
import 'package:flutter_bloc_main/UI_View/Counter_UI.dart';
import 'package:flutter_bloc_main/ommon_loader_bloc.dart/cmn_loader_bloc.dart';

void main() {
  //sdad
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoaderBloc()),
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(
          create:
              (context) => AlluserBloc(BlocProvider.of<LoaderBloc>(context)),
        ),
        BlocProvider(
          create:
              (context) =>
                  ApiUsercallBloc(BlocProvider.of<LoaderBloc>(context)),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocListener<LoaderBloc, LoaderState>(
        listener: (context, state) {
          if (state.isLoading) {
            print("the loader state is ${state.isLoading}");
            // show loader
            showDialog(
              barrierColor: Colors.green,
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          } else {
            // hide loader
            if (Navigator.canPop(context)) Navigator.pop(context);
          }
        },
        child: LearnEquatable(Colors.red),
      ),
    );
  }
}
