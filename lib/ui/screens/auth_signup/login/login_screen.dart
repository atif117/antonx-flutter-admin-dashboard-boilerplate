import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_text_field.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/auth_signup/login/login_view_model.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/main_screen/main_screen.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                width: 350,
                                child: CustomTextField(
                                  onTap: () {},
                                  validator: (val) {
                                    if (!val.toString().trim().isEmail) {
                                      return 'Please Enter a Valid Email';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (val) {
                                    model.loginBody.email = val;
                                  },
                                  hintText: "Enter email adress",
                                  prefixIcon:
                                      const Icon(Icons.mail_outline_rounded),
                                ),
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: 350,
                                child: CustomTextField(
                                  obscure: model.passwordVisibility,
                                  validator: (val) {
                                    if (val.length < 1) {
                                      return 'Please enter your password';
                                    } else if (val.length < 8) {
                                      return 'Password must include 8 characters';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onTap: () {},
                                  onSaved: (val) {},
                                  hintText: "Password",
                                  suffixIcon: const Icon(Icons.visibility_off),
                                  prefixIcon: const Icon(Icons.lock_outline),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              Get.to(
                                MainScreen(),
                              );
                            }
                          },
                          child: SizedBox(
                            width: 350,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(14)),
                                    child: const Center(
                                      child: Text(
                                        'Sign in',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
