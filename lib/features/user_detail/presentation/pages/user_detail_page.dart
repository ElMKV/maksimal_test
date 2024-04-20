import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maksimal_test/core/constants/strings.dart';
import 'package:maksimal_test/features/home/presentation/bloc/search_bloc.dart';
import 'package:maksimal_test/features/home/presentation/widgets/user_card.dart';
import 'package:maksimal_test/injection_container.dart';

import '../../../home/data/models/users.dart';

class UserDetailPage extends StatelessWidget {
  final Items user;
  const UserDetailPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchBloc>(),
      child: Scaffold(
        appBar: AppBar(title: Text('${S.user_detail_title} ${user.login}')),
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {
        if (state is SearchError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.pageState.error)));
        }
      },
      builder: (context, state) {
        final spu = state.pageState.users;
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
          children: [
            ClipRRect(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
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
            Text(user.followersUrl)
          ],
        );
      },
    );
  }
}
