import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:resume_app/core/common/widgets/my_inputField.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/core/constants/app_sizes_constants.dart';
import 'package:resume_app/core/constants/app_string_constats.dart';
import 'package:resume_app/core/constants/widget_dimensions.dart';
import 'package:resume_app/core/resources/helpers/input_fields.dart';
import 'package:resume_app/core/theme_manager/color_manager.dart';

class SignUpPresentation extends StatefulWidget {
  const SignUpPresentation({super.key});

  @override
  State<SignUpPresentation> createState() => _SignUpPresentationState();
}

class _SignUpPresentationState extends State<SignUpPresentation> {
  late GlobalKey<FormState> emailRegisterFormkey;
  late GlobalKey<FormState> passwordFormkey;
  late GlobalKey<FormState> userNameFormkey;
  late GlobalKey<FormState> phoneFormkey;
  late GlobalKey<FormState> contactEmailFormkey;
  late GlobalKey<FormState> educationFormkey;
  late GlobalKey<FormState> addressFormKey;
  late TextEditingController emailRegisterController;
  late GlobalKey<FormState> reeEnterPasswordFormKey;
  late TextEditingController passwordController;
  late TextEditingController reEnterpasswordController;
  late TextEditingController userNameContrller;
  late TextEditingController phoneController;
  late TextEditingController addressContrller;
  late TextEditingController contactEmailFormController;
  late TextEditingController locationFormController;
  late TextEditingController countryInputController;
  late TextEditingController stateInputController;
  late TextEditingController cityInputController;

  late GlobalKey<FormState> locationFormKey;
  late double screenWidth;
  late double screenHeight;
  @override
  void initState() {
    locationFormKey = GlobalKey();
    locationFormController = TextEditingController();
    emailRegisterFormkey = GlobalKey<FormState>();
    passwordFormkey = GlobalKey();
    userNameFormkey = GlobalKey();
    phoneFormkey = GlobalKey();
    contactEmailFormkey = GlobalKey();
    educationFormkey = GlobalKey();
    addressFormKey = GlobalKey();
    emailRegisterController = TextEditingController();
    reeEnterPasswordFormKey = GlobalKey();
    cityInputController = TextEditingController();
    stateInputController = TextEditingController();
    countryInputController = TextEditingController();

    passwordController = TextEditingController();
    reEnterpasswordController = TextEditingController();
    userNameContrller = TextEditingController();
    phoneController = TextEditingController();
    addressContrller = TextEditingController();
    contactEmailFormController = TextEditingController();
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
      body: SafeArea(
        child: Center(
          child: Container(
            width: screenWidth * WidgetDimensions.percent90,
            child: SingleChildScrollView(
              child: Column(
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
                      validateMessageFunction:
                          InputValidator.validateRegularField),
                  FormSeparator(screenHeight: screenHeight),
                  // reEnter password input
                  PasswordInputFiled(
                      FormKey: reeEnterPasswordFormKey,
                      inputController: reEnterpasswordController,
                      label: AppStrings.reEnterPassword,
                      validateMessageFunction:
                          InputValidator.validateRegularField),
                  BigFormSeparator(screenHeight: screenHeight),
                  //
                  const DividerWithLabel(label: AppStrings.contactInfo),
                  FormSeparator(screenHeight: screenHeight),

                  // user name
                  GeneralInputFiled(
                    fieldFormKey: userNameFormkey,
                    fieldInput: userNameContrller,
                    label: AppStrings.username,
                    validateMessageFunction:
                        InputValidator.validateRegularField,
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
                    validateMessageFunction:
                        InputValidator.validateRegularField,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text(AppStrings.addPhone)),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text(AppStrings.addLinkedin)),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text(AppStrings.addWebsite))
                    ],
                  ),
                  FormSeparator(screenHeight: screenHeight),
                  const DividerWithLabel(
                    label: AppStrings.address,
                  ),
                  FormSeparator(screenHeight: screenHeight),
                  Container(
                    width: screenWidth * WidgetDimensions.percent90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: CountryStateCityPicker(
                            country: countryInputController,
                            state: stateInputController,
                            city: cityInputController,
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * WidgetDimensions.separate1,
                        ),
                        Expanded(
                          flex: 2,
                          child: GeneralInputFiled(
                              fieldFormKey: locationFormKey,
                              fieldInput: locationFormController,
                              label: AppStrings.address,
                              validateMessageFunction:
                                  InputValidator.validateRegularField),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: const Text(AppStrings.submit))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DividerWithLabel extends StatelessWidget {
  const DividerWithLabel({super.key, required this.label});

  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Expanded(
          child: Divider(
            thickness: AppSize.s1,
            color: ColorManager.textColor,
          ),
        )
      ],
    );
  }
}
