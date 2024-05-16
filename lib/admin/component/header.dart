
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotelbooking/helper/text_widget.dart';
import 'package:hotelbooking/provider/data_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../responsive.dart';
import '../controller/MenuAppController.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: context.read<MenuAppController>().controlMenu,
            ),
          if (!Responsive.isMobile(context))
            TextWidget(text: "Dashboard", color: Colors.black, size: 20.0, isBold: true),
          if (!Responsive.isMobile(context))
            Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
          NotificationCard()
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: false,
      child: Consumer<DataProvider>(
       builder: (context, provider,child){
         return Container(
             margin: EdgeInsets.only(left: defaultPadding),
             padding: EdgeInsets.symmetric(
               horizontal: defaultPadding,
               vertical: defaultPadding / 2,
             ),
             decoration: BoxDecoration(
               color: primaryColor,
               borderRadius: const BorderRadius.all(Radius.circular(10)),
               border: Border.all(color: Colors.white10),
             ),
             child: Stack(
               children: [
                 Positioned(
                     top: 120,
                     child: TextWidget(text: "12", color: Colors.black, size: 12.0, isBold: true)),
                 Icon(Icons.notifications,color: Colors.black,)
               ],
             )
         );
       },
      ),
    );
  }
}

