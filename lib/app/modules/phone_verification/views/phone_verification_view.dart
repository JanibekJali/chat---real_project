import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:real_project/app/app_constants/colors/app_colors.dart';
import 'package:real_project/app/app_constants/text_styles/app_text_styles.dart';
import 'package:real_project/app/app_constants/widgets/app_constant_widgets.dart';
import 'package:real_project/app/app_widgets/buttons/custom_button_widget.dart';
import 'package:real_project/app/data/models/global_models/country_with_flags.dart';

//GetView<PhoneVerificationController>
class PhoneVerificationView extends StatefulWidget {
  const PhoneVerificationView({Key? key}) : super(key: key);

  @override
  State<PhoneVerificationView> createState() => _PhoneVerificationViewState();
}

class _PhoneVerificationViewState extends State<PhoneVerificationView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  String _usersPhoneNumber = '';

  List<DropdownMenuItem<CountryWithFlags>>? _dropDownMenuItems;
  CountryWithFlags? _selectedCountry;
  @override
  void initState() {
    _dropDownMenuItems = buildDropDownMenuItems() ;
    _selectedCountry = _dropDownMenuItems![0].value;
    super.initState();
  }

  List<DropdownButton<CountryWithFlags>> buildDropDownMenuItems() {
    List<DropdownButton<CountryWithFlags>> items =
        <DropdownButton<CountryWithFlags>>[];
    for (CountryWithFlags country in _countries) {
      items.add(
        DropdownButton<CountryWithFlags>(
            value: country,
            child: Row(
              children: [
                country.flag!,
                Text(
                  country.phoneCode!,
                  style: AppTextStyles.mulishBlack14w600,
                ),
              ],
            )),
      );
    
    }
    
  }

  void _onKeyboardTap(String value) {
    setState(() {
      _usersPhoneNumber = _usersPhoneNumber + value;
    });
    log('text: $_usersPhoneNumber');
  }

  funksia() {
    return Row(
      children: [
        Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  _usersPhoneNumber == '' ? 'Phone number' : _usersPhoneNumber,
                  style: AppTextStyles.mulishBlack14w600,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _phoneContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 45,
          width: Get.size.width * 0.25,
          decoration: BoxDecoration(
            color: AppColors.mainColor.withOpacity(0.1),
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(
              Radius.circular(2),
            ),
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(2),
              child: DropdownButton<CountryWithFlags>(
                underline: AppConstantWidgets.emptyWidget,
                icon: AppConstantWidgets.emptyWidget,
                value: _selectedCountry,
                items: _dropDownMenuItems,
                onChanged: (CountryWithFlags? value) {
                  setState(
                    () {
                      _selectedCountry = value;
                    },
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 45,
          width: Get.size.width * 0.65,
          decoration: BoxDecoration(
            color: AppColors.mainColor.withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(2),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  _usersPhoneNumber == ' ' ? 'Phone number' : _usersPhoneNumber,
                  style: AppTextStyles.mulishBlack14w600,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              color: AppColors.black.withAlpha(20),
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.black,
              size: 16,
            ),
          ),
        ),
        elevation: 0, systemOverlayStyle: SystemUiOverlayStyle.dark,
        // title: const Text('PhoneVerificationView'),
        // centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: (Get.size.width * 0.05) - 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Enter Your Phone Number',
                                style: AppTextStyles.mulishBlack24w700,
                              ),
                              Text(
                                'Please confirm your country code and enter your phone number',
                                style: AppTextStyles.mulishBlack24w900,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    _phoneContainer(),
                  ],
                ),
              ),
              CustomButtonWidget(
                buttonText: 'Continue',
                buttonVer: Get.size.height * 0.020,
                buttonHor: Get.size.width * 0.35,
                buttonTextStyle: AppTextStyles.mulishWhite16w600,
                onTap: () {
                  String? code;
                  setState(() {
                    code = '${_selectedCountry!.phoneCode!} $_usersPhoneNumber';
                  });
                  if (_usersPhoneNumber.isNotEmpty) {
                    Get.to(() => PhoneOtp(code: code));
                  } else {
                    Get.snackbar('Warning!', 'Please put your phone number!');
                  }
                },
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                color: AppColors.mainColor.withOpacity(0.1),
                child: NumericKeyboard(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  onKeyboardTap: _onKeyboardTap,
                  textColor: AppColors.black,
                  rightIcon: const Icon(
                    Icons.backspace,
                    color: AppColors.black,
                  ),
                  rightButtonFn: () {
                    setState(() {
                      if (_usersPhoneNumber.isNotEmpty) {
                        _usersPhoneNumber = _usersPhoneNumber.substring(
                            0, _usersPhoneNumber.length - 1);
                      }
                    });
                  },
                ),
              ),
              // Expanded(child: KeyPad())
            ],
          ),
        ),
      ),
    );
  }
}



// Flutter textField hide keyboard 
// read only
