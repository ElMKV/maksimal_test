import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maksimal_test/core/constants/strings.dart';
import 'package:maksimal_test/features/home/data/models/users.dart';
import 'package:maksimal_test/features/home/presentation/bloc/search_bloc.dart';
import 'package:maksimal_test/injection_container.dart';

class UserCard extends StatelessWidget {
  final Items user;

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchBloc>()..add(GetFollowersUser(user.login)),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () => _onTapUserCard(context, user),
            child: Card(
              elevation: 5,
              color: Colors.black,
              child: SizedBox(
                height: 100,
                child: Center(
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(38.0),
                      child: user.avatarUrl != '' ? Image.network(
                        user.avatarUrl,
                        fit: BoxFit.fill,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                                : null,
                          );
                        },
                      ) : FlutterLogo(),
                    ),
                    title: Text(user.login, overflow: TextOverflow.fade,),
                    trailing: Text(state is SearchError ? state.pageState.fError : '${S.followers} ${state.pageState.fCount}'),

                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onTapUserCard(BuildContext context, Items user) {
    Navigator.pushNamed(context, '/userDetail', arguments: user);

  }
}
