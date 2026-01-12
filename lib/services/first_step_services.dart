import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:ruang_phur/models/constituency_model.dart';
import 'package:ruang_phur/models/district_model.dart';
import 'package:ruang_phur/models/multi_table_model.dart';
import 'package:ruang_phur/models/relation_model.dart';
import 'package:ruang_phur/services/base_services.dart';

import '../routes/routes.dart';

class FirstStepServices extends BaseService {
  Future getRate() async {
    try {
      var response = await client.get(Routes.GET_RATE);
      return response;
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future<List<DistrictModel>> getDistrict(filter) async {
    var response = await client.get(
      Routes.GET_DISTRICT,
      queryParameters: {"filter": filter},
    );

    final data = response.data['data'];
    if (data != null) {
      return DistrictModel.fromJsonList(data);
    }

    return [];
  }

  Future<List<ConstituencyModel>> getConstituency(filter, districtId) async {
    try {
      var response = await client.get(
        Routes.GET_CONSTITUENCY(districtId),
        queryParameters: {"filter": filter},
      );
      final data = response.data['data'];
      if (data != null) {
        return ConstituencyModel.fromJsonList(data);
      }

      return [];
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future<List<RelativeModel>> getRelative(filter) async {
    var response = await client.get(
      Routes.GET_RELATIVE,
      queryParameters: {"filter": filter},
    );

    final data = response.data['data'];
    if (data != null) {
      return RelativeModel.fromJsonList(data);
    }

    return [];
  }

  Future uploadMitthiDocument(XFile? file) async {
    if (file == null) {
      return Future.error("No file selected");
    }
    String mimeType = lookupMimeType(file.path) ?? "unknown";
    // try {
    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(file.path,
          filename: file.name, contentType: MediaType.parse(mimeType)),
    });

    var response = await client.post(
      Routes.UPLOAD_MITTHI_DOCUMENT,
      data: formData,
      options: Options(
        headers: {
          "Content-Type": "multipart/form-data"
        }, // Ensure correct content type
      ),
    );
    print("Response received: ${response.statusCode}");
    return response;
    // } catch (ex) {
    //   return Future.error(ex);
    // }
  }

  Future sendOtp(String phone) async {
    try {
      var response = await client.post(Routes.SEND_OTP, data: {
        'mobile': phone,
      });
      // print(response);
      return response;
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future verifyOtp(String phone, String otp) async {
    try {
      var response = await client.post(Routes.VERIFY_OTP, data: {
        'otp': otp,
        'mobile': phone,
      });
      return response;
    } catch (ex) {
      print(ex);
      return Future.error(ex);
    }
  }

  Future submitForm(MultiTableModel formData) async {
    FormData data = FormData.fromMap({
      "deceased": formData.deceaseds,
      "transport": formData.transports,
      "applicant": formData.applicants,
    });
    try {
      var response = await client.post(
        Routes.SUBMIT_FORM,
        data: data,
      );
      return response;
    } catch (ex) {
      print(ex);
      return Future.error(ex);
    }
  }
}
