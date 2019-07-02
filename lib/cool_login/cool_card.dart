import 'package:animations/cool_login/cool_button.dart';
import 'package:flutter/material.dart';

const kPadding = 20.0;
const kTextFieldHeight = 52.5;

class CoolCard extends StatelessWidget {
  final double _loginButtonHeight = 40;
  final String buttonText;
  final List<Widget> formFields;

  const CoolCard({@required this.buttonText, this.formFields});

  @override
  Widget build(BuildContext context) {
    final cardHeight = formFields.length * kTextFieldHeight +
        (formFields.length - 1) * _Spacer.size +
        kPadding * 2;
    final containerHeight = cardHeight + _loginButtonHeight / 2;
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35),
      height: containerHeight,
      child: Stack(
        children: <Widget>[
          _Card(
            height: cardHeight,
            formFields: formFields,
          ),
          CoolButton(
              containerHeight: cardHeight - 5, // Not sure why this -5 is needed to center button
              buttonHeight: _loginButtonHeight,
              text: buttonText)
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final double height;
  final List<Widget> formFields;

  const _Card({Key key, this.height, this.formFields}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = List<Widget>();
    for (var i = 0; i < formFields.length; i++) {
      children.add(formFields[i]);
      if (i < formFields.length - 1) children.add(const _Spacer());
    }

    return Container(
      height: height,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(kPadding),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}

class _Spacer extends StatelessWidget {
  static const double spacing = 12.0;
  static const double size = spacing * 2 + 1;

  const _Spacer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: spacing),
        Container(
          height: 1,
          color: Colors.grey,
        ),
        const SizedBox(height: spacing),
      ],
    );
  }
}
