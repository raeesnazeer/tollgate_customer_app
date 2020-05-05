import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:tollm/API/Services.dart';
import '../Color/light_color.dart';
import '../widgets/title_text.dart';

class MoneyTransferPage extends StatefulWidget {
  MoneyTransferPage({Key key}) : super(key: key);

  @override
  _MoneyTransferPageState createState() => _MoneyTransferPageState();
}

class _MoneyTransferPageState extends State<MoneyTransferPage> {

  int amount=1;
  Align _buttonWidget() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            height: MediaQuery.of(context).size.height * .48,
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 1.5,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    children: <Widget>[
                      _countButton("1"),
                      _countButton("2"),
                      _countButton("3"),
                      _countButton("4"),
                      _countButton("5"),
                      _countButton("6"),
                      _countButton("7"),
                      _countButton("8"),
                      _countButton("9"),
                      _icon(Icons.clear, false),
                      _countButton("0"),

                      GestureDetector(
                        onTap: (){
                          setState(() {
                            amount =  (amount/10).floor() ;
                          });


                        },
                          child: _icon(Icons.backspace, false)),
                    ],
                  ),
                ),
                _transferButton()
              ],
            )));
  }

  Widget _transferButton() {
    return GestureDetector(
      onTap: () async{
        context.showLoaderOverlay();
        Services services = Services();
        await services.recharge(amount);

        Navigator.pop(context);
        context.hideLoaderOverlay();
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
              color: LightColor.navyBlue2,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Wrap(
            children: <Widget>[
              Transform.rotate(
                angle: 70,
                child: Icon(
                  Icons.swap_calls,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10),
              TitleText(
                text: "Recharge",
                color: Colors.white,
              ),
            ],
          )),
    );
  }

  Widget _icon(IconData icon, bool isBackground) {
    return Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  color: isBackground
                      ? LightColor.lightGrey
                      : Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Icon(icon),
            ),
            !isBackground
                ? SizedBox()
                : Text(
                    "",
                  )
          ],
        ));
  }

  Widget _countButton(String text) {
    return Material(
        child: InkWell(
            onTap: () {
              print(text);
              setState(() {
                amount = amount*10 + int.parse(text);
              });

            },
            child: Container(
              alignment: Alignment.center,
              child: TitleText(
                text: text,
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: LoaderOverlay(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: 130,
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: LightColor.navyBlue2,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: TitleText(
                            text: "₹ $amount",
                            color: Colors.white,
                          )),
                      Expanded(
                        flex: 2,
                        child: SizedBox(),
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: -140,
                  top: -270,
                  child: CircleAvatar(
                    radius: 190,
                    backgroundColor: LightColor.lightBlue2,
                  ),
                ),
                Positioned(
                  left: -130,
                  top: -300,
                  child: CircleAvatar(
                    radius: 190,
                    backgroundColor: LightColor.lightBlue1,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * .4,
                  right: -150,
                  child: CircleAvatar(
                    radius: 130,
                    backgroundColor: LightColor.yellow2,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * .4,
                  right: -180,
                  child: CircleAvatar(
                    radius: 130,
                    backgroundColor: LightColor.yellow,
                  ),
                ),
                Positioned(
                    left: 0,
                    top: 40,
                    child: Row(
                      children: <Widget>[
                        BackButton(color: Colors.white,),
                        SizedBox(width: 20),
                        TitleText(
                          text: "Recharge",
                          color: Colors.white,
                        )
                      ],
                    )),
                _buttonWidget(),
              ],
            ),
          ),
        ));
  }
}
