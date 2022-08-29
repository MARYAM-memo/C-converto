import 'package:cconvert/provider/app_provider.dart';
import 'package:cconvert/screens/drawer.dart';
import 'package:cconvert/shared/components/shared_widgets.dart';
import 'package:cconvert/shared/resources/colors.dart';
import 'package:cconvert/shared/resources/styles.dart';
import 'package:cconvert/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<AppProvider>(context);
    return Scaffold(
      key: key,
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('C-converto..'),
        leading: IconButton(
            onPressed: () {
              key.currentState?.openDrawer();
            },
            icon: const Icon(Icons.settings)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    circle(coinWantConvert, onSelect: (val) {
                      setState(() {
                        coinWantConvert = coins[val]['coin'] as String;
                      });
                    }),
                    Column(
                      children:  [
                        Icon(
                          const IconData(0x279C),
                          color: primary,
                        ),
                        Icon(
                          const IconData(0x279C, matchTextDirection: true),
                          color: primary,
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                    circle(resultCoins, onSelect: (val) {
                      setState(() {
                        resultCoins = coins[val]['coin'] as String;
                      });
                    }),
                  ],
                ),
                freev(v: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    child: Column(children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: getRegular(
                            color: prov.isDark == false ? black : white),
                        onFieldSubmitted: (val) {
                          prov.currencyConvertResult(double.parse(val));
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:  BorderSide(
                                color: primary,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:  BorderSide(
                                color: primary,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ]),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
            child: Row(
              children: [
                Container(
                    height: 60,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: primary, width: 1.5)),
                    child: Center(
                      child: Text(
                        resultCoins,
                        style: getRegular(color: primary),
                      ),
                    )),
                freeh(),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: getRegular(),
                    readOnly: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: '${prov.result}', //result
                      hintStyle: getRegular(
                          color: prov.isDark == false ? black : white),
                      focusedBorder: OutlineInputBorder(
                          borderSide:  BorderSide(
                            color: primary,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:  BorderSide(
                            color: primary,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget circle(txt, {onSelect}) {
    return PopupMenuButton(
        onSelected: onSelect,
        color: primary,
        child: CircleAvatar(
          radius: 40,
          backgroundColor: primary,
          child: Text(
            txt,
            style: getRegular(color: white),
          ),
        ),
        itemBuilder: (context) => coins
            .map((e) => PopupMenuItem(
                value: e['index'],
                child: Center(
                    child: Text(
                  e['coin'] as String,
                  style: getRegular(color: white),
                ))))
            .toList());
  }
}
