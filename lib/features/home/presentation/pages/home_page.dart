import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('ewfv'),
    );
    // return BlocProvider(
    //   create: (context) => ConstructorBloc(),
    //   child: Scaffold(
    //     appBar: AppBar(title: Text("CardsHive")),
    //     body: _buildBody(),
    //   ),
    // );
  }

  // _buildBody() {
  //   return BlocBuilder<ConstructorBloc, ConstructorState>(
  //     builder: (_, state) {
  //       // if (state is ConstructorLoading) {
  //       //   return const Center(child: CupertinoActivityIndicator());
  //       // }
  //       // if (state is ConstructorError) {
  //       //   return const Center(child: Icon(Icons.refresh));
  //       // }
  //       // if (state is ConstructorDone) {
  //       //   return Text('Констурктор в разработке');
  //       // }
  //       return InAppWebView(
  //         onReceivedHttpAuthRequest: (InAppWebViewController controller, URLAuthenticationChallenge challenge) async {
  //           return HttpAuthResponse(username: "admin", password: "11111111", action: HttpAuthResponseAction.PROCEED);
  //         },
  //           initialUrlRequest:
  //       URLRequest(url: WebUri("http://194.32.248.155")),
  //       );
  //     },
  //   );
  // }

}

