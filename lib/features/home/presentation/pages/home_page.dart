import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maksimal_test/features/home/presentation/bloc/search_bloc.dart';
import 'package:maksimal_test/injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchBloc>()..add(SearchUsers('value')),
      child: Scaffold(
        appBar: AppBar(title: Text("CardsHive")),
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (_, state) {
        if (state is SearchLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is SearchError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is SearchDone) {
          return Text('Констурктор в разработке');
        }
        return SizedBox();
      },
    );
  }
}

