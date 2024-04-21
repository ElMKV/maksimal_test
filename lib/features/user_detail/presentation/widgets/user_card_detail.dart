import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:maksimal_test/features/user_detail/data/models/repo.dart';

class UserCardDetail extends StatelessWidget {
  final Repo repo;

  const UserCardDetail({Key? key, required this.repo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.black,
      child: SizedBox(
        height: 100,
        child: Center(
          child: ListTile(
            title: RichText(
              text: TextSpan(
                text: '${repo.name}, ',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(text: repo.language, style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            subtitle: Text(repo.description),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(DateFormat('MM-dd – kk:mm').format(repo.updatedAt!)),
                Text(repo.defaultBranch, style: TextStyle(color: Colors.blue),),
                Text(repo.forks.toString()),
              ],
            ),

          ),
        ),
      ),
    );
  }

  void _onTapUserCard() {

  }
}
