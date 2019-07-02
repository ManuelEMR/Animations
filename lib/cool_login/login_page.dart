import 'package:animations/cool_login/cool_card.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CoolCard(
            buttonText: 'login',
            formFields: <Widget>[
              TextFormField(
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
              )
            ],
          ),
          const SizedBox(height: 15),
          Text(
            'Forgot password?',
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(height: 15),
          _Or(),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _CircularButton(text: 'f'),
              const SizedBox(width: 50),
              _CircularButton(text: 'G'),
            ],
          )
        ],
      ),
    );
  }
}

class _CircularButton extends StatelessWidget {
  final String text;

  const _CircularButton({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.white),
      child: FlatButton(
        onPressed: () => print(text.toUpperCase()),
        child: Text(
          text,
          style: TextStyle(fontSize: 28, color: Colors.blue),
        ),
      ),
    );
  }
}

class _Or extends StatelessWidget {
  const _Or({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1,
          width: 70,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.white10,
            Colors.white,
          ])),
        ),
        const SizedBox(width: 15),
        Text(
          'Or',
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(width: 15),
        Container(
          height: 1,
          width: 70,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.white,
            Colors.white10,
          ])),
        )
      ],
    );
  }
}
