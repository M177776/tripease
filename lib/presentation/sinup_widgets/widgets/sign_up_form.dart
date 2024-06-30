import 'sign_up_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:final_project/base/validators.dart';
import 'package:final_project/presentation/onboarding/model/app_defaults.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

//!required do validation to this page
class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        //?want to change
        boxShadow: AppDefaults.boxShadow,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Name",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),

          const SizedBox(height: 8),

          TextFormField(
            controller: _nameController,
            validator: Validators.requiredWithFieldName('Name'),
            textInputAction: TextInputAction.next,
          ),

          const SizedBox(height: 15),

          const Text(
            "Email",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _emailController,
            textInputAction: TextInputAction.next,
            validator: Validators.required,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 10),
          const Text(
            "Password",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _passwordController,
            validator: Validators.required,
            textInputAction: TextInputAction.next,
            obscureText: true,
            decoration: InputDecoration(
              suffixIcon: Material(
                color: Colors.transparent,
                child: Icon(
                  Icons.visibility,
                  size: 25,
                ),
              ),
            ),
          ),

          const SizedBox(height: AppDefaults.padding),
          SignUpButton(
            nameController: _nameController,
            emailController: _emailController,
            passwordController: _passwordController,
          ),
          //const AlreadyHaveAnAccount(),
          const SizedBox(height: AppDefaults.padding),
        ],
      ),
    );
  }
}
