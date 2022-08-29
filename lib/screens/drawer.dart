import 'dart:io';

import 'package:cconvert/provider/app_provider.dart';
import 'package:cconvert/shared/components/shared_widgets.dart';
import 'package:cconvert/utils/expanded.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/resources/colors.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool expand = false;
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<AppProvider>(context);
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 80),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  freev(v: 80),
                  defaultListTile(context,
                      txt: prov.isDark ? 'Light' : 'Dark',
                      trail: Switch(
                          activeColor: primary,
                          value: prov.isDark,
                          onChanged: (val) {
                            prov.changeTheme();
                          })),
                  defaultListTile(context,
                      txt: 'Change Color',
                      trail: IconButton(
                        icon: Icon(
                          expand == false
                              ? Icons.keyboard_arrow_down_rounded
                              : Icons.keyboard_arrow_up_rounded,
                          color: prov.isDark == false ? black : primary,
                        ),
                        onPressed: () {
                          setState(() {
                            expand = !expand;
                          });
                        },
                      )),
                  freev(),
                  ExpandedSection(
                      expand: expand,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ...colors
                              .map((e) => box(e, press: () {
                                    prov.changeColor(e);
                                  }))
                              .toList(),
                        ],
                      ))
                ],
              ),
              defaultListTile(context,
                  txt: 'Exit',
                  lead: IconButton(
                    icon: Icon(
                      Icons.exit_to_app,
                      color: prov.isDark == false ? black : primary,
                    ),
                    onPressed: () {
                      exit(0);
                    },
                  )),
            ]),
      ),
    );
  }

  Widget box(color, {press}) {
    return InkWell(
      onTap: press,
      child: Container(
        color: color,
        height: 50,
        width: 25,
      ),
    );
  }
}
