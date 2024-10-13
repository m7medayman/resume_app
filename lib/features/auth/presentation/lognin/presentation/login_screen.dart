import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_app/core/Di/di.dart';
import 'package:resume_app/core/common/state_renderer/pop_state_dialog_widget.dart';
import 'package:resume_app/core/common/widgets/my_inputField.dart';
import 'package:resume_app/core/common/widgets/my_text.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/core/constants/app_string_constats.dart';
import 'package:resume_app/core/constants/widget_dimensions.dart';
import 'package:resume_app/core/routing/routes_manager.dart';
import 'package:resume_app/features/auth/presentation/lognin/cubit/login_cubit.dart';
import 'package:resume_app/features/auth/presentation/lognin/cubit/login_state.dart';

class LoginScreenPresentation extends StatefulWidget {
  const LoginScreenPresentation({super.key});

  @override
  State<LoginScreenPresentation> createState() =>
      _LoginScreenPresentationState();
}

class _LoginScreenPresentationState extends State<LoginScreenPresentation> {
  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  final _emailFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();
  final loadingKey = GlobalKey();
  bool isLoadingDialog = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => LoginCubit(instance()),
      child: Scaffold(
          appBar: AppBar(title: const AppBarText(content: AppStrings.login)),
          body: BlocListener<LoginCubit, FormLoginState>(
            listener: (context, state) {
              if (state.loginState is LogInFailure) {
                LogInFailure logInFailure = state.loginState as LogInFailure;
                if (isLoadingDialog) {
                  Navigator.of(context).pop();
                  isLoadingDialog = false;
                }
                _showFailurePopUpDialog(
                    context, logInFailure.getFailureMessage);
              }
              if (state.loginState is LogInLoading) {
                isLoadingDialog = true;
                _showLoadingPopUpDialog(context);
              }
            },
            child: BlocBuilder<LoginCubit, FormLoginState>(
              builder: (context, state) {
                return LoginBody(
                    screenWidth: screenWidth,
                    emailFormKey: _emailFormKey,
                    emailInput: emailInput,
                    screenHeight: height,
                    passwordFormKey: _passwordFormKey,
                    passwordInput: passwordInput);
              },
            ),
          )),
    );
  }
}

void _showLoadingPopUpDialog(context) {
  showDialog(
      context: context,
      builder: (_) {
        return LoadingDialog();
      });
}

void _showFailurePopUpDialog(context, String content) {
  showDialog(
      context: context,
      builder: (_) {
        return ErrorPopUpDialog(
          content: content,
          context: context,
        );
      });
}

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
    required this.screenWidth,
    required GlobalKey<FormState> emailFormKey,
    required this.emailInput,
    required this.screenHeight,
    required GlobalKey<FormState> passwordFormKey,
    required this.passwordInput,
  })  : _emailFormKey = emailFormKey,
        _passwordFormKey = passwordFormKey;

  final double screenWidth;
  final GlobalKey<FormState> _emailFormKey;
  final TextEditingController emailInput;
  final double screenHeight;
  final GlobalKey<FormState> _passwordFormKey;
  final TextEditingController passwordInput;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: screenWidth * WidgetDimensions.percent90,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // email input field
                SizedBox(
                    child: EmailInputFiled(
                        fieldFormKey: _emailFormKey, fieldInput: emailInput)),
                FormSeparator(screenHeight: screenHeight),
                //password input field
                SizedBox(
                    child: PasswordInputFiled(
                  FormKey: _passwordFormKey,
                  inputController: passwordInput,
                  label: AppStrings.password,
                )),
                FormSeparator(screenHeight: screenHeight),
                ElevatedButton(
                    onPressed: () {
                      bool passwordCheck =
                          _passwordFormKey.currentState!.validate();
                      bool emailCheck = _emailFormKey.currentState!.validate();
                      if (passwordCheck && emailCheck) {
                        LoginCubit loginCubit = context.read<LoginCubit>();
                        loginCubit.updateEmail(emailInput.text.trim());
                        loginCubit.updatePassword(passwordInput.text.trim());
                        loginCubit.login();
                      }
                    },
                    child: const Text(AppStrings.login)),
                FormSeparator(screenHeight: screenHeight),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.signUP);
                    },
                    child: const Text(AppStrings.createNewUser))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
