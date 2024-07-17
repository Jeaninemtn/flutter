import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

// import '../service/widget.dart';

// form_field_validator
// https://pub.dev/packages/form_field_validator/versions/1.1.0

// login
// https://www.geeksforgeeks.org/how-to-build-a-simple-login-app-with-flutter/

// form
// https://docs.flutter.dev/cookbook/forms/validation

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login",
              style: TextStyle(fontWeight: FontWeight.bold)),
          // centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: LoginForm(),
        ));
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  // TextEditingController
  // A controller for an editable text field.
  // https://api.flutter.dev/flutter/widgets/TextEditingController-class.html

  // Input
  final _serverController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // bool _visiblePassword = false;
  bool _rememberEmail = false;
  bool _autoLogin = false;

  final ipAddressValidator = MultiValidator([
    RequiredValidator(errorText: "This information is required"),
  ]);

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: "Email information is required"),
    EmailValidator(errorText: "Enter a valid email address")
  ]);

  @override
  void initState() {
    super.initState();
    _serverController.addListener(() {
      final String serverText = _serverController.text;
      _serverController.value = _serverController.value.copyWith(
        text: serverText,
        selection: TextSelection(
            baseOffset: serverText.length, extentOffset: serverText.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _serverController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // dispose
  // https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _serverController,
            decoration: const InputDecoration(labelText: "Server Name/IP"),
            validator: (value) => ipAddressValidator.call(value),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Email",
              // hintText: "Please Enter Your Email"
            ),
            validator: (value) => emailValidator.call(value),
          ),
          const SizedBox(height: 16),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(labelText: "Password"),
            validator: (value) =>
                RequiredValidator(errorText: "Password is required")
                    .call(value),
          ),
          const SizedBox(height: 16),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading, // 調整checkbox位置
            title: const Text("Remeber me"),
            value: _rememberEmail,
            onChanged: (bool? value) {
              setState(() {
                _rememberEmail = value!;
              });
            },
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading, // 調整checkbox位置
            title: const Text("Auto log in when APP starts"),
            value: _autoLogin,
            onChanged: (bool? value) {  // 回傳的value是一個允許為空的布林值
              setState(() {
                _autoLogin = value!;  // 可是在這function裡一定不會是null(強制轉為布林型態)
                // https://dart.dev/null-safety/understanding-null-safety
              });
            },
          ),
          FilledButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              } else {
                Navigator.pushNamed(context, '/home');
              }
            },
            child: const Text("Log In"),
          ),
        ],
      ),
    );
  }
}

// CheckboxListTile
// https://api.flutter.dev/flutter/material/CheckboxListTile-class.html
// Checkbox Position
// https://api.flutter.dev/flutter/material/ListTileControlAffinity.html
