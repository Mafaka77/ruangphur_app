import 'dart:ffi';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';
import 'package:ruang_phur/constant/my_snackbar.dart';
import 'package:ruang_phur/constant/sized_box.dart';
import 'package:ruang_phur/constant/text_box_label_style.dart';
import 'package:ruang_phur/constant/text_field_decoration.dart';
import 'package:ruang_phur/constant/uppertext_formatter.dart';
import 'package:ruang_phur/controllers/submit_form_controller.dart';
import 'package:ruang_phur/models/district_model.dart';
import 'package:ruang_phur/widgets/stepper/second_step_preview.dart';

class SecondStepWidget extends GetView<SubmitFormController> {
  const SecondStepWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: controller.secondStepFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 20,
                  width: 4,
                  color: Colors.black,
                ),
                sizedBoxWidth(10),
                const Text(
                  'Ruang Phurhna hmun',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            sizedBoxHeight(20),
            const Text('Ruang phurh tanna hmun'),
            Container(
              height: 5,
              width: 20,
              color: Colors.black,
            ),
            sizedBoxHeight(20),
            DropdownSearch<DistrictModel>(
              validator: (value) {
                if (value == null) {
                  return 'Required';
                }
                return null;
              },
              items: (f, cs) async => await controller.getDistrict(f),
              compareFn: (item1, item2) => item1.isEqual(item2),
              selectedItem: controller.selectedSourceDistrict.value,
              popupProps: const PopupProps.menu(fit: FlexFit.loose),
              decoratorProps: DropDownDecoratorProps(
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Ruang phurh tanna tur District',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onChanged: (value) {
                controller.sourceDistrictText.value = value!.name!;
                controller.sourceDistrictId.value = value.id!;
                controller.selectedSourceDistrict.value = value;
              },
            ),
            sizedBoxHeight(10),
            Obx(
              () => TextFormField(
                validator: (value) {
                  if (value == '' || value == null) {
                    return 'Required';
                  }
                  return null;
                },
                onTap: () {
                  showStartingPlacePicker(context);
                },
                enabled:
                    controller.sourceDistrictText.isNotEmpty ? true : false,
                readOnly: true,
                controller: controller.startingAddress,
                decoration: textFieldDecoration(
                    'Ruang chhuahna veng/khua thlanna',
                    const Icon(Icons.map),
                    ''),
              ),
            ),
            const Text(
                'Note: Kilometer dik taka chhut a nih theih nan, ruang chhuahna hmun dik tak map atangin i thlang dawn nia.'),
            sizedBoxHeight(10),
            const Text('Ruang dahna tur hmun'),
            Container(
              height: 5,
              width: 20,
              color: Colors.black,
            ),
            sizedBoxHeight(20),
            Obx(
              () => DropdownSearch<DistrictModel>(
                validator: (value) {
                  if (value == null) {
                    return 'Required';
                  }
                  return null;
                },
                enabled: controller.startingLat.isNotEmpty ? true : false,
                items: (f, cs) async => await controller.getDistrict(f),
                selectedItem: controller.selectedDestinationDistrict.value,
                compareFn: (item1, item2) => item1.isEqual(item2),
                popupProps: const PopupProps.menu(fit: FlexFit.loose),
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Ruang dahna  tur District awmna',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onChanged: (value) {
                  controller.destinationDistrictText.value = value!.name!;
                  controller.destinationDistrictId.value = value.id!;
                  controller.selectedDestinationDistrict.value = value;
                },
              ),
            ),
            sizedBoxHeight(10),
            Obx(
              () => TextFormField(
                validator: (value) {
                  if (value == '' || value == null) {
                    return 'Required';
                  }
                  return null;
                },
                onTap: () {
                  showDestinationPlacePicker(context);
                },
                enabled: controller.destinationDistrictText.isNotEmpty
                    ? true
                    : false,
                readOnly: true,
                controller: controller.destinationAddress,
                decoration: textFieldDecoration(
                    'Ruang zalhna tur veng/khua thlanna',
                    const Icon(Icons.map),
                    ''),
              ),
            ),
            const Text(
                'Note: Kilometer dik taka chhut a nih theih nan, ruang dahna hmun dik tak map atangin i thlang dawn nia.'),

            sizedBoxHeight(10),
            const Divider(),
            sizedBoxHeight(10),
            // TextFormField(
            //   readOnly: true,
            //   controller: controller.kilometer,
            //   decoration: textFieldDecoration('Kilometer zat ', null),
            // ),
            // sizedBoxHeight(10),
            // const Divider(),
            sizedBoxHeight(10),
            Row(
              children: [
                Container(
                  height: 20,
                  width: 4,
                  color: Colors.black,
                ),
                sizedBoxWidth(10),
                const Text(
                  'Motor Chungchang',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            sizedBoxHeight(20),
            const Text('Ruang phurhna motor'),
            Container(
              height: 5,
              width: 20,
              color: Colors.black,
            ),
            sizedBoxHeight(20),
            TextFormField(
              validator: (value) {
                if (value == '' || value == null) {
                  return 'Required';
                }
                if (!RegExp(r'^[A-Z]{1,2}-\d{2}-[A-Z]{1,2}-\d{4}$')
                    .hasMatch(value)) {
                  return 'Must be MZ-XX-XX-XXXX or MZ-XX-X-XXXX';
                }
                return null;
              },
              controller: controller.motorRegistrationNo,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Motor registration number',
                hintText: 'MZ-XX-X-XXXX',
                labelStyle: const TextStyle(fontSize: 14),
                isDense: true,
              ),
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.characters,
              inputFormatters: [
                // MaskedInputFormatter(
                //   '##-00-##-0000',
                //   allowedCharMatcher: RegExp(r'^MZ-\d{2}-[A-Z]{1,2}-\d{4}$'),
                // ),
                UpperCaseTextFormatter(),
              ],
            ),
            sizedBoxHeight(10),
            TextFormField(
              validator: (value) {
                if (value == '' || value == null) {
                  return 'Required';
                }
                return null;
              },
              controller: controller.motorNeitu,
              decoration:
                  textFieldDecoration('Motor neitu/khalhtu hming', null, ''),
            ),
            sizedBoxHeight(10),
            TextFormField(
              validator: (value) {
                if (value == '' || value == null) {
                  return 'Required';
                }
                return null;
              },
              controller: controller.motorNeituPhone,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                isDense: true,
                labelText: 'Motor neitu/khalhtu phone number',
                counterText: '',
              ),
              maxLength: 10,
            ),
            sizedBoxHeight(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  elevation: 0,
                  minWidth: Get.width * 0.4,
                  height: Get.height * 0.06,
                  shape: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  onPressed: () {
                    controller.activeStep.value = 0;
                  },
                  child: const Text('Back'),
                ),
                MaterialButton(
                  elevation: 0,
                  minWidth: Get.width * 0.4,
                  height: Get.height * 0.06,
                  color: Colors.black,
                  onPressed: () {
                    // controller.activeStep.value = 2;
                    if (controller.secondStepFormKey.currentState!.validate()) {
                      _calculateDistance(context);
                      secondStepPreview(context, controller);
                      FocusScope.of(context).unfocus();
                    } else {
                      mySnackBar(
                        'Please fill all required forms',
                        const Icon(
                          Icons.warning,
                          color: Colors.red,
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Preview',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void showStartingPlacePicker(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return PlacePicker(
            mapType: MapType.satellite,
            minMaxZoomPreference: MinMaxZoomPreference.unbounded,
            usePinPointingSearch: false,

            apiKey: Platform.isAndroid
                ? 'AIzaSyBaVam14iiWqOUY152i_UHbmhKiowB11-A'
                : 'AIzaSyBaVam14iiWqOUY152i_UHbmhKiowB11-A',
            onPlacePicked: (LocationResult result) {
              debugPrint("Place picked: ${result.formattedAddress}");
              controller.startingAddress.text =
                  result.formattedAddress.toString();
              controller.startingLat.value = result.latLng!.latitude.toString();
              controller.startingLng.value =
                  result.latLng!.longitude.toString();
              Navigator.of(context).pop();
            },
            enableNearbyPlaces: false,
            showSearchInput: true,
            initialLocation: LatLng(
              controller.startingLat.isEmpty
                  ? 23.72601549012798
                  : double.parse(controller.startingLat.value),
              controller.startingLng.isEmpty
                  ? 92.71910078750608
                  : double.parse(controller.startingLng.value),
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onMapCreated: (controller) {
              // mapController = controller;
            },
            searchInputConfig: const SearchInputConfig(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              autofocus: false,
              textDirection: TextDirection.ltr,
            ),
            searchInputDecorationConfig: const SearchInputDecorationConfig(
              hintText: "Search for a building, street or ...",
            ),
            // selectedPlaceWidgetBuilder: (ctx, state, result) {
            //   return const SizedBox.shrink();
            // },
            autocompletePlacesSearchRadius: 150,
          );
        },
      ),
    );
  }

  void showDestinationPlacePicker(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return PlacePicker(
            usePinPointingSearch: true,
            apiKey: Platform.isAndroid
                ? 'AIzaSyBaVam14iiWqOUY152i_UHbmhKiowB11-A'
                : 'AIzaSyBaVam14iiWqOUY152i_UHbmhKiowB11-A',
            onPlacePicked: (LocationResult result) {
              controller.destinationAddress.text =
                  result.formattedAddress.toString();
              controller.destinationLat.value =
                  result.latLng!.latitude.toString();
              controller.destinationLng.value =
                  result.latLng!.longitude.toString();
              // _calculateDistance(context);
              Navigator.of(context).pop();
            },
            enableNearbyPlaces: false,
            showSearchInput: true,
            initialLocation: LatLng(
              controller.destinationLat.isEmpty
                  ? 23.72601549012798
                  : double.parse(controller.destinationLat.value),
              controller.destinationLng.isEmpty
                  ? 92.71910078750608
                  : double.parse(controller.destinationLng.value),
            ),
            myLocationEnabled: true,

            myLocationButtonEnabled: true,
            onMapCreated: (controller) {
              // mapController = controller;
            },
            searchInputConfig: const SearchInputConfig(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              autofocus: false,
              textDirection: TextDirection.ltr,
            ),
            searchInputDecorationConfig: const SearchInputDecorationConfig(
              hintText: "Search for a building, street or ...",
            ),
            // selectedPlaceWidgetBuilder: (ctx, state, result) {
            //   return const SizedBox.shrink();
            // },
            autocompletePlacesSearchRadius: 150,
          );
        },
      ),
    );
  }

  void _calculateDistance(BuildContext context) async {
    if (controller.startingLat.value == '' ||
        controller.destinationLat.value == '') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Please select both start and end points.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }
    var distance = await getDistanceMatrix(
        double.parse(controller.startingLat.value),
        double.parse(controller.startingLng.value),
        double.parse(controller.destinationLat.value),
        double.parse(controller.destinationLng.value));
    controller.kilometer.value = distance.toString();
    var totalPrice =
        double.parse(distance.toString()) * double.parse(controller.rate.value);
    controller.motorHmanMan.value = totalPrice.toString();
    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     title: const Text('Distance'),
    //     content:
    //         Text('The distance between the points is ${distance.toString()}'),
    //     actions: [
    //       TextButton(
    //         onPressed: () => Navigator.of(context).pop(),
    //         child: const Text('OK'),
    //       ),
    //     ],
    //   ),
    // );
  }

  Future getDistanceMatrix(double startLatitude, double startLongitude,
      double endLatitude, double endLongitude) async {
    try {
      var response = await Dio().get(
        'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=$endLatitude,$endLongitude&origins=$startLatitude,$startLongitude&key=AIzaSyBaVam14iiWqOUY152i_UHbmhKiowB11-A',
      );
      // print(response.data['rows'][0]['elements'][0]['distance']['text']);
      var km = response.data['rows'][0]['elements'][0]['distance']['text'];
      var newKm = km.replaceAll("km", '');
      print(newKm);
      return newKm;
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }
}
