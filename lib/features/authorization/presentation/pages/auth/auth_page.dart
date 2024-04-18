import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maksimal_test/core/constants/strings.dart';
import 'package:maksimal_test/features/authorization/presentation/bloc/auth/remote/auth_bloc.dart';
import 'package:maksimal_test/features/authorization/presentation/widgets/custom_button.dart';
import 'package:maksimal_test/injection_container.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController controller = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    controllerPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => sl(),
      child: Scaffold(
        body: _buildBody(context),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.pageState.errMsg)));
        } else if (state is AuthNav) {
          _openHomePage(context);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.only(top: 23.0, left: 18, right: 18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Center(child: Image.asset("assets/logo.png")),
                SizedBox(
                  height: 20,
                ),
                const Text(
                  S.auth,
                  style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  S.toooltips,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(
                  height: 31,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hoverColor: Colors.black,
                      border: const OutlineInputBorder(),
                      hintText: S.login_edit_text,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: controllerPass,
                    obscureText: true,
                    decoration: InputDecoration(
                      hoverColor: Colors.black,
                      border: const OutlineInputBorder(),
                      hintText: S.password_edit_text,
                    ),
                  ),
                ),
                CheckboxListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                  controlAffinity: ListTileControlAffinity
                      .leading,
                  checkColor: Colors.white,
                  activeColor: Colors.orange,
                  side:
                  BorderSide(width: 2, color: Colors.orange),
                  value: true,
                  onChanged: (value) {
                    setState(() {

                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: CustomButton(
                      onTap: () => _onEnterButtonPressed(context),
                      text: S.enter,
                      bold: true,
                      width: 380,
                      height: 50,
                      fontSize: 16,
                    )),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: CustomButton(
                      onTap: () => _onRegistrateButtonPressed(context),
                      text: S.registration,
                      bold: true,
                      width: 380,
                      height: 50,
                      fontSize: 16,
                    )),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _onEnterButtonPressed(BuildContext context) {
    context.read<AuthBloc>().add(GetAuth(
        login: controller.value.text,
        pass: controllerPass.value.text));

  }
  _onRegistrateButtonPressed(BuildContext context) {
    Navigator.pushNamed(context, '/registarte');
  }

   _openHomePage(BuildContext context) {
     Navigator.pushNamed(context, '/home');
  }
}
