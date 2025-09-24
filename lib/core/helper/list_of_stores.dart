class ListOfStores {
  static List getStores() {
    return [
      StoreData(imageUrl: 'assets/icons/Hydrangea.png', storeName: 'ورد'),
      StoreData(imageUrl: 'assets/icons/foood.png', storeName: 'ضيافة'),
      StoreData(imageUrl: 'assets/icons/staff.png', storeName: 'زينة'),
      StoreData(imageUrl: 'assets/icons/wedding.png', storeName: 'تنسيق'),
      StoreData(imageUrl: 'assets/icons/clothes.png', storeName: 'أزياء'),
    ];
  }
}

class StoreData {
  final String imageUrl;
  final String storeName;

  StoreData({required this.imageUrl, required this.storeName});
}

class OfferData {
  final String imageUrl;
  final String storeName;
  final String offerDetails;
  OfferData({
    required this.imageUrl,
    required this.storeName,
    required this.offerDetails,
  });
}

class ListOfOffers {
  static List<OfferData> getOffers() {
    return [
      OfferData(
        imageUrl: 'assets/icons/Hydrangea.png',
        storeName: 'متجر x للورود',
        offerDetails: 'عرض للورد بسعر 100 ريال',
      ),
    ];
  }
}
