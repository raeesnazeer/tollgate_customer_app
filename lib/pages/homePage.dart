import 'package:flutter/material.dart';
import 'package:tollm/API/Services.dart';
import 'package:tollm/pages/login_signup.dart';
import '../Color/light_color.dart';
import '../Color/theme.dart';
import '../widgets/balance_card.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/title_text.dart';
import 'package:google_fonts/google_fonts.dart';

import 'money_transfer_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  Widget _appBar() {

    return Row(
      children: <Widget>[
        TitleText(text: "Hello, "),
        Text(Services.carOwnerName,
            style: GoogleFonts.muli(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: LightColor.navyBlue2),),
        Expanded(
          child: SizedBox(),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            'Logout',
            style: GoogleFonts.muli(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: LightColor.navyBlue2),
          ),
        )
      ],
    );
  }

  Widget _operationsWidget() {
    return Row(
      children: <Widget>[
        _icon(Icons.attach_money, "Recharge"),
      ],
    );
  }

  Widget _icon(IconData icon, String text) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MoneyTransferPage()));
          },
          child: Container(
            height: 80,
            width: 80,
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Color(0xfff3f3f3),
                      offset: Offset(5, 5),
                      blurRadius: 10)
                ]),
            child: Icon(icon),
          ),
        ),
        Text(text,
            style: GoogleFonts.muli(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xff76797e))),
      ],
    );
  }

//  Widget _transectionList() {
//    return Column(
//      children: <Widget>[
//        _transection("Flight Ticket", "23 Feb 2020"),
//        _transection("Electricity Bill", "25 Feb 2020"),
//        _transection("Flight Ticket", "03 Mar 2020"),
//      ],
//    );
//  }

  Widget _transection(String text, String time) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: LightColor.navyBlue1,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Icon(Icons.hd, color: Colors.white),
      ),
      contentPadding: EdgeInsets.symmetric(),
      title: TitleText(
        text: text,
        fontSize: 14,
      ),
      subtitle: Text(time),
      trailing: Container(
          height: 30,
          width: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: LightColor.lightGrey,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Text('-20 Rs',
              style: GoogleFonts.muli(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: LightColor.navyBlue2))),
    );
  }

  @override
  Widget build(BuildContext context) {
    Services service = Services();
    service.getBalance();
    return Scaffold(
        bottomNavigationBar: BottomNavigation(),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 35),
                  _appBar(),
                  SizedBox(
                    height: 40,
                  ),
                  TitleText(text: "My wallet"),
                  SizedBox(
                    height: 20,
                  ),
                  BalanceCard(),
                  SizedBox(
                    height: 50,
                  ),
                  TitleText(
                    text: "Operations",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _operationsWidget(),
                  SizedBox(
                    height: 40,
                  ),
//                  TitleText(
//                    text: "Transactions",
//                  ),
//                  _transectionList(),
                ],
              )),
        )));
  }
}
