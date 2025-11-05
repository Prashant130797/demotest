import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_main/Alluser_api_call_bloc.dart/Alluser_Event.dart';
import 'package:flutter_bloc_main/Alluser_api_call_bloc.dart/Alluser_State.dart';
import 'package:flutter_bloc_main/Alluser_api_call_bloc.dart/Alluser_bloc.dart';
import 'package:flutter_bloc_main/Api_user_call_bloc/Api_Usercall_bloc.dart';
import 'package:flutter_bloc_main/Api_user_call_bloc/Api_Usercall_event.dart';
import 'package:flutter_bloc_main/Api_user_call_bloc/Api_Usercall_state.dart';
import 'package:flutter_bloc_main/Counter_Bloc/counter_bloc.dart';
import 'package:flutter_bloc_main/Counter_Bloc/counter_event.dart';
import 'package:flutter_bloc_main/Counter_Bloc/counter_state.dart';

class LearnEquatable extends StatelessWidget {
  Color? color;
  LearnEquatable(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ApiUsercallBloc>().add(
      FetchUserData(
        urlBasic: "/posts",
        formData: FormData.fromMap({
          "userId": 11,
          "id": 101,
          "title": "mera bharat mahan",
          "body":
              "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla",
        }),
      ),
    );
    return BlocListener<ApiUsercallBloc, ApiUsercallState>(
      listener: (context, state) {
        print("inbuildddded ===> $state");
        if (state is UserDataLoaded) {
          Future.delayed(Duration(seconds: 5),() {
             context.read<AlluserBloc>().add(
            FetchAllUserData(urlBasic: "/posts/1/comments"),
            
          );
          },);
         
        }
        // TODO: implement listener
      },
      child: Scaffold(
        backgroundColor: color,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            User usr = User(name: "Prashant", age: 28);
            User usr1 = User(name: "Prashant", age: 28);
            print("the has of usr is  ${usr.hashCode.toString()}");
            print("the has of usr1 is ${usr1.hashCode.toString()}");

            debugPrint("the instance ${usr == usr1}");
          },
          child: Icon(Icons.print),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ApiUsercallBloc, ApiUsercallState>(
              builder: (context, state) {
                if (state is UserDataLoaded) {
                  return Text(state.list[0].toString());
                }
                return Text("-");
                // return RefreshIndicator(child: child, onRefresh: onRefresh)
              },
            ),
            SizedBox(height: 20),
            BlocBuilder<AlluserBloc, AlluserState>(
              builder: (context, state) {
                if(state is AlluserLoaded){
                     return Text(state.response[0].toString(), style: TextStyle(fontSize: 20));
                }else{
                    return Text("NOT FETCHED");
                }
              
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<CounterBloc>().add(DecrementCounter());
                  },
                  child: Container(
                    color: Colors.amber,
                    child: Center(child: Text("Remove")),
                    height: 40,
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    context.read<CounterBloc>().add(IncrementCounter());
                  },
                  child: Container(
                    color: Colors.blue,
                    child: Center(child: Text("ADD")),
                    height: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future getString() async {
  return Future.delayed(Duration(seconds: 4), () {
    print("the string is string");
  });
}

class User extends Equatable {
  String? name;
  int? age;
  User({required this.name, required this.age});

  @override
  // TODO: implement props
  List<Object?> get props => [name, age];
}
