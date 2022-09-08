class ItemToSellDetails {
  AccountSelectedDetails? accountSelected;
  InventoryExpenseAccountSelectedDetails? inventoryExpenseAccountSelected;
  ProductSelectedDetails? productSelectedDetails;
  SubUnitDetails? subUnitDetails;

  ItemToSellDetails(
      {this.accountSelected,
      this.inventoryExpenseAccountSelected,
      this.productSelectedDetails,
      this.subUnitDetails});

  factory ItemToSellDetails.fromJson(Map<String, dynamic> json) {
    return ItemToSellDetails(
        accountSelected: AccountSelectedDetails.fromJson(json["accountSelected"]),
        inventoryExpenseAccountSelected: InventoryExpenseAccountSelectedDetails.fromJson(json["inventoryExpenseAccountSelected"]),
        productSelectedDetails: ProductSelectedDetails.fromJson(json["productSelected"]),
        subUnitDetails: SubUnitDetails.fromJson(json["subUnitDetails"])
    );
  }
}

class SubUnitDetails {
  int soldInSubUnits;
  String subUnitName;
  int subUnitPrice;
  SelectedUnitOfMeasure selectedUnitOfMeasure;

  SubUnitDetails(
      {required this.soldInSubUnits,
      required this.subUnitName,
      required this.subUnitPrice,
      required this.selectedUnitOfMeasure});

  factory SubUnitDetails.fromJson(Map<String, dynamic> json) {
    print("Here one $json");
    return SubUnitDetails(
        soldInSubUnits: json["soldInSubUnits"],
        subUnitName: json["subUnitName"],
        subUnitPrice: json["subUnitPrice"],
        selectedUnitOfMeasure:SelectedUnitOfMeasure.fromJson(json["selectedUnitOfMeasure"]));
  }
}

class SelectedUnitOfMeasure {
  int? id;
  int? companyUnitOfMeasureID;
  String? name;

  SelectedUnitOfMeasure(
      {required this.id,
      required this.companyUnitOfMeasureID,
      required this.name});

  factory SelectedUnitOfMeasure.fromJson(Map<String, dynamic> json) {
    return SelectedUnitOfMeasure(
        id: json["id"],
        companyUnitOfMeasureID: json["companyUnitOfMeasureID"],
        name: json["name"]);
  }
}

class ProductSelectedDetails {
  String name;
  String? price;
  String? description;
  int? isInventory;
  String? note;

  ProductSelectedDetails(
      {required this.name,
      required this.price,
      required this.description,
      required this.isInventory,
      required this.note});

  factory ProductSelectedDetails.fromJson(Map<dynamic, dynamic> json) {
    return ProductSelectedDetails(
        name: json["name"],
        price: json["price"],
        description: json["description"],
        isInventory: json["isInventory"],
        note: json["note"]);
  }
}

class InventoryExpenseAccountSelectedDetails {
  int? id;
  String? name;

  InventoryExpenseAccountSelectedDetails(
      {required this.id, required this.name});

  factory InventoryExpenseAccountSelectedDetails.fromJson(Map<String, dynamic>? json) {
    return InventoryExpenseAccountSelectedDetails( id: json?["id"], name: json?["name"]);
  }
}

class AccountSelectedDetails {
  int? id;
  String? name;

  AccountSelectedDetails({required this.id, required this.name});

  factory AccountSelectedDetails.fromJson(Map<dynamic, dynamic> json) {
    return AccountSelectedDetails(id: json["id"], name: json["name"]);
  }
}
