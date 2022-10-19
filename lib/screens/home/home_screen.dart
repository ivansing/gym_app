import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/blocs/bloc.dart';
import 'package:gym_app/models/models.dart';
import 'package:gym_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocBuilder<SwipeBloc, SwipeState>(
        builder: (context, state) {
          if (state is SwipeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SwipeLoaded) {
            var userCount = state.users.length;
            return Column(
              children: [
                Expanded(
                  child: InkWell(
                    onDoubleTap: () {
                      Navigator.pushNamed(context, '/users', arguments: state.users[0]);
                    },
                    child: Draggable<User>(
                      child: UserCard(user: state.users[0]),
                      feedback: UserCard(user: state.users[0]),
                      childWhenDragging: (userCount > 1)
                          ? UserCard(user: state.users[0])
                          : Container(),
                      /* UserCard(user: state.users[0]) */
                      onDragEnd: (drag) {
                        if (drag.velocity.pixelsPerSecond.dx < 0) {
                          context
                              .read<SwipeBloc>()
                              .add(SwipeLeftEvent(user: state.users[0]));
                          print('swiped left');
                        } else {
                          context
                              .read<SwipeBloc>()
                              .add(SwipeRightEvent(user: state.users[0]));
                          print('swiped right');
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 60,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          context
                              .read<SwipeBloc>()
                              .add(SwipeLeftEvent(user: state.users[0]));
                        },
                        child: ChoiceButton(
                          width: 60,
                          height: 60,
                          size: 25,
                          hasGradient: false,
                          color: Theme.of(context).primaryColorLight,
                          icon: Icons.clear_rounded,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context
                              .read<SwipeBloc>()
                              .add(SwipeRightEvent(user: state.users[0]));
                        },
                        child: const ChoiceButton(
                          width: 80,
                          height: 80,
                          size: 30,
                          hasGradient: true,
                          color: Colors.white,
                          icon: Icons.fitness_center,
                        ),
                      ),
                      ChoiceButton(
                        width: 60,
                        height: 60,
                        size: 25,
                        hasGradient: false,
                        color: Theme.of(context).primaryColor,
                        icon: Icons.watch_later,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Column(
            children: [],
          );
        },
      ),
    );
  }
}
