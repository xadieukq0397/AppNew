import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/ui_constants.dart';
import '../controller/auth_controller.dart';
import '../routes/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  AuthController loginController = Get.find<AuthController>();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                  return _buildLargeScreen(size, authController);
                } else {
                  return _buildSmallScreen(size, authController);
                }
              },
            );
          },
        ),
      ),
    );
  }

  /// For large screens
  Widget _buildLargeScreen(
    Size size,
    AuthController authController,
  ) {
    return Row(
      children: [
        SizedBox(width: size.width * 0.2),
        Expanded(
          flex: 5,
          child: _buildMainBody(
            size,
            authController,
          ),
        ),
      ],
    );
  }

  /// For Small screens
  Widget _buildSmallScreen(
    Size size,
    AuthController authController,
  ) {
    return Center(
      child: _buildMainBody(
        size,
        authController,
      ),
    );
  }

  /// Main Body
  Widget _buildMainBody(
    Size size,
    AuthController authController,
  ) {
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
            AppLocalizations.of(context)!.login,
            style: kLoginTitleStyle(size),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            AppLocalizations.of(context)!.welcome("Catchy"),
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
                /// username or Gmail
                TextFormField(
                  style: kTextFormFieldStyle(),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    hintText: AppLocalizations.of(context)!.username_or_gmail,
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
                  AppLocalizations.of(context)!.decriptionLogin,
                  style: kLoginTermsAndPrivacyStyle(size),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                /// Login Button
                loginButton(),
                SizedBox(
                  height: size.height * 0.03,
                ),

                /// Navigate To Login Screen
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.signUp);
                    nameController.clear();
                    passwordController.clear();
                    _formKey.currentState?.reset();
                    authController.isObscure = true;
                  },
                  child: RichText(
                    text: TextSpan(
                      text: AppLocalizations.of(context)!.noAcount,
                      style: kHaveAnAccountStyle(size),
                      children: [
                        TextSpan(
                          text: " ${AppLocalizations.of(context)!.signUp}",
                          style: kLoginOrSignUpTextStyle(
                            size,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Login Button
  Widget loginButton() {
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
        onPressed: () async {
          // Validate returns true if the form is valid, or false otherwise.
          // if (_formKey.currentState!.validate()) {
          //   String userName = nameController.text.trim();
          //   String password = passwordController.text.trim();

          //   print("Before encode: " + password);
          //   print("Before encode: " + userName);

          //   String passwordEncode = loginController.generateMd5(password);
          //   String userNameEnCode = loginController.generateMd5(userName);

          //   print("After encode: " + passwordEncode);
          //   print("After encode: " + userNameEnCode);
          Get.offAllNamed(Routes.getControlViewPage());
        },
        // },
        // },
        child: Text(AppLocalizations.of(context)!.login),
      ),
    );
  }
}
