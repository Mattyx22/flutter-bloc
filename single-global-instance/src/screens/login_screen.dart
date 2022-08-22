import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  Widget build(context) {
    return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: const EdgeInsets.only(top: 25)),
            submitButton(),
          ],
        ));
  }

  Widget emailField() {
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

  Widget passwordField() {
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
      child: Text('Login'),
      onPressed: () {},
    );
  }
}
