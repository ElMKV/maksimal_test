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
      create: (context) => sl<SearchBloc>(),
      child: Scaffold(
        appBar: AppBar(title: Text(";smldfv")),
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return Column(
      children: [
        _buildTextField(),
        BlocConsumer<SearchBloc, SearchState>(
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
            return ListView.builder(
              shrinkWrap: true,
              itemCount: spu.items.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(spu.items[index].login),
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildTextField() {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return TextField(
          onSubmitted: (value) => _onChangeTextField(context, value),
        );
      },
    );
  }

  void _onChangeTextField(BuildContext context, String value) {
    BlocProvider.of<SearchBloc>(context).add(SearchUsers(value));
  }
}
