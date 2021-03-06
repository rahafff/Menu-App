import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:flutter/material.dart';
import 'package:rightware/generated/l10n.dart';
import 'package:rightware/module_localization/service/localization_service/localization_service.dart';
import 'package:rightware/module_theme/service/theme_service/theme_service.dart';
import 'package:rightware/utils/components/custom_app_bar.dart';

@injectable
class SettingsScreen extends StatefulWidget {
  final LocalizationService _localizationService;
  final AppThemeDataService _themeDataService;


  SettingsScreen(
      this._localizationService,
    this._themeDataService,
  );

  @override
  State<StatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTwaslnaAppBar.appBar(context,
          title: S.of(context).settings,
          colorIcon: Theme.of(context).brightness != Brightness.dark
              ? Theme.of(context).disabledColor
              : Colors.white,
          buttonBackground: Theme.of(context).backgroundColor),
      body: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            Container(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).backgroundColor,
              ),
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  ListTileSwitch(
                    value: Theme.of(context).brightness == Brightness.dark,
                    leading: Icon(
                        Theme.of(context).brightness == Brightness.dark
                            ? Icons.nightlight_round_rounded
                            : Icons.wb_sunny),
                    onChanged: (mode) {
                      widget._themeDataService.switchDarkMode(mode);
                    },
                    visualDensity: VisualDensity.comfortable,
                    switchType: SwitchType.cupertino,
                    switchActiveColor: Theme.of(context).primaryColor,
                    title: Text(S.of(context).darkMode),
                  ),
                  ListTile(
                    leading: Icon(Icons.language),
                    title: Text(S.of(context).language),
                    trailing: DropdownButton(
                        value: Localizations.localeOf(context).languageCode,
                        underline: Container(),
                        icon: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(Icons.arrow_drop_down_rounded),
                        ),
                        items: [
                          DropdownMenuItem(
                            child: Text('??????????????'),
                            value: 'ar',
                          ),
                          DropdownMenuItem(
                            child: Text('English'),
                            value: 'en',
                          ),
                        ],
                        onChanged: (newLang) {
                          widget._localizationService
                              .setLanguage(newLang.toString());
                        }),
                  ),
                  ListTile(
                    leading: Icon(Icons.person_rounded),
                    title: Text(S.of(context).signOut),
                    trailing: Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Icon(Icons.logout_rounded),
                    ),
                    onTap: () {
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
