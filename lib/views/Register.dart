import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_balance/widgets/AppTitle.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

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
                    height: 90,
                  ),
                  AppTitle(),
                  RegisterForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();

  bool isObscure = true;
  bool isObscure2 = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _nameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: "Nome",
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Nome não pode ser vazio.";
              }
              return null;
            },
          ),
          SizedBox(
            height: 15,
          ),
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
              if (_passwordConfirmationController.text !=
                  _passwordController.text) {
                return "Senha e confirmação de senha não conferem!";
              }
              return null;
            },
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: _passwordConfirmationController,
            keyboardType: TextInputType.text,
            obscureText: isObscure2,
            decoration: InputDecoration(
                labelText: "Confirme a senha",
                suffixIcon: IconButton(
                  icon: Icon(
                      isObscure2 ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      isObscure2 = !isObscure2;
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
              if (_passwordConfirmationController.text !=
                  _passwordController.text) {
                return "Senha e confirmação de senha não conferem!";
              }
              return null;
            },
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 46,
            child: ElevatedButton(
              onPressed: () {
                SystemChannels.textInput.invokeMethod('TextInput.hide');
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/login', (Route<dynamic> route) => false);
                }
              },
              child: Text(
                "Cadastrar",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login', (Route<dynamic> route) => false);
            },
            child: Text(
              "Já tem uma conta? Entre agora!",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
