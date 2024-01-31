import 'dart:convert';

import 'package:get/get.dart';
import 'package:unimatcher/utils/local_storage/storage_utility.dart';
import 'package:unimatcher/utils/popups/loaders.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();

  //variables
  final favorite = <String, bool>{}.obs;
  @override
  void onInit() {
    super.onInit();
    initFavoritems();
  }

  Future<void> initFavoritems() async {
    final json = UMLocalStorage.instance().readData('favorite');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorite.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String univeristyId) {
    return favorite[univeristyId] ?? false;
  }

  void toogleFavoriteUniveristy(String univeristyId) {
    if (!favorite.containsKey(univeristyId)) {
      favorite[univeristyId] = true;
      saveFavoritesToStorage();
      UMLoaders.customToast(
          message: 'University has been added to the Wishlist..');
    } else {
      UMLocalStorage.instance().removeData(univeristyId);
      favorite.remove(univeristyId);
      saveFavoritesToStorage();
      favorite.refresh();
      UMLoaders.customToast(
          message: 'Univeristy has been removed from the Wishlist..');
    }
  }

  void saveFavoritesToStorage() {
    final encodeFavorite = json.encode(favorite);
    UMLocalStorage.instance().saveData('favorite', encodeFavorite);
  }

/////Fetch Univeristies from firebase
  // Future<List<UniveristyModel>> favoriteUniveristy() async{
  //   return await UniversityRepository
  // }
}
