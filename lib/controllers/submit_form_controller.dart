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
  var garage_locality = TextEditingController();
  var garage_lat = ''.obs;
  var garage_lng = ''.obs;
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

  // BOAT TRANSPORT FIELDS
  var transportMode = 'road'.obs;
  var waitingHours = TextEditingController();
  var waitingCharge = 0.obs;
  var boatSourceLocality = ''.obs;
  var boatDestinationLocality = ''.obs;

  var boatRoutes = <Map<String, dynamic>>[].obs;

  List<String> getBoatSources() {
    return boatRoutes
        .map((r) => r['source_locality'] as String)
        .toSet()
        .toList();
  }

  List<Map<String, dynamic>> getBoatDestinations(String sourceLocality) {
    return boatRoutes
        .where((r) => r['source_locality'] == sourceLocality)
        .toList();
  }

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
  XFile? bankFrontFile = XFile('');
  var bankFrontUrl = TextEditingController();
  var declarationCheckBox = false.obs;
  var rate = ''.obs;
  //OTP SCREEN
  var timeLeft = 300.obs;
  Timer? timer;
  @override
  void onInit() {
    getRate();
    getBoatRoutes();
    super.onInit();
    waitingHours.addListener(_updateWaitingCharge);
    transportMode.listen((val) {
      _updateWaitingCharge();
    });
    boatSourceLocality.listen((val) {
      startingAddress.text = val;
    });
    boatDestinationLocality.listen((val) {
      destinationAddress.text = val;
    });
  }

  void getBoatRoutes() async {
    try {
      var response = await services.getBoatRoutes();
      if (response.statusCode == 200) {
        if (response.data['status'] == 200) {
          var data = response.data['data'] as List;
          boatRoutes.value = data
              .map((e) => Map<String, dynamic>.from(e))
              .toList();
          print('Boat routes loaded: ${boatRoutes.length}');
        }
      }
    } catch (ex) {
      print('Error fetching boat routes: $ex');
    }
  }

  void _updateWaitingCharge() {
    if (transportMode.value != 'boat') {
      waitingCharge.value = 0;
      return;
    }
    int hours = int.tryParse(waitingHours.text) ?? 0;
    if (hours < 0) hours = 0;
    int days = hours ~/ 24;
    int remainder = hours % 24;
    int charge = days * 1000 + (remainder >= 2 ? 500 : 0);
    waitingCharge.value = charge;
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
    Function onLoading,
    Function onSuccess,
    Function onError,
  ) async {
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
    Function onLoading,
    Function onSuccess,
    Function onError,
  ) async {
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
    Function onLoading,
    Function onSuccess,
    Function onError,
  ) async {
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
    Function onLoading,
    Function onSuccess,
    Function onError,
  ) async {
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

  void uploadBankFront(
    Function onLoading,
    Function onSuccess,
    Function onError,
  ) async {
    onLoading();
    bankFrontUrl.clear();
    try {
      var response = await services.uploadMitthiDocument(bankFrontFile);
      var statusCode = response.statusCode;
      if (statusCode == 200) {
        if (response.data['status'] == 422) {
          onError(response.data['error']);
        } else if (response.data['status'] == 201) {
          var data = response.data['url'];
          bankFrontUrl.text = data;
          onSuccess('Image uploaded');
        }
      } else {
        onError('Error');
      }
    } catch (ex) {
      onError('Error');
    }
  }

  Future sendOtp() async {
    try {
      var response = await services.sendOtp(diltuPhoneNo.text);
      var statusCode = response.statusCode;
      if (statusCode == 200 && response.data['status'] == 200) {
        return {'success': true, 'message': response.data['message']};
      }
      return {'success': false, 'message': response.data['message']};
    } catch (ex) {
      return {'success': false, 'message': ex};
    }
  }

  Future verifyOtp(String otp) async {
    try {
      var response = await services.verifyOtp(diltuPhoneNo.text, otp);
      var statusCode = response.statusCode;
      if (statusCode == 200 && response.data['status'] == 200) {
        return {"success": true, 'message': response.data['message']};
      }
      return {"success": false, 'message': response.data['message']};
    } catch (ex) {
      return {"success": false, "message": ex};
    }
  }

  Future submitForm() async {
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
        'transport_mode': transportMode.value,
        'waiting_hours': transportMode.value == 'boat'
            ? (int.tryParse(waitingHours.text) ?? 0)
            : 0,
        'waiting_charge': transportMode.value == 'boat'
            ? waitingCharge.value
            : 0,
        'garage_locality': garage_locality.text,
        'garage_lat': garage_lat.value,
        'garage_lng': garage_lng.value,
        'source_district': sourceDistrictId.value,
        'source_locality': startingAddress.text,
        'destination_district': destinationDistrictId.value,
        'destination_locality': destinationAddress.text,
        'vehicle_no': motorRegistrationNo.text,
        'driver_name': motorNeitu.text,
        'driver_phone': motorNeituPhone.text,
        if (transportMode.value == 'road') ...{
          'source_lat': startingLat.value,
          'source_lng': startingLng.value,
          'destination_lat': destinationLat.value,
          'destination_lng': destinationLng.value,
          'distance': kilometer.value,
        },
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
        'bank_front': bankFrontUrl.text,
      },
    );

    try {
      var response = await services.submitForm(formData);
      var statusCode = response.statusCode;

      if (statusCode == 200 && response.data['status'] == 201) {
        var applicationNo = response.data['data'];
        return {
          'success': true,
          'message': response.data['message'],
          'applicationNo': applicationNo,
        };
        // onSuccess(response.data['message'], applicationNo);
      }
      return {'success': false, 'message': response.data['message']};
      // onError(response.data['message']);
    } catch (ex) {
      return {'success': false, 'message': ex};
    }
  }
}
