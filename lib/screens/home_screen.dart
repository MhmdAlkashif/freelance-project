import 'package:flutter/material.dart';
import 'package:freelance_project/widgets/most_selling_card.dart';
import 'package:freelance_project/widgets/nav_bar_widget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../export.lib.dart';
import '../widgets/documents_card.dart';
import '../widgets/previous_invoices_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      bottomNavigationBar: NavBarWidget(),
      drawer: SideMenu(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          surfaceTintColor: Colors.white,
          foregroundColor: Colors.white,
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(""),
          elevation: 0.0,

          flexibleSpace: Padding(
            padding: const EdgeInsetsDirectional.only(
              end: 30,
              start: 30,
              top: 100,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _drawerWidget(context),
                _profileAndNotificationWidgets(),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            IncomeCardsPageview(),
            MostSellingCard(),
            PreviousInvoicesCard(),
            DocumentsCard(),
          ],
        ),
      ),
    );
  }

  Widget _drawerWidget(BuildContext context) {
    return GestureDetector(
      onTap: () => scaffoldKey!.currentState!.openDrawer(),
      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: HexColor("#F7F7F7"),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: SvgPicture.asset(
            "assets/images/menu.svg",
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }

  Widget _profileAndNotificationWidgets() {
    return Row(children: [_notificationNudgeWidget(), _profilePicWidget()]);
  }

  Widget _profilePicWidget() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 17.0),
      child: Image.asset("assets/images/profile.png", width: 40, height: 42),
    );
  }

  Widget _notificationNudgeWidget() {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: HexColor("#F7F7F7"),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            SvgPicture.asset(
              "assets/images/notifications_active.svg",
              width: 24,
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Container(
                width: 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
