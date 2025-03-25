import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../export.lib.dart';

class IncomeCardsPageview extends StatefulWidget {
  const IncomeCardsPageview({super.key});

  @override
  State<IncomeCardsPageview> createState() => _IncomeCardsPageviewState();
}

class _IncomeCardsPageviewState extends State<IncomeCardsPageview> {
  final PageController _pageController = PageController(viewportFraction: 1.0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  final List<Widget> _listOfIncomeCards = [
    SupportCardWidget(),
    IncomeCardWidget(
      icon: "assets/images/bar_chart_bars.svg",
      backgroundIcon: "assets/images/transparent_bar_chart.svg",
      durationInvoice: "أرباح اليوم",
      invoicesCount: "25",
    ),
    IncomeCardWidget(
      icon: "assets/images/trending_up.svg",
      backgroundIcon: "assets/images/trending_up.svg",
      durationInvoice: "أرباح الشهر",
      invoicesCount: "25",
    ),
    IncomeCardWidget(
      icon: "assets/images/sell.svg",
      backgroundIcon: "assets/images/sell.svg",
      durationInvoice: "مبيعات اليوم",
      invoicesCount: "25",
    ),
    IncomeCardWidget(
      icon: "assets/images/shopping_cart.svg",
      backgroundIcon: "assets/images/shopping_cart.svg",
      durationInvoice: "مشتريات اليوم",
      invoicesCount: "0",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children:
                  _listOfIncomeCards.map((card) {
                    return card;
                  }).toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _listOfIncomeCards.length,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: _currentPage == index ? 25 : 10.0,
                height: 10,
                decoration:
                    _currentPage == index
                        ? BoxDecoration(
                          borderRadius: BorderRadius.circular(100),

                          color:
                              _currentPage == index
                                  ? HexColor("#3BADFC")
                                  : Colors.grey,
                        )
                        : BoxDecoration(
                          shape: BoxShape.circle,

                          color:
                              _currentPage == index
                                  ? HexColor("#3BADFC")
                                  : Colors.grey,
                        ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
