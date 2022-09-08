import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import '../../models/utilities/network_info.dart';
import '../../providers/product/providers.dart';
import 'classes/sliver_delegate_search.dart';
import 'widget/action_card.dart';
import 'widget/line_chart.dart';
import 'widget/title_double.dart';


class ProductDetails extends ConsumerStatefulWidget {
  int id;
  ProductDetails({required this.id, Key? key}) : super(key: key);

  @override
  ConsumerState<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends ConsumerState<ProductDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(productToSellDetailsProvider.notifier).productItemDetails(widget.id);
    });
  }
  @override
  Widget build(BuildContext context) {
    var productDetails = ref.watch(productToSellDetailsProvider);
    List<Widget> listOfSmallCards = [
      ActionCard(
        actionClick: () => context.pushNamed('sell'),
        cardIcon: const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
        ),
        cardColor: const Color(0xff157253),
        title: const Text( "dashboard.home.sell",).tr(),
      ),
      ActionCard(
        actionClick: () => context.goNamed('inventoryDeduction'),
        cardIcon: const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
        ),
        cardColor: const Color(0xff157253),
        title: const Text( "dashboard.home.sell",).tr(),
      ),
      ActionCard(
        actionClick: () => context.goNamed('inventoryDeduction'),
        cardIcon: const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
        ),
        cardColor: const Color(0xff157253),
        title: const Text( "dashboard.home.sell",).tr(),
      ),
      ActionCard(
        actionClick: () => context.goNamed('inventoryDeduction'),
        cardIcon: const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
        ),
        cardColor: const Color(0xff157253),
        title: const Text( "dashboard.home.sell",).tr(),
      ),
    ];
    return Scaffold(
      body: productDetails.networkStatus == NetworkStatus.loading?
      Center(child: CircularProgressIndicator(color: Colors.green.shade400),):
      productDetails.networkStatus == NetworkStatus.success?
      NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              actions: [
                PopupMenuButton(itemBuilder: (contexts) {
                  return [
                    PopupMenuItem(
                      child: ListTile(
                        onTap: (){
                          context.push('/createProduct/${widget.id}');
                        },
                        title: const Text("Edit"),
                      ),
                    ),
                    const PopupMenuItem(
                      child: ListTile(
                        title: Text("Setting"),
                      ),
                    ),
                    const PopupMenuItem(
                      child: ListTile(
                        title: Text("Help"),
                      ),
                    ),
                  ];
                }),
              ],
              pinned: true,
              automaticallyImplyLeading: true,
              elevation: 0.0,
              backgroundColor: const Color(0xff157253),
              centerTitle: true,
              title: const Text("Product details",
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
            SliverPersistentHeader(
              delegate: SearchBoxSliver(
              minHeight: 250,
              maxHeight: 250,
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(30.0),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffC4C4C4)),
                        height: 85,
                        width: 85,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            const Positioned(
                                left: 60,
                                top: 60,
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.grey,
                                )),
                            Positioned(
                              child: Image.asset(
                                "assets/images/itemImage.png",
                                height: 54.0,
                                width: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text("${productDetails.data?.productSelectedDetails?.name}",
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: Text("${productDetails.data?.productSelectedDetails?.note}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    )
                  ],
                ),
              ),
            )),
            SliverPersistentHeader(
                pinned: true,
                delegate: SearchBoxSliver(
                  maxHeight: 80,
                  minHeight: 80,
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: Row(children: [
                      ActionCard(
                        isBoxShadow: true,
                        actionClick: () => context.goNamed('sell'),
                        cardIcon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Color(0xff157253),
                        ),
                        cardColor: Theme.of(context).scaffoldBackgroundColor,
                        title: const Text( "dashboard.home.sell",).tr(),
                        isBordered: true,
                      ),
                      ActionCard(
                        isBoxShadow: true,
                        actionClick: () => context.goNamed('sell'),
                        cardIcon: const Icon(
                          Icons.check_circle_outline_sharp,
                          color: Colors.green,
                        ),
                        title: const Text( "Used",),
                        isBordered: true,
                        cardColor: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      ActionCard(
                        isBoxShadow: true,
                        cardColor: Theme.of(context).scaffoldBackgroundColor,
                        actionClick: () => context.goNamed('sell'),
                        cardIcon: const Icon(
                          Icons.remove_circle_outline,
                          color: Color(0xffA70C4A),
                        ),
                        title: const Text( "Damaged",),
                        isBordered: true,
                      ),
                      ActionCard(
                        isBoxShadow: true,
                        cardColor: Theme.of(context).scaffoldBackgroundColor,
                        actionClick: () => context.goNamed('sell'),
                        cardIcon: const Icon(
                          Icons.edit_outlined,
                          color: Colors.amber,
                        ),
                        title: const Text( "Edit",),
                        isBordered: true,
                      ),
                    ]),
                  ),
                )),
            SliverPersistentHeader(
                pinned: true,
                delegate: SearchBoxSliver(
                  maxHeight: 50,
                  minHeight: 50,
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    margin: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: DoubleHeader(
                      rightSide: "Transactions",
                      iconButton2: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                      iconButton: TextButton(
                          onPressed: () => context.goNamed('transactionsAll'),
                          child: const Text("View all")),
                    ),
                  ),
                ))
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: LignChartObject(),
                ),
                LimitedBox(
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Slidable(
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  backgroundColor: Colors.red,
                                  icon: Icons.delete,
                                  onPressed: (context) {},
                                )
                              ],
                            ),
                            child: ListTile(
                              subtitle: const Text("20 April 2022"),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "\$25.99",
                                  ),
                                  Text(
                                    index % 2 == 0 ? "Approved" : "In process",
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
                                    fontWeight: FontWeight.bold, fontSize: 14),
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
                          ),
                      separatorBuilder: (_, idx) => const SizedBox(
                            height: 5,
                          ),
                      itemCount: 15),
                )
              ],
            ),
          ),
        ),
      ):
      Center(child: Text(productDetails.getErrorMessage),),
    );
  }
}
