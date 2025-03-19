import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/routers/navigation.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/key_board/keyboard_bloc.dart';
import 'package:planet_defender/presentations/bloc/key_board/keyboard_state.dart';
import 'package:planet_defender/presentations/bloc/user/user_bloc.dart';
import 'package:planet_defender/presentations/bloc/user/user_state.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormInputCaptainName extends StatefulWidget {
  final ValueChanged<String> onChange;
  final String value;
  final VoidCallback onConfirm;
  const FormInputCaptainName({
    Key? key,
    required this.onChange,
    required this.value,
    required this.onConfirm,
  }) : super(key: key);

  @override
  State<FormInputCaptainName> createState() => _FormAddNameState();
}

class _FormAddNameState extends State<FormInputCaptainName> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.value;
    dI<UserBloc>().add(const Init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<UserBloc, UserState>(
        buildWhen: (previous, current) => current.status != previous.status,
        listener: (context, state) {
          if (state.status == CreateNicknameStatus.success) {
            widget.onConfirm.call();
          }
        },
        builder: (context, stateUser) {
          return BlocBuilder<KeyboardBloc, KeyboardState>(
            builder: (context, state) {
              controller.text = state.value;
              return Container(
                height: MediaQuery.sizeOf(context).width / 2.2,
                width: MediaQuery.sizeOf(context).width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.images.formAddName.path),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(height: SpacingUnit.x3),
                    Text("How should we call you?",
                        style: theme.textTheme.bodyLarge!
                            .copyWith(color: Colors.white)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(
                              left: SpacingUnit.x13,
                              top: SpacingUnit.x2,
                              bottom: SpacingUnit.x2,
                              right: SpacingUnit.x2),
                          height: 45,
                          width: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(Assets.images.inputName.path),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: TextField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            textAlign: TextAlign.center,
                            controller: controller,
                            readOnly: true,
                          ),
                        ),
                        const SizedBox(width: SpacingUnit.x2),
                        const Icon(Icons.check)
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            dI<AppNavigation>().pop(context);
                          },
                          child: Text(
                            "Cancel",
                            style: theme.textTheme.bodyLarge!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: SpacingUnit.x5),
                        TextButton(
                          onPressed: () {
                            dI<UserBloc>()
                                .add(SaveNickName(nickname: state.value));
                            dI<UserBloc>().add(const GetUserInfo());
                          },
                          child: Text(
                            "Confirm",
                            style: theme.textTheme.bodyLarge!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: SpacingUnit.x3,
                    )
                  ],
                ),
              );
            },
          );
        });
  }
}
