import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maksimal_test/core/constants/strings.dart';
import 'package:maksimal_test/features/home/presentation/bloc/search_bloc.dart';
import 'package:maksimal_test/features/home/presentation/widgets/user_card.dart';
import 'package:maksimal_test/features/user_detail/presentation/bloc/user_bloc.dart';
import 'package:maksimal_test/injection_container.dart';

import '../../../home/data/models/users.dart';

class UserDetailPage extends StatelessWidget {
  final Items user;

  const UserDetailPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserBloc>()..add(GetDetailUser(user.login)),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.pageState.error)));
        }
      },
      builder: (context, state) {
        final spr = state.pageState.repos;
        if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: spr.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(spr[index].name);
          },
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('${S.user_detail_title} ${user.login}'),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(38.0),
          child: Image.network(
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
          ),
        ),
      ),
    );
  }
}
