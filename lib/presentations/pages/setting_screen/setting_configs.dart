import 'package:common/utils/spacing_unit.dart';
import 'package:base_widgets/buttons/title_and_toggle_on_or_off.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localizations/l10n/app_localizations.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/setting/setting_bloc.dart';
import 'package:planet_defender/presentations/bloc/setting/setting_state.dart';

class SettingConfig extends StatefulWidget {
  const SettingConfig({super.key});

  @override
  State<SettingConfig> createState() => _SettingConfigState();
}

class _SettingConfigState extends State<SettingConfig> {
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: SpacingUnit.x6, vertical: SpacingUnit.x2),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleAndToggleOnOrOff(
                    callback: () {
                      dI<SettingBloc>().add(const SetSoundtrack());
                    },
                    title: appLocalizations.soundtrack,
                    pathName: _setStatus(value: state.isSoundtrack),
                  ),
                  const Expanded(child: SizedBox()),
                  TitleAndToggleOnOrOff(
                    callback: () {
                      dI<SettingBloc>().add(const SetSoundEffects());
                    },
                    title: appLocalizations.soundEffects,
                    pathName: _setStatus(value: state.isSoundEffects),
                  )
                ],
              ),
              const SizedBox(
                height: SpacingUnit.x4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleAndToggleOnOrOff(
                    callback: () {
                      dI<SettingBloc>().add(const SetHighGraphics());
                    },
                    title: appLocalizations.graphicsQuality,
                    pathName: _setQuality(value: state.isHighGraphics),
                  ),
                  const Expanded(child: SizedBox()),
                  TitleAndToggleOnOrOff(
                    callback: () {
                      dI<SettingBloc>().add(const SetVibrate());
                    },
                    title: appLocalizations.vibrate,
                    pathName: _setStatus(value: state.isVibrate),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

String _setStatus({bool value = false}) {
  return value ? Assets.svg.toggleOn : Assets.svg.toggleOff;
}

String _setQuality({bool value = false}) {
  return value ? Assets.svg.toggleHigh : Assets.svg.toggleLow;
}
