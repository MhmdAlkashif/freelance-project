import 'package:flutter/material.dart';
import 'package:freelance_project/screens/add_materials_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int _currentIndex = 0;

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        debugPrint("index -> $index");
        break;
      case 1:
        debugPrint("index -> $index");
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddMaterialsScreen()),
        );
        debugPrint("index -> $index");
        break;
      case 3:
        debugPrint("index -> $index");
        break;
      case 4:
        debugPrint("index -> $index");
        break;
    }
  }

  Widget _navBarItemWidget(
    BuildContext context, {
    required int index,
    required String iconPath,
  }) {
    return GestureDetector(
      onTap: () {
        _onItemTapped(context, index);
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        child: Image.asset(
          iconPath,
          width: 33,
          height: 33,
          color:
              _currentIndex == index
                  ? HexColor("#3BADFC")
                  : HexColor("#636363"),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30, right: 24, left: 24),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Light shadow
                  blurRadius: 5, // Soft blur
                  offset: Offset(0, 3), // Shadow position
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _navBarItemWidget(
                    context,
                    index: 0,
                    iconPath: "assets/images/majesticons_home-line.png",
                  ),
                  _navBarItemWidget(
                    context,
                    index: 1,
                    iconPath: "assets/images/mdi_point-of-sale.png",
                  ),
                  GestureDetector(
                    onTap: () => _onItemTapped(context, 2),
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: HexColor("#3BADFC"),
                      ),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),

                  _navBarItemWidget(
                    context,
                    index: 3,
                    iconPath: "assets/images/iconamoon_scanner.png",
                  ),

                  _navBarItemWidget(
                    context,
                    index: 4,
                    iconPath: "assets/images/person.png",
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
