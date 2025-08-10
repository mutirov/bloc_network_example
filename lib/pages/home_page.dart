import 'package:bloc_network_example/bloc/user_block.dart';
import 'package:bloc_network_example/cubit/internet_cubit.dart';
import 'package:bloc_network_example/services/user_repository.dart';
import 'package:bloc_network_example/widgets/action_buttons.dart';
import 'package:bloc_network_example/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: MultiBlocProvider(
        providers: [
           BlocProvider(
            create: (context)=> UserBlock(userRepository: context.read<UserRepository>()),
            //  ..add(UserLoadEvent()),
            ),
            BlocProvider(create: (context) => ConnectionCubit()),
        ],
         child: Scaffold(
          appBar: AppBar(title: 
          BlocBuilder<ConnectionCubit, MyConnectionState>(
            builder: (context, state) => state.connected ? Text('User List (online)'): Text('No connetction'),
            ),
          ),
          body: Column(
            children: [
              ActionButtons(),
              Expanded(child: UserList()),
            ],
          ),
         ),
        ),
      );
  }
}

  /*
RepositoryProvider(
      create: (context) => UserRepository(),
      child: BlocProvider(
        create: (context) =>
            UserBlock(userRepository: context.read<UserRepository>()),
            //  ..add(UserLoadEvent()),
        child: Scaffold(
          appBar: AppBar(title: Text('User List')),
          body: Column(
            children: [
              ActionButtons(),
              Expanded(child: UserList()),
            ],
          ),
        ),
      ),
    );
  */

    // BlocProvider(
    //   create: (context) => UserBlock(userRepository: userRepository),
    //   child: Scaffold(
    //     appBar: AppBar(title: Text('User List')),
    //     body: Column(
    //       children: [
    //         ActionButtons(),
    //         Expanded(child: UserList()),
    //       ],
    //     ),
    //   ),
    // );