import 'package:animations/cool_login/cool_card.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CoolCard(
            buttonText: 'sign up',
            formFields: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Name',
                    enabledBorder: InputBorder.none),
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'Email Address',
                    enabledBorder: InputBorder.none),
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: 'Password',
                    enabledBorder: InputBorder.none),
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: 'Confirmation',
                    enabledBorder: InputBorder.none),
              )
            ],
          ),
        ]
      ),
    );
  }
}