import 'package:code_companion_ai/app/presentation/auth/login/providers/login_provider.dart';
import 'package:code_companion_ai/app/presentation/auth/sign_up/screens/sign_up_screen.dart';
import 'package:code_companion_ai/app/styles/color.dart';
import 'package:code_companion_ai/app/styles/text_style.dart';
import 'package:code_companion_ai/app/widgets/buttons.dart';
import 'package:code_companion_ai/app/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Consumer<LoginProvider>(builder: (context, provider, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(26),
                Text(
                  "Welcome!",
                  style: AppTextStyle.black30Bold,
                ),
                Text(
                  "Sign in to continue",
                  style: AppTextStyle.black14,
                ),
                const Gap(60),
                Text(
                  "Enter your email address",
                  style: AppTextStyle.black12Bold,
                ),
                const Gap(12),
                AppTextField(
                  controller: provider.emailController,
                  hint: "e.g samshot@example.com",
                ),
                const Gap(20),
                Text(
                  "Enter your password",
                  style: AppTextStyle.black12Bold,
                ),
                const Gap(12),
                AppTextField(
                  controller: provider.passwordController,
                  hint: "",
                  isPassword: true,
                ),
                const Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot password?",
                      style: AppTextStyle.black12Bold
                          .copyWith(color: AppColor.primaryColor2),
                    ),
                  ],
                ),
                const Gap(52),
                Center(
                  child: AppButton(
                    buttonText: "Login",
                    isLoading: provider.isLoading,
                    buttonColor: AppColor.primaryColor2,
                    onPressed: () {
                      provider.login();
                    },
                  ),
                ),
                const Gap(8),
                Text(
                  "Don't have an account?",
                  style: AppTextStyle.black12Medium,
                ),
                const Gap(20),
                Center(
                  child: AppButton(
                    buttonText: "Sign up here",
                    buttonColor: AppColor.primaryColor2,
                    buttonType: ButtonType.outlined,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
