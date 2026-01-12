import 'package:get/get.dart';
import 'package:ruang_phur/models/download_model.dart';
import 'package:ruang_phur/models/faq_model.dart';
import 'package:ruang_phur/services/home_services.dart';

class HomeController extends GetxController {
  HomeServices services = Get.find(tag: 'homeServices');
  var faqList = <FaqModel>[].obs;
  var isLoading = false.obs;
  var downloadList = <DownloadModel>[].obs;
  var downloadPercentage = 0.obs;
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
      var response = await services.getFaq(0, 10);
      faqList.addAll(response);
      isLoading.value = false;
    } catch (ex) {
      isLoading.value = false;
      print(ex);
    }
  }

  void getAllDownloads(
      Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    downloadList.clear();
    try {
      var response = await services.getAllDownloads();
      downloadList.addAll(response);
      onSuccess();
    } catch (ex) {
      onError();
    }
  }
}
