import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  bool _obsecureText = true;
  String _userName, _email, _password;

  Widget _showTitle() {
    return Text(
      'Register',
      style: Theme.of(context).textTheme.headline1,
    );
  }

  Widget _showUserNameInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextFormField(
        onSaved: (val) => _userName = val,
        validator: (value) => value.length < 6.0 ? 'Username too short' : null,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Username',
            hintText: 'Enter username, min length 6',
            icon: Icon(
              Icons.face,
              color: Colors.grey,
            )),
      ),
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
        obscureText: _obsecureText, //decyper password so no one read it
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
              child:
                  Icon(_obsecureText ? Icons.visibility : Icons.visibility_off),
              onTap: () {
                setState(() {
                  _obsecureText = !_obsecureText;
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
            //initiate the raised button to press for login
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
            color: Theme.of(context).primaryColor,
            onPressed: _submit,
          ),
          FlatButton(
            //initiate a flatbutton to navigate to registerpage
            child: Text(
              'Existing user? log In',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            onPressed: () =>
                Navigator.of(context).pushReplacementNamed('/login'),
          )
        ],
      ),
    );
  }

  void _submit() {
    final _form = _formKey.currentState;

    if (_form.validate()) {
      _form.save();
      print('username: $_userName, Email: $_email, password: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
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
                  _showUserNameInput(),
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
