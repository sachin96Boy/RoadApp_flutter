import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();

  bool _obsecuredText = true;
  String _email, _password;

  Widget _showTitle() {
    return Text(
      'Login',
      style: Theme.of(context).textTheme.headline1,
    );
  }

  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextFormField(
        onSaved: (val) => _email = val,
        validator: (value) => !value.contains('@') ? 'invalid Email' : null,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email',
            hintText: 'Enter a valid email',
            icon: Icon(
              Icons.mail,
              color: Colors.grey,
            )),
      ),
    );
  }

  Widget _showInputPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextFormField(
        onSaved: (val) => _password = val,
        validator: (value) => value.length < 6.0 ? 'Password too short' : null,
        obscureText: _obsecuredText, //decyper password so no one read it
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
              child: Icon(
                  _obsecuredText ? Icons.visibility : Icons.visibility_off),
              onTap: () {
                setState(() {
                  _obsecuredText = !_obsecuredText;
                });
              },
            ),
            border: OutlineInputBorder(),
            labelText: 'Password',
            hintText: 'Enter Password, min length 6',
            icon: Icon(
              Icons.lock,
              color: Colors.grey,
            )),
      ),
    );
  }

  Widget _showformActions() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text(
              'Submit',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: Colors.black),
            ),
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            color: Theme.of(context).accentColor,
            onPressed: _submit,
          ),
          FlatButton(
            child: Text(
              'new user? Register',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            onPressed: () => Navigator.of(context).pushReplacementNamed('/'),
          )
        ],
      ),
    );
  }

  void _submit() {
    final _form = _formKey.currentState;

    if (_form.validate()) {
      _form.save();
      print('Email: $_email, password: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  _showTitle(),
                  _showEmailInput(),
                  _showInputPassword(),
                  _showformActions()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
