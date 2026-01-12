import 'package:ruang_phur/models/download_model.dart';
import 'package:ruang_phur/models/faq_model.dart';
import 'package:ruang_phur/routes/routes.dart';
import 'package:ruang_phur/services/base_services.dart';

class HomeServices extends BaseService {
  Future<List<FaqModel>> getFaq(int offset, int limit) async {
    try {
      var response = await client.get(Routes.GET_FAQ(5), data: {
        'offset': offset,
        'limit': limit,
      });
      var data = response.data['data'];
      return FaqModel.fromJsonList(data);
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future<List<DownloadModel>> getAllDownloads() async {
    try {
      var response = await client.get(Routes.GET_ALL_INFORMATION);
      var data = response.data['data'];
      return DownloadModel.fromJsonList(data);
    } catch (ex) {
      // print(ex);
      return Future.error(ex);
    }
  }
}
