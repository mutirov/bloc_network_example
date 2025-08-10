import 'package:bloc_network_example/bloc/user_block.dart';
import 'package:bloc_network_example/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocProvider ile bloc'a erisim sagliyoruz
    //final UserBlock _userBloc = BlocProvider.of<UserBlock>(context, listen: false);
    final UserBlock _userBloc = context.read<UserBlock>();
      // final UserBlock _userBloc = BlocProvider.of<UserBlock>(context, listen: true);
   // final UserBlock _userBloc = context.watch<UserBlock>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            _userBloc.add(UserLoadEvent());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // arka plan rengi
            foregroundColor: Colors.black87, // yazi rengi
          ),
          child: Text('Load'),
        ),
        SizedBox(width: 16),
        ElevatedButton(
          onPressed: () {
            _userBloc.add(UserClearEvent());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.black87,
          ),
          child: Text('Clear'),
        ),
      ],
    );
  }
}
