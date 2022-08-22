import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  Widget build(context) {
    final bloc = Provider.of(context);

    return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            emailField(bloc),
            passwordField(bloc),
            Container(margin: const EdgeInsets.only(top: 25)),
            submitButton(),
          ],
        ));
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: "Email Address",
              errorText: snapshot.error?.toString(),
            ),
          );
        });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            decoration:
              InputDecoration(
                hintText: 'Password', 
                labelText: 'Password',
                errorText: snapshot.error?.toString(),
              ),
            obscureText: true,
          );
        });
  }

  Widget submitButton() {
    return ElevatedButton(
      child: const Text('Login'),
      onPressed: () {},
    );
  }
}
