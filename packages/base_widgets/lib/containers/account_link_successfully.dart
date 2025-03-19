import 'package:base_widgets/buttons/button_and_icon.dart';
import 'package:base_widgets/buttons/custom_select_button.dart';
import 'package:base_widgets/containers/items_account.dart';
import 'package:base_widgets/containers/warning_or_success_and_description.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class AccountLinkSuccessfully extends StatefulWidget {
  const AccountLinkSuccessfully(
      {super.key,
      this.pathImageWarning = '',
      this.pathImageSuccess = '',
      this.descriptionWarning = '',
      this.descriptionSuccess = '',
      this.isNext = false,
      this.isSelectedAccount = false});

  final String pathImageWarning;
  final String pathImageSuccess;
  final String descriptionWarning;
  final String descriptionSuccess;
  final bool isSelectedAccount;
  final bool isNext;

  @override
  State<AccountLinkSuccessfully> createState() =>
      _AccountLinkSuccessfullyState();
}

class _AccountLinkSuccessfullyState extends State<AccountLinkSuccessfully> {
  int indexIsSelected = -1;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x6),
          child: Column(
            children: [
              widget.isNext
                  ? WarningOrSuccessAndDescription(
                      title: 'Thay đổi mật khẩu thành công',
                      isTitle: true,
                      description: widget.descriptionSuccess,
                      pathImage: widget.pathImageSuccess,
                    )
                  : WarningOrSuccessAndDescription(
                      pathImage: widget.pathImageWarning,
                      description: widget.descriptionWarning,
                    ),
              const SizedBox(
                height: SpacingUnit.x8,
              ),
              widget.isNext
                  ? const SizedBox()
                  : Expanded(
                      child: ListView.separated(
                          padding: const EdgeInsets.all(0),
                          itemBuilder: (context, index) => ItemsAccount(
                                callback: () {
                                  setState(() {
                                    indexIsSelected = index;
                                  });
                                },
                                isSelected: index == indexIsSelected,
                              ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: SpacingUnit.x3),
                          itemCount: 2),
                    ),
              const Expanded(child: SizedBox()),
              widget.isNext
                  ? Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width -
                              SpacingUnit.x10_5,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(SpacingUnit.x2_5),
                              bottomRight: Radius.circular(SpacingUnit.x2_5),
                            ),
                            image: DecorationImage(
                                image: AssetImage('images/hive.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Positioned(
                            bottom: SpacingUnit.x10,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width -
                                  SpacingUnit.x20,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ButtonAndIcon(
                                    callback: () {},
                                    textButton: 'Liên kết',
                                    icon: Icons.cached,
                                  )
                                ],
                              ),
                            ))
                      ],
                    )
                  : Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width -
                              SpacingUnit.x10_5,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(SpacingUnit.x2_5),
                              bottomRight: Radius.circular(SpacingUnit.x2_5),
                            ),
                            image: DecorationImage(
                                image: AssetImage('images/hive.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Positioned(
                            bottom: SpacingUnit.x10,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width -
                                  SpacingUnit.x20,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomSelectButton(
                                    callback: () {},
                                    textButton: 'Xác nhận',
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
            ],
          )),
    );
  }
}
