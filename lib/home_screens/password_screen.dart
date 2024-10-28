import 'package:cropsense/global_widgets/colored_button.dart';
import 'package:cropsense/global_widgets/decorated_text_field.dart';
import 'package:cropsense/providers/settings_provider.dart';
import 'package:cropsense/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditPasswordScreen extends ConsumerWidget {
  const EditPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(editPasswordNotifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Password'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.profileFormKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Old Password'),
                    DecoratedTextField(
                        hint: '********',
                        label: '',
                        size: 0.7,
                        isObsecure: true,
                        borderColor: mainColor,
                        controller: controller.password,
                        validator: (value) =>
                            value!.isEmpty ? 'Please Enter a value' : null),
                  ],
                ),
              ),
              //
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('New Password'),
                  DecoratedTextField(
                      hint: '********',
                      label: '',
                      size: 0.7,
                      isObsecure: true,
                      borderColor: mainColor,
                      controller: controller.newPassword,
                      validator: (value) =>
                          value!.isEmpty ? 'Please Enter a value' : null),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // SizedBox(
              //   width: MediaQuery.sizeOf(context).width / 2,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       // backgroundColor: blue,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(30),
              //       ),
              //     ),
              //     onPressed: () => controller.updateData(),
              //     child: Text(
              // 'update',
              //       // style: boldMediumWhiteTextStyle,
              //     ),
              //   ),
              // ),
              ColoredButton(
                  color: controller.isRequesting ? greyColor : mainColor,
                  text: 'Done',
                  size: 0.4,
                  onPressed: controller.isRequesting
                      ? () {}
                      : () {
                          controller.updateData();
                        }),
            ]),
      ),
    );
  }
}
