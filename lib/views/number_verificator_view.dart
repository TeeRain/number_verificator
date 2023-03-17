import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:number_verificator/config/theme/colors.dart';
import 'package:number_verificator/provider/number_verificator_provider.dart';
import 'package:number_verificator/widgets/code_selector.dart';
import 'package:number_verificator/widgets/country_picker.dart';
import 'package:number_verificator/widgets/loader.dart';
import 'package:number_verificator/widgets/number_dialog.dart';
import 'package:number_verificator/config/theme/fonts.dart';
import 'package:provider/provider.dart';

class NumberVerificatorView extends StatelessWidget {
  const NumberVerificatorView({Key? key}) : super(key: key);

  static const _animationDuration = 500;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NumberVerificatorProvider>();

    return KeyboardDismissOnTap(
      child: Scaffold(
        backgroundColor: bgColor,
        floatingActionButton: AnimatedSwitcher(
          duration: const Duration(milliseconds: _animationDuration),
          child: !provider.isLoading
              ? AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(
                      provider.isFull ? 1 : 0.4,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: NumberDialog(
                    countryCode: provider.countryCode,
                    phoneCode: provider.phoneCode,
                    isFull: provider.isFull,
                    number: provider.number,
                  ),
                )
              : Container(),
        ),
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Get Started", style: primaryInterStyle),
                const Spacer(flex: 2),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedSwitcher(
                      duration:
                          const Duration(milliseconds: _animationDuration),
                      child: !provider.isLoading
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: containerColor,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () => showPicker(
                                            context: context,
                                            onSelect:
                                                provider.onCountrySelected,
                                          ),
                                          child: CodeSelector(
                                            countryCode: provider.countryCode,
                                            phoneCode: provider.phoneCode,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: containerColor,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    height: 50,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 12.0),
                                      child: TextField(
                                        inputFormatters: [
                                          TextInputMask(mask: '(999) 999-9999'),
                                          LengthLimitingTextInputFormatter(
                                            NumberVerificatorProvider.maxLength,
                                          )
                                        ],
                                        style: codeInterStyle,
                                        keyboardType: TextInputType.phone,
                                        autofocus: true,
                                        onChanged: provider.onTextChanged,
                                        cursorColor: primaryColor,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          counterText: '',
                                          hintText: 'Your phone number',
                                          hintStyle: secondaryInterStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          : const Loader(),
                    )
                  ],
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
