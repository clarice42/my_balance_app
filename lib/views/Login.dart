import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 25,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 160,
                  ),
                  Text(
                    "MeuBalanço",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(
                    height: 37,
                  ),
                  LoginForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isObscure = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "E-mail",
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "E-mail não pode ser vazio.";
              }
              if (!EmailValidator.validate(value)) {
                return "E-mail inválido.";
              }
              return null;
            },
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: _passwordController,
            keyboardType: TextInputType.text,
            obscureText: isObscure,
            decoration: InputDecoration(
                labelText: "Senha",
                suffixIcon: IconButton(
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                )),
            validator: (value) {
              if (value!.isEmpty) {
                return "Senha não pode ser vazia.";
              }
              if (value.length < 8 || value.length > 32) {
                return "A senha deve ter entre 8 e 32 caracteres.";
              }
              return null;
            },
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 46,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () async {
                try {
                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                  setState(() {
                    loading = true;
                  });
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/', (Route<dynamic> route) => false);
                  }
                  if (!mounted) return;
                  setState(() {
                    loading = false;
                  });
                } catch (e) {
                  setState(() {
                    loading = false;
                  });
                }
              },
              child: loading
                  ? SpinKitRing(
                      lineWidth: 4,
                      color: Theme.of(context).primaryColor,
                      size: 25,
                    )
                  : Text(
                      "Entrar",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
