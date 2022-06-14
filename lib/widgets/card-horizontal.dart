import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';

class CardHorizontal extends StatelessWidget {
  CardHorizontal(
      {this.title = "Placeholder Title",
      this.cta = "",
      this.img = "https://via.placeholder.com/200",
      this.tap = defaultFunc,
      this.languagefrom = "assets/imgs/vietnam.png",
      this.languageto = "assets/imgs/vietnam.png",
      this.coin = "",
      this.deadline = "",
      this.description = "",
      this.category = ""});

  final String cta;
  final String img;
  final void Function()? tap;
  final String title;
  final String languagefrom;
  final String languageto;
  final String description;
  final String coin;
  final String deadline;
  final String category;

  static void defaultFunc() {
    print("the function works!");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: 250,
        /*height: 300,*/
        constraints: BoxConstraints(maxHeight: double.infinity, maxWidth: double.infinity),
        child: GestureDetector(
          onTap: tap,
          child: Card(
            elevation: 2,
            // shadowColor: NowUIColors.muted.withOpacity(0.25),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Column(
              children: [
                Flexible(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(category,
                                  style: TextStyle(
                                      color: NowUIColors.info, fontSize: 20)),
                              Row(children: <Widget>[
                                Icon(Icons.attach_money_outlined, size: 20),
                                Text(coin,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: NowUIColors.info,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ]),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(title,
                              style: TextStyle(
                                  color: NowUIColors.text,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 5),
                          Expanded(
                            child: Text(description,
                                overflow: TextOverflow.clip,
                                maxLines: 3,
                                style: TextStyle(
                                    color: NowUIColors.text, fontSize: 18)),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(children: <Widget>[
                              Container(
                                height: 40,
                                width: 40,
                                child: Image(image: AssetImage(languagefrom)),
                              ),
                              SizedBox(width: 5),
                              const Icon(Icons.arrow_right, size: 50),
                              SizedBox(width: 5),
                              Container(
                                height: 40,
                                width: 40,
                                child: Image(image: AssetImage(languageto)),
                              ),
                            ]),
                          ),
                          SizedBox(height: 10),
                          Text(deadline,
                              style: TextStyle(
                                  color: NowUIColors.error, fontSize: 20)),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
