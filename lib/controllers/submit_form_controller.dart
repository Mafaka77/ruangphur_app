import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ruang_phur/constant/reusable.dart';
import 'package:ruang_phur/models/constituency_model.dart';
import 'package:ruang_phur/models/district_model.dart';
import 'package:ruang_phur/models/multi_table_model.dart';
import 'package:ruang_phur/models/relation_model.dart';
import 'package:ruang_phur/services/first_step_services.dart';

class SubmitFormController extends GetxController {
  FirstStepServices services = Get.find(tag: 'firstStepServices');
  final firtStepFormKey = GlobalKey<FormState>();
  final secondStepFormKey = GlobalKey<FormState>();
  final thirdStepFormKey = GlobalKey<FormState>();
  var activeStep = 0.obs;
  var genderList = <String>['Male', 'Female'].obs;
  var relationId = ''.obs;
  var relationshipType = ''.obs;
  var selectedRelative = Rxn<RelativeModel>();
  var mitthi_hming = TextEditingController();
  var chhungte_hming = TextEditingController();
  var dob = TextEditingController();
  var gender = ''.obs;
  var districtId = ''.obs;
  var districtText = ''.obs;
  var selectedDistrict = Rxn<DistrictModel>();
  var vengKhua = TextEditingController();
  var constituencyId = ''.obs;
  var constituencyText = ''.obs;
  var selectedConstituency = Rxn<ConstituencyModel>();
  var deathDateTime = TextEditingController();
  var placeOfDeath = TextEditingController();
  //SECOND STEP
  var sourceDistrictText = ''.obs;
  var sourceDistrictId = ''.obs;
  var selectedSourceDistrict = Rxn<DistrictModel>();
  var destinationDistrictText = ''.obs;
  var destinationDistrictId = ''.obs;
  var selectedDestinationDistrict = Rxn<DistrictModel>();
  var startingAddress = TextEditingController();
  var startingLat = ''.obs;
  var startingLng = ''.obs;
  var destinationAddress = TextEditingController();
  var destinationLat = ''.obs;
  var destinationLng = ''.obs;
  var kilometer = ''.obs;
  var motorHmanMan = ''.obs;
  var motorRegistrationNo = TextEditingController();
  var motorNeitu = TextEditingController();
  var motorNeituPhone = TextEditingController();

  //THIRD STEP
  var diltuHming = TextEditingController();
  var diltuDistrictText = ''.obs;
  var diltuDistrictId = ''.obs;
  var selectedDiltuDistrict = Rxn<DistrictModel>();
  var diltuVeng = TextEditingController();
  var diltuPhoneNo = TextEditingController();
  var diltuBank = TextEditingController();
  var diltuAccNo = TextEditingController();
  var diltuIFSC = TextEditingController();
  XFile? mitthiDocumentFile = XFile('');
  var mitthiDocumentUrl = TextEditingController();
  XFile? motorReceiptFile = XFile('');
  var motorReceiptUrl = TextEditingController();
  XFile? deathCertificateFile = XFile('');
  var deathCertificateUrl = TextEditingController();
  XFile? diltuDocumentFile = XFile('');
  var diltuDocumentUrl = TextEditingController();
  var declarationCheckBox = false.obs;
  var rate = ''.obs;
  //OTP SCREEN
  var timeLeft = 300.obs;
  Timer? timer;
  @override
  void onInit() {
    getRate();
    // TODO: implement onInit
    super.onInit();
    getRate();
  }

  void getRate() async {
    try {
      var response = await services.getRate();
      if (response.statusCode == 200) {
        if (response.data['status'] == 200) {
          var data = response.data['data'];
          rate.value = data['rate'];
          print('Rate: ${rate.value}');
        } else {}
      } else {
        // showError('Error Occured');
      }
    } catch (ex) {
      // showError('Error Occured');
    }
  }

