import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_app/core/common/state_renderer/pop_state_dialog_widget.dart';
import 'package:resume_app/core/common/widgets/course_certification_input.dart';
import 'package:resume_app/core/common/widgets/course_view_widget.dart';
import 'package:resume_app/core/common/widgets/degree_view_widget.dart';
import 'package:resume_app/core/common/widgets/devider_with_label.dart';

import 'package:resume_app/core/common/widgets/education_certification_input.dart';
import 'package:resume_app/core/common/widgets/hidden_button.dart';
import 'package:resume_app/core/common/widgets/my_inputField.dart';
import 'package:resume_app/core/common/widgets/reveal_widget.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/core/constants/app_sizes_constants.dart';
import 'package:resume_app/core/constants/app_string_constats.dart';
import 'package:resume_app/core/constants/widget_dimensions.dart';
import 'package:resume_app/core/data_classes/data_classes.dart';
import 'package:resume_app/core/resources/helpers/input_fields.dart';
import 'package:resume_app/core/routing/routes_manager.dart';
import 'package:resume_app/core/theme_manager/color_manager.dart';
import 'package:resume_app/features/auth/presentation/signup/cubit/signup_cubit.dart';
import 'package:resume_app/features/auth/presentation/signup/cubit/signup_form_state.dart';

class SignUpPresentation extends StatefulWidget {
  const SignUpPresentation({super.key});

  @override
  State<SignUpPresentation> createState() => _SignUpPresentationState();
}

class _SignUpPresentationState extends State<SignUpPresentation> {
  GlobalKey<FormState> emailRegisterFormkey = GlobalKey();
  GlobalKey<FormState> passwordFormkey = GlobalKey();
  GlobalKey<FormState> userNameFormkey = GlobalKey();
  GlobalKey<FormState> phoneFormkey = GlobalKey();
  GlobalKey<FormState> contactEmailFormkey = GlobalKey();
  GlobalKey<FormState> addressFormKey = GlobalKey();
  TextEditingController emailRegisterController = TextEditingController();
  GlobalKey<FormState> reeEnterPasswordFormKey = GlobalKey();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reEnterpasswordController = TextEditingController();
  TextEditingController userNameContrller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressContrller = TextEditingController();
  TextEditingController contactEmailFormController = TextEditingController();
  TextEditingController locationFormController = TextEditingController();
  TextEditingController countryInputController = TextEditingController();
  TextEditingController stateInputController = TextEditingController();
  TextEditingController cityInputController = TextEditingController();
  GlobalKey<FormState> locationFormKey = GlobalKey();
  GlobalKey<FormState> extraPhoneKey = GlobalKey();
  TextEditingController extraPhoneInput = TextEditingController();
  GlobalKey<FormState> linkeInKey = GlobalKey();
  TextEditingController linkeInInput = TextEditingController();
  GlobalKey<FormState> websiteKey = GlobalKey();
  TextEditingController websiteInput = TextEditingController();
  Map<String, GlobalKey<FormState>> extraFields = {};
  late double screenWidth;
  late double screenHeight;
  late List<GlobalKey<FormState>> checkPrimaryKeys;

