import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_app/core/Di/injection.dart';
import 'package:resume_app/core/common/state_renderer/pop_state_dialog_widget.dart';
import 'package:resume_app/core/common/widgets/course_view_widget.dart';
import 'package:resume_app/core/common/widgets/degree_view_widget.dart';
import 'package:resume_app/core/common/widgets/devider_with_label.dart';
import 'package:resume_app/core/common/widgets/hidden_button.dart';
import 'package:resume_app/core/common/widgets/input_dialogs_body/course_certification_input.dart';
import 'package:resume_app/core/common/widgets/input_dialogs_body/education_certification_input.dart';
import 'package:resume_app/core/common/widgets/my_inputField.dart';
import 'package:resume_app/core/common/widgets/reveal_widget.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/core/constants/app_string_constats.dart';
import 'package:resume_app/core/constants/widget_dimensions.dart';
import 'package:resume_app/core/data_classes/data_classes.dart';
import 'package:resume_app/core/data_classes/user_info.dart';
import 'package:resume_app/core/page_states/page_states.dart';
import 'package:resume_app/core/resources/helpers/input_fields.dart';
import 'package:resume_app/core/resources/helpers/null_type_extension.dart';
import 'package:resume_app/core/routing/routes_manager.dart';
import 'package:resume_app/features/change_user_info/domain/update_user_usecase.dart';
import 'package:resume_app/features/change_user_info/presentation/cubit/change_user_cubit.dart';


class UpdateUserView extends StatefulWidget {
  const UpdateUserView({super.key});

  @override
  State<UpdateUserView> createState() => _UpdateUserViewState();
}

class _UpdateUserViewState extends State<UpdateUserView> {
  GlobalKey<FormState> userNameFormkey = GlobalKey();
  GlobalKey<FormState> phoneFormkey = GlobalKey();
  GlobalKey<FormState> contactEmailFormkey = GlobalKey();
  GlobalKey<FormState> addressFormKey = GlobalKey();

  TextEditingController userNameContrller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
  late ChangeUserCubit _cubit;
  @override
  void dispose() {
    // TODO: implement dispose
    _cubit.close();
    super.dispose();
  }

  @override
  void initState() {
    checkPrimaryKeys = [
      userNameFormkey,
      phoneFormkey,
      contactEmailFormkey,
      locationFormKey,
    ];
    super.initState();
    _cubit = ChangeUserCubit(
        userInfo: getIt<MyUserInfo>(),
        auth: getIt<FirebaseAuth>(),
        usecase: getIt<UpdateUserUsecase>());
    ChangeUserState state = _cubit.state;
    userNameContrller.text = state.userName;
    phoneController.text = state.phone;
    extraPhoneInput.text = state.contactExtraDetails.extraPhone.nullSafety();
    linkeInInput.text = state.contactExtraDetails.linkedIn.nullSafety();
    websiteInput.text = state.contactExtraDetails.website.nullSafety();
    locationFormController.text = state.address;
    contactEmailFormController.text = state.contactEmail;
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          "update Your info",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: BlocProvider(
        create: (context) => _cubit,
        child: SafeArea(
          child: Center(
            child: SizedBox(
              width: screenWidth * WidgetDimensions.percent90,
              child: SingleChildScrollView(
                child: BlocListener<ChangeUserCubit, ChangeUserState>(
                  listener: (context, state) {
                    if (state.pageState is LoadingPageState) {
                      if (!_isLoading) {
                        _showLoadingPopUpDialog(context);
                        _isLoading = true;
                      }
                    } else {
                      if (_isLoading) {
                        Navigator.of(context).pop();
                        _isLoading = false;
                      }
                    }
                    if (state.pageState is FailurePageState) {
                      FailurePageState formState =
                          state.pageState as FailurePageState;
                      _showFailurePopUpDialog(context, formState.errorMessage);
                    }
                    if (state.pageState is SuccessPageState) {
                      Navigator.of(context).pop();
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

  BlocBuilder<ChangeUserCubit, ChangeUserState> getBody() {
    return BlocBuilder<ChangeUserCubit, ChangeUserState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // reEnter password input

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
                context
                    .read<ChangeUserCubit>()
                    .changeExtraPhoneFiledVisibility();
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
                  context
                      .read<ChangeUserCubit>()
                      .changeLinkedInFiledVisibility();
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
                  context
                      .read<ChangeUserCubit>()
                      .changeWebsiteFiledVisibility();
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
                  //         .read<ChangeUserCubit>()
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
                          .read<ChangeUserCubit>()
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
                          .read<ChangeUserCubit>()
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
                onDelete: context.read<ChangeUserCubit>().deleteDegree,
                degrees: state.educationInfo.degrees!,
                screenWidth: screenWidth,
                screenHeight: screenHeight),
            CourseView(
              courses: state.educationInfo.courses!,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              onDelete: context.read<ChangeUserCubit>().deleteCourse,
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
                          context
                              .read<ChangeUserCubit>()
                              .addDegree(returendValue);
    
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
                          context
                              .read<ChangeUserCubit>()
                              .addCourse(returendValue);
     
                        }
                      });
                    },
                    child: const Text("+ add course")),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  List<GlobalKey<FormState>> extraKeys =
                      extraFields.values.toList();
                  if (checkAllKeys(checkPrimaryKeys) &
                      checkAllKeys(extraKeys)) {
                    context.read<ChangeUserCubit>().updateUser(
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
