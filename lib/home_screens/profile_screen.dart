import 'package:cropsense/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../global_widgets/colored_button.dart';
import '../global_widgets/colored_text_button.dart';
import '../global_widgets/decorated_text_field.dart';
import '../utils/colors.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final controller = ref.watch(editprofileNotifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: contrastColor),
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios)),
        title: const Center(
          child: Text('Profile',
              style: TextStyle(fontSize: 30, color: Colors.black)),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.profileFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              // RoundImage(
              //     image: farmer,
              //     color: Colors.grey,
              //     borderWidth: 0.1,
              //     size: 200),
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     const Text('Name'),
              //     DecoratedTextField(
              //         label: '',
              //         hint: 'user name',
              //         size: 0.7,
              //         isObsecure: false,
              //         borderColor: mainColor,
              //         controller: emailController,
              //         validator: (value) =>
              //             value!.isEmpty ? 'Please Enter a value' : null),
              //   ],
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Email'),
                  DecoratedTextField(
                    label: '',
                    size: 0.7,
                    hint: 'user@example.com',
                    // isObsecure: true,
                    keyboardType: TextInputType.emailAddress,
                    borderColor: mainColor,
                    controller: controller.email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'this field is required';
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return 'invalid email';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Phone number'),
                  DecoratedTextField(
                      label: '',
                      size: 0.7,
                      hint: '05555555555',
                      keyboardType: TextInputType.number,
                      borderColor: mainColor,
                      controller: controller.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter a value';
                        } else {
                          if (value.length > 10 || value.length < 10) {
                            return 'Please Enter a correct number';
                          }
                          return null;
                        }
                      }),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(height: MediaQuery.of(context).size.height * 0.12),
              ColoredButton(
                  color: mainColor,
                  text: 'Done',
                  size: 0.4,
                  onPressed: () {
                    controller.profileFormKey.currentState!.validate();
                    controller.updateData();
                  }),
              const SizedBox(height: 10),
              ColoredTextButton(
                  color: contrastColor,
                  text: 'Log Out',
                  onPressed: () {
                    controller.logout();
                  }),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
