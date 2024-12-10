import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_app/core/Di/injection.dart';
import 'package:resume_app/core/common/state_renderer/pop_state_dialog_widget.dart';
import 'package:resume_app/core/common/widgets/input_dialogs_body/course_certification_input.dart';
import 'package:resume_app/core/common/widgets/course_view_widget.dart';
import 'package:resume_app/core/common/widgets/degree_view_widget.dart';
import 'package:resume_app/core/common/widgets/devider_with_label.dart';

import 'package:resume_app/core/common/widgets/input_dialogs_body/education_certification_input.dart';
import 'package:resume_app/core/common/widgets/hidden_button.dart';
import 'package:resume_app/core/common/widgets/input_dialogs_body/project_experience_input.dart';
import 'package:resume_app/core/common/widgets/input_dialogs_body/wrokExperience_input.dart';
import 'package:resume_app/core/common/widgets/my_inputField.dart';
import 'package:resume_app/core/common/widgets/project_experience_view.dart';
import 'package:resume_app/core/common/widgets/reveal_widget.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/core/common/widgets/work_experince_view.dart';
import 'package:resume_app/core/constants/app_string_constats.dart';
import 'package:resume_app/core/constants/widget_dimensions.dart';
import 'package:resume_app/core/data_classes/data_classes.dart';
import 'package:resume_app/core/data_classes/project_experience.dart';
import 'package:resume_app/core/data_classes/work_experience.dart';
import 'package:resume_app/core/resources/helpers/input_fields.dart';
import 'package:resume_app/core/routing/routes_manager.dart';
import 'package:resume_app/features/auth/domain/use_case.dart';
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
  late SignupCubit cubit;

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
    cubit = SignupCubit(
      signUpUseCase: getIt(),
      jobExperienceEnhanceSignupUseCase:
          getIt<JobExperienceEnhanceSignupUseCase>(),
    );
    super.initState();
  }

  bool isLoading = false;
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
        create: (context) => cubit,
        child: SafeArea(
          child: Center(
            child: SizedBox(
              width: screenWidth * WidgetDimensions.percent90,
              child: SingleChildScrollView(
                child: BlocListener<SignupCubit, SighupState>(
                  listener: (context, state) {
                    if (state.signupFormState is LoadingSignupFormstate) {
                      if (!isLoading) {
                        _showLoadingPopUpDialog(context);
                        isLoading = true;
                      }
                    } else {
                      if (isLoading) {
                        Navigator.of(context).pop();
                        isLoading = false;
                      }
                    }
                    if (state.signupFormState is FailureSignupFormState) {
                      FailureSignupFormState formState =
                          state.signupFormState as FailureSignupFormState;
                      _showFailurePopUpDialog(context, formState.errorMessage);
                    }
                    if (state.signupFormState is SuccessSignupFormState) {
                      Navigator.pushNamedAndRemoveUntil(
                        context, Routes.home, // The new page to push
                        (Route<dynamic> route) => false, // Remove all routes
                      );
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
          return const LoadingDialog();
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
                screenHeight: screenHeight,
                child: GeneralInputFiled(
                    fieldFormKey: linkeInKey,
                    fieldInput: linkeInInput,
                    label: AppStrings.addLinkedin,
                    validateMessageFunction:
                        InputValidator.validateRegularField)),
            RevealField(
                cancelFunction: () {
                  websiteInput.clear();
                  extraFields.remove("website");
                  context.read<SignupCubit>().changeWebsiteFiledVisibility();
                },
                isHidden: !state.websiteFlag,
                screenHeight: screenHeight,
                child: GeneralInputFiled(
                    fieldFormKey: websiteKey,
                    fieldInput: websiteInput,
                    label: AppStrings.addWebsite,
                    validateMessageFunction:
                        InputValidator.validateRegularField)),

            Center(
              child: Wrap(
                children: [
                  // HiddenButton(
                  //   screenHeight: screenHeight,
                  //   isHidden: state.extraPhoneFlag,
                  //   childWidget: const Text(AppStrings.addPhone),
                  //   onPressed: () {
                  //     extraFields["extraPhone"] = extraPhoneKey;
                  //     context
                  //         .read<SignupCubit>()
                  //         .changeExtraPhoneFiledVisibility();
                  //   },
                  // ),
                  // SizedBox(
                  //   width: screenWidth * 0.02,
                  // ),
                  HiddenButton(
                    screenHeight: screenHeight,
                    isHidden: state.linkedInFlag,
                    childWidget: const Text(AppStrings.addLinkedin),
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
                    childWidget: const Text(AppStrings.addWebsite),
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
                        }
                      });
                    },
                    child: const Text("+ add course")),
              ],
            ),
            FormSeparator(screenHeight: screenHeight),
            const DividerWithLabel(label: "Experiences"),
            FormSeparator(screenHeight: screenHeight),
            WorkExperienceView(
                onDelete: cubit.deleteWorkExperience,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                workExperiences: state.punchOfWorkExperiences),
            FormSeparator(screenHeight: screenHeight),
            ProjectExperienceView(
                onDelete: cubit.deleteProjectExperience,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                workExperiences: state.punchOfProjectExperiences),
            FormSeparator(screenHeight: screenHeight),
            Center(
              child: Wrap(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return Dialog(
                                child: WorkExperienceInputDialog(
                                  screenHeight: screenHeight,
                                  screenWidth: screenWidth,
                                  enhanceFunction:
                                      cubit.getJobExperienceEnhanced,
                                ),
                              );
                            }).then((value) {
                          WorkExperience? returnedValue =
                              value as WorkExperience?;
                          if (returnedValue != null) {
                            cubit.addWorkExperience(returnedValue);
                          }
                        });
                      },
                      child: const Text("+ add Work Experience")),
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return Dialog(
                                child: ProjectExperienceInputDialog(
                                  screenHeight: screenHeight,
                                  screenWidth: screenWidth,
                                  enhanceFunction:
                                      cubit.getJobExperienceEnhanced,
                                ),
                              );
                            }).then((value) {
                          ProjectExperience? returnedValue =
                              value as ProjectExperience?;
                          if (returnedValue != null) {
                            cubit.addProjectExperience(returnedValue);
                          }
                        });
                      },
                      child: const Text("+ add project Experience")),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  List<GlobalKey<FormState>> extraKeys =
                      extraFields.values.toList();
                  if (checkAllKeys(checkPrimaryKeys) &
                      checkAllKeys(extraKeys)) {
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
    }
    return checkKey;
  }
}
