import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:unimatcher/data/repositories/cities/cities_repository.dart';
import 'package:unimatcher/features/Home/models/cities_model.dart';
import 'package:unimatcher/utils/popups/loaders.dart';

class CitiesController extends GetxController {
  /*This Controller is reducing number of reads from firestore and fetch data only once when app start*/

  static CitiesController get instance => Get.find();

  final isLoading = false.obs;
  final _citiesRepository = Get.put(CitiesRepository());
  RxList<CitiesModel> allCities = <CitiesModel>[].obs;

  @override
  void onInit() {
    fetchCities();
    super.onInit();
  }

  ///-- Load Cities data
  Future<void> fetchCities() async {
    try {
      //Show Loader While loading cities
      isLoading.value = false;
      //Fetch Cities from data Source(Firestore,API,etc)
      final cities = await _citiesRepository.getAllCities();
      //Update the cities List
      allCities.assignAll(cities);
      //Fetch Popular Cities
    } catch (e) {
      UMLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  ///-- Load Selected City data
  ///-- get Cities Univeristy
}
