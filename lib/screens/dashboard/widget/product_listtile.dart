import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import '../../../models/product/product_model.dart';
import '../../../models/product/retrive_product_model.dart';
import '../../../models/utilities/network_info.dart';
import '../../../providers/product/providers.dart';
import '../classes/snack_bars.dart';

class ProductListTile extends ConsumerStatefulWidget {
  RetrieveProductModel productList;

  ProductListTile({required this.productList, Key? key}) : super(key: key);

  @override
  ConsumerState<ProductListTile> createState() => _ProductListTileState();
}

class _ProductListTileState extends ConsumerState<ProductListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: (){
        showDialog<void>(
          context: context,
          barrierDismissible: true,
          // false = user must tap button, true = tap outside dialog
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: Text('Want to remove ${widget.productList.name} '),
              content: const Text('If you delete this, There is no undo action'),
              actions: <Widget>[
                TextButton(
                  child: const Text('No'),
                  onPressed: () {
                    Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                  },
                ),
                TextButton(
                  child: const Text('Yes'),
                  onPressed: () async{
                    var removeProduct= await ref.read(removeProductProvider.notifier).removeProductToSell(widget.productList.id);
                    if(removeProduct.networkStatus == NetworkStatus.success){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBars.snackBars('Product removed successfully', Colors.green.shade400));
                      Navigator.of(dialogContext).pop();
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBars.snackBars(removeProduct.getErrorMessage, Colors.redAccent.shade400));
                      Navigator.of(dialogContext).pop();
                    }
                  },
                )
              ],
            );
          },
        );
      },
      onTap: () => context.push("/productDetails/${widget.productList.id}"),
      leading: const Icon(Icons.account_balance_wallet_outlined),
      title: Text(widget.productList.name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("RWF ${widget.productList.price}"),
          // const Icon(
          //   Icons.arrow_forward_ios,
          //   size: 20,
          // )
        ],
      ),
    );
  }
}
