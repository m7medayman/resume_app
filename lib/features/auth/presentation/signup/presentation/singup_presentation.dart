import 'package:flutter/material.dart';
import 'package:resume_app/core/common/widgets/my_inputField.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/core/constants/app_string_constats.dart';
import 'package:resume_app/core/constants/widget_dimensions.dart';

class SingUpPresentation extends StatefulWidget {
  const SingUpPresentation({super.key});

  @override
  State<SingUpPresentation> createState() => _SingUpPresentationState();
}

class _SingUpPresentationState extends State<SingUpPresentation> {
  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;
    GlobalKey _emailFormkey=GlobalKey();
    GlobalKey _passwordFormkey=GlobalKey();
GlobalKey _userNameFormkey=GlobalKey();
GlobalKey _phaneFormkey=GlobalKey();
GlobalKey _contactEmailFormkey=GlobalKey();
GlobalKey _educationFormkey=GlobalKey();
GlobalKey _addressFormKey=GlobalKey();
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.signup,style:Theme.of(context).textTheme.headlineMedium,),),
      body: Container(
        width:  screenWidth * WidgetDimensions.percent90,
        child: SingleChildScrollView(
          
          child: Column(
          children: [ 

            EmailInputFiled(emailFormKey: emailFormKey, fieldInput: fieldInput),
            Separator(height: screenHeight),
            PasswordInputFiled(FormKey: FormKey, inputController: inputController, label: label, validateMessageFunction: validateMessageFunction),
            Separator(height: screenHeight),
            GeneralInputFiled(emailFormKey: emailFormKey, fieldInput: fieldInput, label: label, validateMessageFunction: validateMessageFunction, icon: icon)
            Separator(height: screenHeight),

          ], 
          ),
        ),
      ),
    );
  }
}