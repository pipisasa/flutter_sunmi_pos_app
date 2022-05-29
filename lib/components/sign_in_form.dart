import 'package:boomerang_pos/components/rounded_input_field.dart';
import 'package:boomerang_pos/components/text_field_container.dart';
import 'package:boomerang_pos/constants.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  final void Function(String username, String password) onSubmit;
  final void Function(String email)? onEmailChange;
  final void Function()? onEmailInputStart;
  final void Function()? onEmailInputEnd;
  final void Function()? onPasswordInputStart;
  final void Function()? onPasswordInputEnd;
  final void Function()? onFail;

  const SignInForm({
    Key? key,
    required this.onSubmit,
    this.onEmailChange,
    this.onEmailInputStart,
    this.onEmailInputEnd,
    this.onPasswordInputStart,
    this.onPasswordInputEnd,
    this.onFail,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@([a-zA-Z0-9]?\-?)+\.[a-zA-Z]+");
  String? emailError;
  String? passwordError;

  bool validate() {
    var emailVal = _emailController.text.trim();
    var passVal = _passwordController.text.trim();
    emailError = emailVal.isEmpty
        ? 'Это поле не может быть пустым'
        : !emailRegex.hasMatch(emailVal)
            ? 'Неверный формат email'
            : null;
    passwordError = passVal.isEmpty ? 'Это поле не может быть пустым' : null;
    setState(() {
      emailError = emailError;
      passwordError = passwordError;
    });
    return emailError == null && passwordError == null;
  }

  void _handleSubmit() {
    var currentState = _formKey.currentState;
    FocusScope.of(context).unfocus();
    if (currentState == null) return;

    if (currentState.validate() && validate()) {
      widget.onSubmit(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
    } else {
      widget.onFail?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          RoundedInputField(
            controller: _emailController,
            hintText: 'Имя пользователя',
            icon: Icons.person,
            error: emailError,
            onChanged: widget.onEmailChange,
            onFocus: widget.onEmailInputStart,
            onBlur: widget.onEmailInputEnd,
          ),
          RoundedInputField(
            controller: _passwordController,
            hintText: 'Пароль',
            icon: Icons.lock,
            obscureText: true,
            error: passwordError,
            onFocus: widget.onPasswordInputStart,
            onBlur: widget.onPasswordInputEnd,
          ),
          const SizedBox(height: defaultPadding / 2),
          TextFieldContainer(
            child: TextButton(
              child: Text(
                'Войти',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: darkBlue.shade500, fontWeight: FontWeight.bold),
              ),
              onPressed: _handleSubmit,
            ),
          ),
        ],
      ),
    );
  }
}
