import 'package:get/get.dart';
import '../model/RefJnsNotif.dart';
import '../services/api_services.dart';

class RefJnsNotifController extends GetxController {
  final ApiService api = ApiService();

  var isLoading = false.obs;
  var list = <RefJnsNotif>[].obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    isLoading.value = true;
    try {
      list.value = await api.fetchRefJnsNotifs();
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  Future<void> saveData(RefJnsNotif p) async {
    if (p.kdJnsNotif == null) {
      await api.createRefJnsNotif(p);
    } else {
      await api.updateRefJnsNotif(p);
    }
    loadData();
  }

  Future<void> deleteData(int id) async {
    await api.deleteRefJnsNotif(id);
    loadData();
  }
}
