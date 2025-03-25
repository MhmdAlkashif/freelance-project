import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int _selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.sizeOf(context).width * 0.75
              : MediaQuery.sizeOf(context).width * 0.55,
      child: Drawer(
        backgroundColor: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/images/colored_smart_logo.png"),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: _sideMenuItems(
                    icon: "assets/images/majesticons_home-line.png",
                    iconColor: "#3BADFC",
                    itemTitle: "الصفحة الرئيسية",
                  ),
                ),
                _sideMenuItems(
                  icon: "assets/images/store.png",
                  iconColor: "#FE2E2E",
                  itemTitle: "المخازن",
                ),
                _sideMenuItems(
                  icon: "assets/images/person.png",
                  iconColor: "#34A853",
                  itemTitle: "الحسابات",
                ),
                _sideMenuItems(
                  icon: "assets/images/shopping_cart.svg",
                  iconColor: "#FBBC05",
                  itemTitle: "المشتريات",
                ),
                _sideMenuItems(
                  icon: "assets/images/sell.svg",
                  iconColor: "#3BADFC",
                  itemTitle: "المبيعات",
                ),
                _sideMenuItems(
                  icon: "assets/images/shopping_cart.svg",
                  iconColor: "#FE2E2E",
                  itemTitle: "المرتجعات",
                ),
                _sideMenuItems(
                  icon: "assets/images/monetization_on.png",
                  iconColor: "#34A853",
                  itemTitle: "الديون",
                ),
                _expansionItemWidget(
                  icon: "assets/images/monetization_on.png",
                  iconColor: "#FBBC05",
                  itemTitle: "نقطة بيع",
                ),
                _sideMenuItems(
                  icon: "assets/images/mdi_safe.png",
                  iconColor: "#34A853",
                  itemTitle: "الصندوق",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sideMenuItems({
    required String icon,
    required String iconColor,
    required String itemTitle,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0, left: 24.0, bottom: 24.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: HexColor(iconColor).withOpacity(0.2),
            ),
            child:
                icon.contains("svg")
                    ? SvgPicture.asset(
                      icon,
                      width: 26,
                      height: 26,
                      color: HexColor(iconColor),
                    )
                    : Image.asset(
                      icon,
                      width: 26,
                      height: 26,
                      color: HexColor(iconColor),
                    ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 12.0),
            child: Text(
              itemTitle,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _expansionItemWidget({
    required String icon,
    required String iconColor,
    required String itemTitle,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0, left: 24.0, bottom: 24.0),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        title: Row(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(14.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: HexColor(iconColor).withOpacity(0.2),
                  ),
                  child:
                      icon.contains("svg")
                          ? SvgPicture.asset(
                            icon,
                            width: 26,
                            height: 26,
                            color: HexColor(iconColor),
                          )
                          : Image.asset(
                            icon,
                            width: 26,
                            height: 26,
                            color: HexColor(iconColor),
                          ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsetsDirectional.only(start: 12.0),
              child: Text(
                itemTitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        children: [
          RadioListTile<int>(
            activeColor: Colors.blue,
            title: Text("نقطة بيع 1"),
            value: 1,
            groupValue: _selectedValue,
            onChanged: (value) {
              setState(() {
                _selectedValue = value!;
              });
            },
          ),
          RadioListTile<int>(
            activeColor: Colors.blue,
            title: Text("نقطة بيع 2"),
            value: 2,
            secondary: _payedTagWidget(),
            groupValue: _selectedValue,
            onChanged: (value) {
              setState(() {
                _selectedValue = value!;
              });
            },
          ),
          RadioListTile<int>(
            activeColor: Colors.blue,
            title: Text("نقطة بيع 3"),
            secondary: _payedTagWidget(),
            value: 3,
            groupValue: _selectedValue,
            onChanged: (value) {
              setState(() {
                _selectedValue = value!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _payedTagWidget() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.blue,
      ),
      child: Text(
        "مدفوع",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 12.0,
        ),
      ),
    );
  }
}