  void startTimer() {
    timer?.cancel(); // Cancel any existing timer
    timeLeft.value = 300; // Reset to 5 minutes

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft.value > 0) {
        timeLeft.value--;
      } else {
        timer.cancel();
      }
    });
  }

  // void getRate() async {
  //   var response = await services.getRate();
  //   rate.value = response['data']['rate'];
  //   print(rate);
  // }

  Future getDistrict(String filter) async {
    var response = await services.getDistrict(filter);
    return response;
  }

  Future getConstituency(String filter) async {
    var response = await services.getConstituency(filter, districtId.value);
    return response;
  }

  Future getRelative(String filter) async {
    var response = await services.getRelative(filter);
    return response;
  }

  void uploadMitthiDocumentFile(
      Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    mitthiDocumentUrl.clear();
    try {
      var response = await services.uploadMitthiDocument(mitthiDocumentFile);
      var statusCode = response.statusCode;
      if (statusCode == 200) {
        if (response.data['status'] == 422) {
          onError(response.data['error']);
        } else if (response.data['status'] == 201) {
          var data = response.data['url'];
          mitthiDocumentUrl.text = data;
          onSuccess('Image uploaded');
        }
      } else {
        onError('Error');
      }
    } catch (ex) {
      // print(ex);
      hideLoader();
      onError();
    }
  }

  void uploadMotorReceipt(
      Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    motorReceiptUrl.clear();
    try {
      var response = await services.uploadMitthiDocument(motorReceiptFile);
      var statusCode = response.statusCode;
      if (statusCode == 200) {
        if (response.data['status'] == 422) {
          onError(response.data['error']);
        } else if (response.data['status'] == 201) {
          var data = response.data['url'];
          motorReceiptUrl.text = data;
          onSuccess('Image uploaded');
        }
      } else {
        onError('Error');
      }
    } catch (ex) {
      print(ex);
      onError('Error');
    }
  }

  void uploadDeathCertificate(
      Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    deathCertificateUrl.clear();
    try {
      var response = await services.uploadMitthiDocument(deathCertificateFile);
      var statusCode = response.statusCode;
      if (statusCode == 200) {
        if (response.data['status'] == 422) {
          onError(response.data['error']);
        } else if (response.data['status'] == 201) {
          var data = response.data['url'];
          deathCertificateUrl.text = data;
          onSuccess('Image uploaded');
        }
      } else {
        onError('Error');
      }
    } catch (ex) {
      onError('Erro');
    }
  }

  void uploadDiltuDocument(
      Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    diltuDocumentUrl.clear();
    try {
      var response = await services.uploadMitthiDocument(diltuDocumentFile);
      var statusCode = response.statusCode;
      if (statusCode == 200) {
        if (response.data['status'] == 422) {
          onError(response.data['error']);
        } else if (response.data['status'] == 201) {
          var data = response.data['url'];
          diltuDocumentUrl.text = data;
          onSuccess('Image uploaded');
        }
      } else {
        onError('Error');
      }
    } catch (ex) {
      onError('Error');
    }
  }

  void sendOtp(Function onLoading, Function onSuccess, Function onError) async {
    try {
      var response = await services.sendOtp(diltuPhoneNo.text);
      var statusCode = response.statusCode;
      if (statusCode == 200) {
        if (response.data['status'] == 200) {
          onSuccess(response.data['message']);
        } else if (response.data['status'] == 442) {
          onError(response.data['message']);
        }
      } else {
        onError(response.data['message']);
      }
    } catch (ex) {
      print(ex);
      onError(ex);
    }
  }

  void verifyOtp(Function onLoading, Function onSuccess, Function onError,
      String otp) async {
    onLoading();
    try {
      var response = await services.verifyOtp(diltuPhoneNo.text, otp);
      var statusCode = response.statusCode;
      if (statusCode == 200) {
        if (response.data['status'] == 200) {
          onSuccess(response.data['message']);
        } else if (response.data['status'] == 400) {
          onError(response.data['message']);
        }
      } else {
        onError('Error Occured');
      }
    } catch (ex) {
      onError('Error Occured');
    }
  }

  void submitForm(
      Function onLoading, Function onSuccess, Function onError) async {
    MultiTableModel formData = MultiTableModel(
      deceaseds: {
        'name': mitthi_hming.text,
        'relation_id': relationId.value,
        'relative_name': chhungte_hming.text,
        'dob': dob.text,
        'gender': gender.value,
        'district_id': districtId.value,
        'locality': vengKhua.text,
        'constituency_id': constituencyId.value,
        'death_time': deathDateTime.text,
        'place_of_death': placeOfDeath.text,
      },
      transports: {
        'source_district': sourceDistrictId.value,
        'source_locality': startingAddress.text,
        'destination_district': destinationDistrictId.value,
        'destination_locality': destinationAddress.text,
        'vehicle_no': motorRegistrationNo.text,
        'driver_name': motorNeitu.text,
        'driver_phone': motorNeituPhone.text,
        'source_lat': startingLat.value,
        'source_lng': startingLng.value,
        'destination_lat': destinationLat.value,
        'destination_lng': destinationLng.value,
        'distance': kilometer.value,
        'transport_cost': motorHmanMan.value,
      },
      applicants: {
        'name': diltuHming.text,
        'mobile': diltuPhoneNo.text,
        'district_id': diltuDistrictId.value,
        'locality': diltuVeng.text,
        'bank_name': diltuBank.text,
        'account_no': diltuAccNo.text,
        'ifsc_code': diltuIFSC.text,
        'id_proof': mitthiDocumentUrl.text,
        'receipt': motorReceiptUrl.text,
        'death_certificate': deathCertificateUrl.text,
        'additional_document': diltuDocumentUrl.text,
      },
    );

    try {
      var response = await services.submitForm(formData);
      var statusCode = response.statusCode;

      if (statusCode == 200) {
        if (response.data['status'] == 201) {
          var applicationNo = response.data['data'];
          onSuccess(response.data['message'], applicationNo);
        }
      } else {
        onError('Error Occured');
      }
    } catch (ex) {
      print(ex);
      onError('Error Occured');
    }
  }
}
