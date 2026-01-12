import 'package:get/get.dart';
import 'package:ruang_phur/models/faq_model.dart';
import 'package:ruang_phur/services/home_services.dart';

class FaqController extends GetxController {
  HomeServices services = Get.find(tag: 'homeServices');
  var faqList = <FaqModel>[].obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFaq();
  }

  void getFaq() async {
    isLoading.value = true;
    faqList.clear();
    try {
      var response = await services.getFaq(0, 20);
      faqList.addAll(response);
      isLoading.value = false;
    } catch (ex) {
      isLoading.value = false;
      print(ex);
    }
  }
}