  @override
  void initState() {
    checkPrimaryKeys = [
      emailRegisterFormkey,
      passwordFormkey,
      userNameFormkey,
      phoneFormkey,
      contactEmailFormkey,
      locationFormKey,
      reeEnterPasswordFormKey,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          AppStrings.signup,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: BlocProvider(
        create: (context) => SignupCubit(),
        child: SafeArea(
          child: Center(
            child: SizedBox(
              width: screenWidth * WidgetDimensions.percent90,
              child: SingleChildScrollView(
                child: BlocListener<SignupCubit, SighupState>(
                  listener: (context, state) {
                    if (state.signupFormState is loadingSignupFormstate) {
                      _showLoadingPopUpDialog(context);
                    }
                    if (state.signupFormState is FailureSignupFormState) {
                      Navigator.of(context).pop();
                      FailureSignupFormState formState =
                          state.signupFormState as FailureSignupFormState;
                      _showFailurePopUpDialog(context, formState.errorMessage);
                    }
                    if (state.signupFormState is SuccessSignupFormState) {
                      Navigator.of(context)
                          .pushReplacementNamed(Routes.resumeApplication);
                    }
                  },
                  child: getBody(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
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

  void _showLoadingPopUpDialog(context) {
    showDialog(
        context: context,
        builder: (_) {
          return LoadingDialog();
        });
  }

  BlocBuilder<SignupCubit, SighupState> getBody() {
    return BlocBuilder<SignupCubit, SighupState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // email input
            EmailInputFiled(
                fieldFormKey: emailRegisterFormkey,
                fieldInput: emailRegisterController),
            FormSeparator(screenHeight: screenHeight),
            // password input
            PasswordInputFiled(
                FormKey: passwordFormkey,
                inputController: passwordController,
                label: AppStrings.password,
                validateMessageFunction: InputValidator.validateRegularField),
            FormSeparator(screenHeight: screenHeight),
            // reEnter password input
            ReenterPasswordInputFiled(
                passwordINputController: passwordController,
                FormKey: reeEnterPasswordFormKey,
                inputController: reEnterpasswordController,
                label: AppStrings.reEnterPassword,
                validateMessageFunction: InputValidator.validateRegularField),
            FormSeparator(screenHeight: screenHeight),
            //
            const DividerWithLabel(label: AppStrings.contactInfo),
            FormSeparator(screenHeight: screenHeight),

            // user name
            GeneralInputFiled(
              fieldFormKey: userNameFormkey,
              fieldInput: userNameContrller,
              label: AppStrings.username,
              validateMessageFunction: InputValidator.validateRegularField,
            ),
            FormSeparator(screenHeight: screenHeight),

            EmailInputFiled(
                label: AppStrings.contactEmail,
                fieldFormKey: contactEmailFormkey,
                fieldInput: contactEmailFormController),
            FormSeparator(screenHeight: screenHeight),
            PhoneInputField(
              formKey: phoneFormkey,
              fieldInputController: phoneController,
              validateMessageFunction: InputValidator.validateRegularField,
            ),
            FormSeparator(screenHeight: screenHeight),
            RevealField(
              cancelFunction: () {
                extraPhoneInput.clear();
                extraFields.remove("extraPhone");
                context.read<SignupCubit>().changeExtraPhoneFiledVisibility();
              },
              isHidden: !state.extraPhoneFlag,
              screenHeight: screenHeight,
              child: PhoneInputField(
                formKey: extraPhoneKey,
                fieldInputController: extraPhoneInput,
                validateMessageFunction: InputValidator.validateRegularField,
              ),
            ),
            RevealField(
                cancelFunction: () {
                  linkeInInput.clear();
                  extraFields.remove("linkedIn");
                  context.read<SignupCubit>().changeLinkedInFiledVisibility();
                },
                isHidden: !state.linkedInFlag,
                child: GeneralInputFiled(
                    fieldFormKey: linkeInKey,
                    fieldInput: linkeInInput,
                    label: AppStrings.addLinkedin,
                    validateMessageFunction:
                        InputValidator.validateRegularField),
                screenHeight: screenHeight),
            RevealField(
                cancelFunction: () {
                  websiteInput.clear();
                  extraFields.remove("website");
                  context.read<SignupCubit>().changeWebsiteFiledVisibility();
                },
                isHidden: !state.websiteFlag,
                child: GeneralInputFiled(
                    fieldFormKey: websiteKey,
                    fieldInput: websiteInput,
                    label: AppStrings.addWebsite,
                    validateMessageFunction:
                        InputValidator.validateRegularField),
                screenHeight: screenHeight),

            Center(
              child: Wrap(
                children: [
                  HiddenButton(
                    screenHeight: screenHeight,
                    isHidden: state.extraPhoneFlag,
                    childWidget: Text(AppStrings.addPhone),
                    onPressed: () {
                      extraFields["extraPhone"] = extraPhoneKey;
                      context
                          .read<SignupCubit>()
                          .changeExtraPhoneFiledVisibility();
                    },
                  ),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  HiddenButton(
                    screenHeight: screenHeight,
                    isHidden: state.linkedInFlag,
                    childWidget: Text(AppStrings.addLinkedin),
                    onPressed: () {
                      extraFields["linkedIn"] = linkeInKey;
                      context
                          .read<SignupCubit>()
                          .changeLinkedInFiledVisibility();
                    },
                  ),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  HiddenButton(
                    screenHeight: screenHeight,
                    isHidden: state.websiteFlag,
                    childWidget: Text(AppStrings.addWebsite),
                    onPressed: () {
                      extraFields["website"] = websiteKey;

                      context
                          .read<SignupCubit>()
                          .changeWebsiteFiledVisibility();
                    },
                  ),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                ],
              ),
            ),
            FormSeparator(screenHeight: screenHeight),
            const DividerWithLabel(
              label: AppStrings.address,
            ),
            FormSeparator(screenHeight: screenHeight),
            SizedBox(
              width: screenWidth * WidgetDimensions.percent90,
              child: Column(
                children: [
                  // CSCPicker(
                  //   onCountryChanged: (value) {},
                  //   onStateChanged: (value) {},
                  //   onCityChanged: (value) {},
                  //   dropdownItemStyle: Theme.of(context)
                  //       .textTheme
                  //       .bodyMedium!
                  //       .copyWith(
                  //           color: ColorManager.backgroundColor),
                  //   dropdownDecoration:
                  //       BoxDecoration(color: ColorManager.layer),
                  //   disabledDropdownDecoration:
                  //       BoxDecoration(color: ColorManager.layer),
                  // ),
                  // FormSeparator(screenHeight: screenHeight),
                  GeneralInputFiled(
                      hintText: "Egypt,Giza,ELshak zaid",
                      fieldFormKey: locationFormKey,
                      fieldInput: locationFormController,
                      label: AppStrings.address,
                      validateMessageFunction:
                          InputValidator.validateRegularField),
                ],
              ),
            ),
            FormSeparator(screenHeight: screenHeight),
            const DividerWithLabel(label: AppStrings.addEducationInfo),
            FormSeparator(screenHeight: screenHeight),
            DegreeView(
                onDelete: context.read<SignupCubit>().deleteDegree,
                degrees: state.educationInfo.degrees!,
                screenWidth: screenWidth,
                screenHeight: screenHeight),
            CourseView(
              courses: state.educationInfo.courses!,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              onDelete: context.read<SignupCubit>().deleteCourse,
            ),
            FormSeparator(screenHeight: screenHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return Dialog(
                              child: EducationCertificationInputDialog(
                                  screenHeight: screenHeight,
                                  screenWidth: screenWidth),
                            );
                          }).then((value) {
                        Degree? returendValue = value as Degree?;
                        if (returendValue != null) {
                          context.read<SignupCubit>().addDegree(returendValue);
                          print(value!.title);
                        }
                      });
                    },
                    child: const Text("+ add Certification")),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return Dialog(
                              child: CourseCertificationInputDialog(
                                  screenHeight: screenHeight,
                                  screenWidth: screenWidth),
                            );
                          }).then((value) {
                        Course? returendValue = value as Course?;
                        if (returendValue != null) {
                          context.read<SignupCubit>().addCourse(returendValue);
                          print(value!.title);
                        }
                      });
                    },
                    child: const Text("+ add course")),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  print("++++++++++++++++++++++++++++++++");
                  print(extraPhoneInput.text);
                  List<GlobalKey<FormState>> extraKeys =
                      extraFields.values.toList();
                  if (checkAllKeys(checkPrimaryKeys) &
                      checkAllKeys(extraKeys)) {
                    print("check done");
                    context.read<SignupCubit>().registerUser(
                        emailRegisterController.text,
                        passwordController.text,
                        userNameContrller.text,
                        phoneController.text,
                        contactEmailFormController.text,
                        locationFormController.text,
                        extraPhoneInput.text,
                        linkeInInput.text,
                        websiteInput.text);
                  }
                },
                child: const Text(AppStrings.submit))
          ],
        );
      },
    );
  }

  bool checkAllKeys(List<GlobalKey<FormState>> keys) {
    bool checkKey = true;
    for (GlobalKey<FormState> i in keys) {
      if (!i.currentState!.validate()) {
        checkKey = false;
      }
      ;
    }
    return checkKey;
  }
}
