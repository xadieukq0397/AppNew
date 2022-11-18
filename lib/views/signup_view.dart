import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/auth_controller.dart';
import '../routes/routes.dart';
import '../config/ui_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: GetBuilder<AuthController>(
            builder: (authController) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    return _buildLargeScreen(size, authController, theme);
                  } else {
                    return _buildSmallScreen(size, authController, theme);
                  }
                },
              );
            },
          )),
    );
  }

  /// For large screens
  Widget _buildLargeScreen(
      Size size, AuthController authController, ThemeData theme) {
    return Row(
      children: [
        SizedBox(width: size.width * 0.06),
        Expanded(
          flex: 5,
          child: _buildMainBody(size, authController, theme),
        ),
      ],
    );
  }

  /// For Small screens
  Widget _buildSmallScreen(
      Size size, AuthController authController, ThemeData theme) {
    return Center(
      child: _buildMainBody(size, authController, theme),
    );
  }

  /// Main Body
  Widget _buildMainBody(
      Size size, AuthController authController, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          size.width > 600 ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.2,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            AppLocalizations.of(context)!.signUp,
            style: kLoginTitleStyle(size),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            AppLocalizations.of(context)!.titleSignup,
            style: kLoginSubtitleStyle(size),
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                /// username
                TextFormField(
                  style: kTextFormFieldStyle(),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    hintText: AppLocalizations.of(context)!.username,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),

                  controller: nameController,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.blankUserName;
                    } else if (value.length < 4) {
                      return AppLocalizations.of(context)!.validMinCharacter;
                    } else if (value.length > 13) {
                      return AppLocalizations.of(context)!.validMaxCharacter;
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                /// Gmail
                TextFormField(
                  style: kTextFormFieldStyle(),
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_rounded),
                    hintText: AppLocalizations.of(context)!.gmail,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.blankGmail;
                    } else if (!value.endsWith('@gmail.com')) {
                      return AppLocalizations.of(context)!.validateGmail;
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                /// password
                TextFormField(
                  style: kTextFormFieldStyle(),
                  controller: passwordController,
                  obscureText: authController.isObscure,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_open),
                    suffixIcon: IconButton(
                      icon: Icon(
                        authController.isObscure
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        authController.isObscureActive();
                      },
                    ),
                    hintText: AppLocalizations.of(context)!.password,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.blankPass;
                    } else if (value.length < 7) {
                      return AppLocalizations.of(context)!.validMinCharacter;
                    } else if (value.length > 13) {
                      return AppLocalizations.of(context)!.validMaxCharacter;
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  AppLocalizations.of(context)!.decriptionSignUp,
                  style: kLoginTermsAndPrivacyStyle(size),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                /// SignUp Button
                signUpButton(theme),
                SizedBox(
                  height: size.height * 0.03,
                ),

                /// Navigate To Login Screen
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.login);
                    nameController.clear();
                    emailController.clear();
                    passwordController.clear();
                    _formKey.currentState?.reset();

                    authController.isObscure = true;
                  },
                  child: RichText(
                    text: TextSpan(
                      text: AppLocalizations.of(context)!.haveAcount,
                      style: kHaveAnAccountStyle(size),
                      children: [
                        TextSpan(
                            text: " ${AppLocalizations.of(context)!.login}",
                            style: kLoginOrSignUpTextStyle(size)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  // SignUp Button
  Widget signUpButton(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: () {
          // Validate returns true if the form is valid, or false otherwise.
          if (_formKey.currentState!.validate()) {
            // ... Navigate To your Home Page
          }
        },
        child: Text(AppLocalizations.of(context)!.signUp),
      ),
    );
  }
}
