import 'package:flutter/material.dart';
import 'package:real_project/app/app_constants/text_styles/app_text_styles.dart';

class KeyPad extends StatelessWidget {
  double buttonSize = 60.0;
  final TextEditingController? pinController;
  final Function? onChange;
  final Function? onSubmit;
  final bool? isPinLogin;

  KeyPad(
      {this.onChange,
      this.onSubmit,
      this.pinController,
      this.isPinLogin = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffF7F7FC),
      ),
      // margin: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('1'),
              buttonWidget('2'),
              buttonWidget('3'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('4'),
              buttonWidget('5'),
              buttonWidget('6'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('7'),
              buttonWidget('8'),
              buttonWidget('9'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: buttonSize,
              ),
              buttonWidget('0'),
              iconButtonWidget(Icons.backspace, () {
                if (pinController!.text.isNotEmpty) {
                  pinController!.text = pinController!.text
                      .substring(0, pinController!.text.length - 1);
                }
                if (pinController!.text.length > 5) {
                  pinController!.text = pinController!.text.substring(0, 3);
                }
                onChange!(pinController!.text);
              }),
            ],
          ),
        ],
      ),
    );
  }

  buttonWidget(String buttonText) {
    return SizedBox(
      height: buttonSize,
      width: buttonSize,
      child: GestureDetector(
        onTap: () {
          if (pinController!.text.length <= 3) {
            pinController!.text = pinController!.text + buttonText;
            onChange!(pinController!.text);
          }
        },
        child: Center(
          child: Text(buttonText, style: AppTextStyles.mulishBlack24w700),
        ),
      ),
    );
  }

  iconButtonWidget(IconData icon, void Function()? function) {
    return InkWell(
      onTap: function,
      child: Container(
        height: buttonSize,
        width: buttonSize,
        decoration: const BoxDecoration(
          // color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
