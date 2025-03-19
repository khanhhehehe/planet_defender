import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'app_dialog_confirm.dart';
import 'app_dialog.dart';

class ShowDialog {
  static ShowDialog? _instance;

  ShowDialog._();

  static ShowDialog get instance => _instance ??= ShowDialog._();

  bool isShowing = false;

  void showDialogCommon(BuildContext context, String? message) {
    if (!isShowing) {
      isShowing = true;
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AppDialog(
              content: message ?? '',
            );
          }).then((value) => isShowing = false);
    }
  }

  void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return loading();
      },
    ).then((value) => isShowing = false);
  }

  void dimissLoading(BuildContext context) {
    Navigator.pop(context);
  }

  void showDialogTimer(BuildContext context, AppDialog content) {
    if (!isShowing) {
      isShowing = true;
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context1) {
            Timer timer = Timer(const Duration(seconds: 3), () {
              Navigator.pop(context1);
              if (content.onClose != null) {
                content.onClose!();
              }
            });
            return AppDialog(
              content: content.content,
              onClose: () {
                timer.cancel();
                if (content.onClose != null) {
                  content.onClose!();
                }
              },
            );
          }).then((value) => isShowing = false);
    }
  }

  Widget loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  void showDialogConfirm(BuildContext context, String? message, Function yes) {
    if (!isShowing) {
      isShowing = true;
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) {
            return AppConfirmDialog(
              content: message!,
              onClick: yes,
            );
          }).then((value) => isShowing = false);
    }
  }

  showBottomSheet(BuildContext context, Widget content, double height) {
    showModalBottomSheet(
        constraints: BoxConstraints(
          maxHeight: height * MediaQuery.of(context).size.height / 780,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        context: context,
        builder: (context) => ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 20, sigmaY: 20, tileMode: TileMode.clamp),
              child: Container(
                width: double.infinity,
                height: height * MediaQuery.of(context).size.height / 780,
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                  bottom: 30,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Color(0x40000000),
                      offset: Offset(0, 4),
                    )
                  ],
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF2F4B81),
                      Color(0xFF082152),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: content,
              ),
            )));
  }

  showBottomSheetWithoutHeight(BuildContext context, Widget content) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        context: context,
        builder: (context) => ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 20, sigmaY: 20, tileMode: TileMode.clamp),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                  bottom: 30,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Color(0x40000000),
                      offset: Offset(0, 4),
                    )
                  ],
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF2F4B81),
                      Color(0xFF082152),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: content,
              ),
            )));
  }
}
