import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ruang_phur/models/application_model.dart';
import 'package:ruang_phur/models/tracking_model.dart';
import 'package:ruang_phur/services/tracking_services.dart';

class TrackingController extends GetxController {
  TrackingServices services = Get.find(tag: 'trackingServices');
  var currentStep = 0.obs;
  var trackingId = TextEditingController();
  var isSuccess = false.obs;
  var trackingData = {}.obs;
  var applicationData = <Application>{}.obs;
  var downloadPercentage = 0.obs;
  Future trackById(
      Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    try {
      var response = await services.trackById(trackingId.text);
      if (response.statusCode == 200) {
        if (response.data['status'] == 200) {
          var data = response.data['data'];
          trackingData.addAll(data);
          switch (trackingData['status']) {
            case 'Pending':
              currentStep.value = 0;
            case 'Verified':
              currentStep.value = 1;
            case 'Approved':
              currentStep.value = 2;
            case 'Processing':
              currentStep.value = 3;
          }
          isSuccess.value = true;
          onSuccess(response.data['message']);
        } else if (response.data['status'] == 404) {
          isSuccess.value = false;
          onError(response.data['message']);
        }
      } else {
        isSuccess.value = false;
        onError('Error Occured');
      }
    } catch (ex) {
      print(ex);
      isSuccess.value = false;
      onError('Error Occured');
    }
  }

  Future getAllApplication(
      Function onLoading, Function onSuccess, Function onError) async {
    applicationData.clear();
    onLoading();
    try {
      var response = await services.getAllApplications(trackingId.text);
      applicationData.add(response!);
      onSuccess();
    } catch (ex) {
      onError();
      print(ex);
    }
  }
}
