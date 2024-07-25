import 'package:flutter/material.dart';
import 'package:zzeenpay/common/bottom_bar.dart';
import 'package:zzeenpay/common/custom_button.dart';
import 'package:zzeenpay/constants/global_variables.dart';
class OtpScreen extends StatefulWidget {
  static const String routeName = '/otp-screen';
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());
  FocusNode firstFocusNode = FocusNode();

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 28,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Verify Phone Number",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Code Send To Your Phone Number",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: GlobalVariables.textColor1),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => Container(
                    width: 60.0,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: controllers[index],
                      keyboardType: TextInputType.number,
                      //maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green.withOpacity(0.8)),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 3) {
                          FocusScope.of(context).nextFocus();
                        } else if (value.isEmpty && index > 0) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                      onEditingComplete: () {
                        if (controllers[index].text.isEmpty) {
                          if (index > 0) {
                            setState(() {
                              firstFocusNode.unfocus();
                              index = index - 1;
                            });
                          } else {
                            firstFocusNode.unfocus();
                          }
                        }
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                  text: 'VERIFY',
                  onTap: () {
                    Navigator.pushReplacementNamed(context, MyBottomBar.routeName);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
