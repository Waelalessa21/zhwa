class ListOfStores {
  static List getStores() {
    return [
      StoreData(imageUrl: 'assets/icons/makeup.png', storeName: 'ميكب ارتست'),
      StoreData(imageUrl: 'assets/icons/hair.png', storeName: ' هير ستايل'),
      StoreData(
        imageUrl: 'assets/icons/camera.png',
        storeName: 'موثقين اللحظات ',
      ),
      StoreData(imageUrl: 'assets/icons/ffa.png', storeName: 'ضيافة'),
      StoreData(imageUrl: 'assets/icons/coor.png', storeName: 'تنسيقات'),
      StoreData(imageUrl: 'assets/icons/dresses.png', storeName: 'فساتين'),
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
        imageUrl: "assets/images/offeer.png",
        storeName: "ورود",
        offerDetails: "عرض على نوعين مختلفة للورد",
      ),
      OfferData(
        imageUrl: "assets/images/offeer.png",
        storeName: "ورود",
        offerDetails: "عرض على نوعين مختلفة للورد",
      ),
    ];
  }
}
