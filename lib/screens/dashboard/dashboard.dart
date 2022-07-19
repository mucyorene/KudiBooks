import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/models/transition_chart.dart';
import 'package:kudibooks_app/screens/dashboard/account_transfer.dart';
import 'package:kudibooks_app/screens/dashboard/all_transaction.dart';
import 'package:kudibooks_app/screens/dashboard/client_deposit.dart';
import 'package:kudibooks_app/screens/dashboard/inventory_deduction.dart';
import 'package:kudibooks_app/screens/dashboard/new_expense.dart';
import 'package:kudibooks_app/screens/dashboard/new_inventory.dart';
import 'package:kudibooks_app/screens/dashboard/product_sale.dart';
import 'package:kudibooks_app/screens/dashboard/widget/action_card.dart';
import 'package:kudibooks_app/screens/dashboard/widget/business_movement_cart.dart';
import 'package:kudibooks_app/screens/dashboard/widget/drawer.dart';
import 'package:kudibooks_app/screens/dashboard/widget/title_double.dart';

class Dashboard extends StatefulWidget {
  final VoidCallback? callBack;

  const Dashboard({this.callBack, Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<BusinessMovement> chartData = BusinessMovement.data;

  @override
  Widget build(BuildContext context) {
    List actions = [
      ActionCard(
        actionClick: () => Navigator.push(
            context, CupertinoPageRoute(builder: (ctx) => ProductSale())),
        cardIcon: const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
        ),
        cardColor: const Color(0xff157253),
        title: 'Sell',
      ),
      ActionCard(
        actionClick: () => Navigator.push(
            context, CupertinoPageRoute(builder: (ctx) => NewInventory())),
        cardIcon: const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
        ),
        cardColor: const Color(0xffA70C4A),
        title: 'New Load',
      ),
      ActionCard(
        actionClick: () => Navigator.push(
            context, CupertinoPageRoute(builder: (ctx) => NewExpense())),
        cardIcon: const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
        ),
        cardColor: const Color(0xffFDAB30),
        title: 'Expenses',
      ),
      ActionCard(
        actionClick: () => showModalBottomSheet(
            isDismissible: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15))),
            context: context,
            builder: (context) => _modalForMore(context)),
        cardIcon: const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
        ),
        cardColor: const Color(0xff61B76B),
        title: 'More',
      ),
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Drawers(dashboardScreen: widget.callBack),
      body: Stack(
        children: [
          Positioned(
              top: 150,
              left: 250,
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(color: Colors.green),
              )),
          Positioned(
              top: 30,
              left: 60,
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(color: Colors.amber),
              )),
          Positioned(
              top: 200,
              left: -80,
              child: Container(
                height: 200,
                width: 100,
                decoration: const BoxDecoration(color: Colors.amber),
              )),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 80.0, sigmaY: 90.0),
            child: Container(
              color: Colors.white.withOpacity(.0),
            ),
          ),
          NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                      pinned: innerBoxIsScrolled ? true : false,
                      iconTheme: IconThemeData(
                          color: innerBoxIsScrolled
                              ? Colors.white
                              : const Color(0xff157253)),
                      elevation: 0.0,
                      backgroundColor: innerBoxIsScrolled
                          ? const Color(0xff157253)
                          : Colors.transparent,
                      centerTitle: true,
                      title: innerBoxIsScrolled
                          ? Image.asset(
                              "assets/images/splash/kudibooks-WHITE-PNG-LOGO.png",
                              height: 150,
                            )
                          : Image.asset(
                              "assets/images/splash/kudibooksLogo2.png",
                              height: 150,
                            )),
                ];
              },
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 15.0, bottom: 10.0, top: 30),
                      alignment: AlignmentDirectional.centerStart,
                      child: const Text(
                        "Actions",
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 73,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: LimitedBox(
                        maxHeight: 100,
                        maxWidth: MediaQuery.of(context).size.width,
                        child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            // shrinkWrap: false,
                            // scrollDirection: Axis.horizontal,
                            itemBuilder: (context, inx) {
                              return actions[inx];
                            },
                            separatorBuilder: (_, ins) => const SizedBox(
                                  width: 3,
                                ),
                            itemCount: actions.length),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 10, bottom: 10),
                      alignment: AlignmentDirectional.centerStart,
                      child: const Text(
                        "Sales",
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: DeveloperCharts(data: chartData),
                    ),
                    DoubleHeader(
                      rightSide: "Recent Transactions",
                      iconButton2: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                      iconButton: InkWell(
                          onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => AllTransaction())),
                          child: const Text("View all")),
                    ),
                    LimitedBox(
                      maxHeight: 800,
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => ListTile(
                                subtitle: const Text("20 April 2022"),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "\$25.99",
                                    ),
                                    Text(
                                      index % 2 == 0
                                          ? "Approved"
                                          : "In process",
                                      style: TextStyle(
                                        color: index % 2 == 0
                                            ? Colors.green
                                            : Colors.amber,
                                      ),
                                    )
                                  ],
                                ),
                                title: const Text(
                                  "Transaction name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                leading: CircleAvatar(
                                  backgroundColor: const Color(0xffC4C4C4),
                                  child: Text(
                                    "${++index}",
                                    style: TextStyle(
                                        color: index % 2 == 0
                                            ? Colors.amber
                                            : Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                          separatorBuilder: (_, idx) => const SizedBox(
                                height: 5,
                              ),
                          itemCount: 10),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  _modalForMore(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          ListTile(
            title: const Text(
              "More menus",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close)),
          ),
          ListTile(
            onTap: () => Navigator.push(context,
                CupertinoPageRoute(builder: (context) => InventoryDeduction())),
            leading: const Icon(Icons.create_new_folder_outlined),
            title: const Text(
              "Inventory reduction",
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          ListTile(
            onTap: () => Navigator.push(context,
                CupertinoPageRoute(builder: (context) => ClientDeposit())),
            leading: const Icon(Icons.credit_card),
            title: const Text(
              "Client deposit",
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const ListTile(
            leading: Icon(Icons.credit_card),
            title: Text(
              "Vendor deposit",
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          ListTile(
            onTap: () => Navigator.push(context,
                CupertinoPageRoute(builder: (context) => AccountTransfer())),
            leading: const Icon(Icons.create_new_folder_outlined),
            title: const Text(
              "Account transfer",
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
        ],
      ),
    );
  }
}
