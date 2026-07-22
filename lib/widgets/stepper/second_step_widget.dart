import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';
import 'package:ruang_phur/constant/my_snackbar.dart';
import 'package:ruang_phur/constant/sized_box.dart';
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
                Container(height: 20, width: 4, color: Colors.black),
                sizedBoxWidth(10),
                const Text(
                  'Ruang Phurhna hmun',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            sizedBoxHeight(20),

            // Transport Mode Toggle
            Obx(
              () => Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.transportMode.value = 'road';
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: controller.transportMode.value == 'road'
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: controller.transportMode.value == 'road'
                                ? [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                : [],
                          ),
                          child: Center(
                            child: Text(
                              'Road Transport',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight:
                                    controller.transportMode.value == 'road'
                                    ? FontWeight.bold
                                    : FontWeight.bold,
                                color: controller.transportMode.value == 'road'
                                    ? Colors.indigo[900]
                                    : Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.transportMode.value = 'boat';
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: controller.transportMode.value == 'boat'
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: controller.transportMode.value == 'boat'
                                ? [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                : [],
                          ),
                          child: Center(
                            child: Text(
                              'Boat Transport',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight:
                                    controller.transportMode.value == 'boat'
                                    ? FontWeight.w800
                                    : FontWeight.bold,
                                color: controller.transportMode.value == 'boat'
                                    ? Colors.blue[800]
                                    : Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            sizedBoxHeight(20),

            Obx(() {
              if (controller.transportMode.value == 'road') {
                return _buildRoadTransportSection(context);
              } else {
                return _buildBoatTransportSection(context);
              }
            }),

            sizedBoxHeight(10),
            const Divider(),
            sizedBoxHeight(10),

            Obx(
              () => Row(
                children: [
                  Container(height: 20, width: 4, color: Colors.black),
                  sizedBoxWidth(10),
                  Text(
                    controller.transportMode.value == 'road'
                        ? 'Motor Chungchang'
                        : 'Lawng Chungchang',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            sizedBoxHeight(20),
            Obx(
              () => Text(
                controller.transportMode.value == 'road'
                    ? 'Ruang phurhna motor'
                    : 'Ruang phurhna lawng',
              ),
            ),
            Container(height: 5, width: 20, color: Colors.black),
            sizedBoxHeight(20),
            Obx(
              () => TextFormField(
                validator: (value) {
                  if (value == '' || value == null) {
                    return 'Required';
                  }
                  return null;
                },
                controller: controller.motorRegistrationNo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: controller.transportMode.value == 'road'
                      ? 'Motor registration number *'
                      : 'Lawng hming/number *',
                  hintText: controller.transportMode.value == 'road'
                      ? 'MZ-XX-X-XXXX'
                      : 'Lawng hming/number',
                  labelStyle: const TextStyle(fontSize: 14),
                  isDense: true,
                ),
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.characters,
                inputFormatters: [UpperCaseTextFormatter()],
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
                controller: controller.motorNeitu,
                decoration: textFieldDecoration(
                  controller.transportMode.value == 'road'
                      ? 'Motor neitu/khalhtu hming *'
                      : 'Lawng khalhtu hming *',
                  null,
                  '',
                ),
              ),
            ),
            sizedBoxHeight(10),
            Obx(
              () => TextFormField(
                validator: (value) {
                  if (value == '' || value == null) {
                    return 'Required';
                  }
                  if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Phone number must be exactly 10 digits';
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
                  labelText: controller.transportMode.value == 'road'
                      ? 'Motor neitu/khalhtu phone number *'
                      : 'Lawng khalhtu phone number *',
                  counterText: '',
                ),
                maxLength: 10,
              ),
            ),

            // Dynamic Calculations Summary Panel
            Obx(() {
              final isRoad = controller.transportMode.value == 'road';
              final distanceVal =
                  double.tryParse(controller.kilometer.value) ?? 0.0;
              final costVal =
                  double.tryParse(controller.motorHmanMan.value) ?? 0.0;

              final showSummary =
                  (isRoad && distanceVal > 0) || (!isRoad && costVal > 0);
              if (!showSummary) return const SizedBox.shrink();

              final totalCost =
                  costVal +
                  (isRoad ? 0.0 : controller.waitingCharge.value.toDouble());

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.indigo[50]?.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.indigo[100]!),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (isRoad) ...[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ruang phurh hlat zawng (Distance)',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Text(
                                '${controller.kilometer.value} km',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ] else ...[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Boat Route',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Text(
                                controller.startingAddress.text.isNotEmpty &&
                                        controller
                                            .destinationAddress
                                            .text
                                            .isNotEmpty
                                    ? '${controller.startingAddress.text} to ${controller.destinationAddress.text}'
                                    : 'Pending Selection',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ],
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              isRoad ? 'Motor hman man' : 'Boat transport cost',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              '₹${controller.motorHmanMan.value}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (!isRoad && controller.waitingCharge.value > 0) ...[
                      const Divider(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Waiting Hours',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Text(
                                '${controller.waitingHours.text} hours',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Waiting Charge',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Text(
                                '₹${controller.waitingCharge.value}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.amber,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                    const Divider(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Estimated Cost',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          '₹${totalCost.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),

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
                    if (controller.secondStepFormKey.currentState!.validate()) {
                      if (controller.transportMode.value == 'road') {
                        _calculateDistance(context);
                      }
                      secondStepPreview(context, controller);
                      FocusScope.of(context).unfocus();
                    } else {
                      mySnackBar(
                        'Please fill all required forms',
                        const Icon(Icons.warning, color: Colors.red),
                      );
                    }
                  },
                  child: const Text(
                    'Preview',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            sizedBoxHeight(40),
          ],
        ),
      ),
    );
  }

  Widget _buildRoadTransportSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Ruang phurh tanna hmun'),
        Container(height: 5, width: 20, color: Colors.black),
        sizedBoxHeight(20),
        TextFormField(
          validator: (value) {
            if (value == '' || value == null) {
              return 'Required';
            }
            return null;
          },
          onTap: () {
            showGaragePlacePicker(context);
          },
          readOnly: true,
          controller: controller.garage_locality,
          decoration: textFieldDecoration(
            'Garage location thlanna',
            const Icon(Icons.location_on_outlined),
            '',
          ),
        ),
        sizedBoxHeight(10),
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
              labelStyle: const TextStyle(fontSize: 14),
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
            enabled: controller.sourceDistrictText.isNotEmpty ? true : false,
            readOnly: true,
            controller: controller.startingAddress,
            decoration: textFieldDecoration(
              'Ruang chhuahna veng/khua thlanna',
              const Icon(Icons.location_on_outlined),
              '',
            ),
          ),
        ),
        const Text(
          'Note: Kilometer dik taka chhut a nih theih nan, ruang chhuahna hmun dik tak map atangin i thlang dawn nia.',
        ),
        sizedBoxHeight(10),
        const Text('Ruang dahna tur hmun'),
        Container(height: 5, width: 20, color: Colors.black),
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
              const Icon(Icons.location_on_outlined),
              '',
            ),
          ),
        ),
        const Text(
          'Note: Kilometer dik taka chhut a nih theih nan, ruang dahna hmun dik tak map atangin i thlang dawn nia.',
        ),
      ],
    );
  }

  Widget _buildBoatTransportSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Ruang phurh tanna (Boat)'),
        Container(height: 5, width: 20, color: Colors.black),
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
              labelText: 'Ruang phurh tanna tur District *',
              labelStyle: const TextStyle(fontSize: 14),
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
        Obx(() {
          final sources = controller.getBoatSources();
          return DropdownSearch<String>(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Required';
              }
              return null;
            },
            enabled: controller.sourceDistrictText.isNotEmpty,
            items: (f, cs) => sources,
            selectedItem: controller.boatSourceLocality.value.isNotEmpty
                ? controller.boatSourceLocality.value
                : null,
            popupProps: const PopupProps.menu(fit: FlexFit.loose),
            decoratorProps: DropDownDecoratorProps(
              decoration: InputDecoration(
                isDense: true,
                labelText: 'Ruang chhuahna Veng/Khua (Boat) *',
                labelStyle: const TextStyle(fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            onChanged: (value) {
              if (value != null) {
                controller.boatSourceLocality.value = value;
                controller.boatDestinationLocality.value = '';
                controller.motorHmanMan.value = '0.0';
              }
            },
          );
        }),
        sizedBoxHeight(20),
        const Text('Ruang dahna tur hmun (Boat)'),
        Container(height: 5, width: 20, color: Colors.black),
        sizedBoxHeight(20),
        Obx(
          () => DropdownSearch<DistrictModel>(
            validator: (value) {
              if (value == null) {
                return 'Required';
              }
              return null;
            },
            enabled: controller.boatSourceLocality.value.isNotEmpty,
            items: (f, cs) async => await controller.getDistrict(f),
            selectedItem: controller.selectedDestinationDistrict.value,
            compareFn: (item1, item2) => item1.isEqual(item2),
            popupProps: const PopupProps.menu(fit: FlexFit.loose),
            decoratorProps: DropDownDecoratorProps(
              decoration: InputDecoration(
                isDense: true,
                labelText: 'Ruang dahna tur District awmna *',
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
        Obx(() {
          final source = controller.boatSourceLocality.value;
          final destinations = controller.getBoatDestinations(source);
          return DropdownSearch<Map<String, dynamic>>(
            validator: (value) {
              if (value == null) {
                return 'Required';
              }
              return null;
            },
            enabled:
                controller.destinationDistrictText.isNotEmpty &&
                controller.boatSourceLocality.value.isNotEmpty,
            items: (f, cs) => destinations,
            itemAsString: (item) =>
                "${item['dest_locality']} (Rs ${item['cost']})",
            compareFn: (item1, item2) => item1['_id'] == item2['_id'],
            selectedItem: destinations.firstWhereOrNull(
              (d) =>
                  d['dest_locality'] ==
                  controller.boatDestinationLocality.value,
            ),
            popupProps: const PopupProps.menu(fit: FlexFit.loose),
            decoratorProps: DropDownDecoratorProps(
              decoration: InputDecoration(
                isDense: true,
                labelText: 'Ruang dahna Veng/Khua (Boat) *',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            onChanged: (value) {
              if (value != null) {
                controller.boatDestinationLocality.value =
                    value['dest_locality'];
                controller.motorHmanMan.value = value['cost'].toString();
              }
            },
          );
        }),
        sizedBoxHeight(10),
        TextFormField(
          controller: controller.waitingHours,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            isDense: true,
            labelText: 'Waiting Time (Darkar zat)',
            hintText: '0',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }

  void showGaragePlacePicker(BuildContext context) {
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
              controller.garage_locality.text = result.formattedAddress
                  .toString();
              controller.garage_lat.value = result.latLng!.latitude.toString();
              controller.garage_lng.value = result.latLng!.longitude.toString();
              Navigator.of(context).pop();
            },
            enableNearbyPlaces: false,
            showSearchInput: true,
            initialLocation: LatLng(
              controller.garage_lat.isEmpty
                  ? 23.72601549012798
                  : double.parse(controller.garage_lat.value),
              controller.garage_lng.isEmpty
                  ? 92.71910078750608
                  : double.parse(controller.startingLng.value),
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onMapCreated: (controller) {
              // mapController = controller;
            },
            searchInputConfig: const SearchInputConfig(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              controller.startingAddress.text = result.formattedAddress
                  .toString();
              controller.startingLat.value = result.latLng!.latitude.toString();
              controller.startingLng.value = result.latLng!.longitude
                  .toString();
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
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              controller.destinationAddress.text = result.formattedAddress
                  .toString();
              controller.destinationLat.value = result.latLng!.latitude
                  .toString();
              controller.destinationLng.value = result.latLng!.longitude
                  .toString();
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
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
    // 1. Validate required source and destination points
    if (controller.startingLat.value == '' ||
        controller.startingLng.value == '' ||
        controller.destinationLat.value == '' ||
        controller.destinationLng.value == '') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text(
            'Please select both starting and destination points.',
          ),
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

    try {
      double startLat = double.parse(controller.startingLat.value);
      double startLng = double.parse(controller.startingLng.value);
      double destLat = double.parse(controller.destinationLat.value);
      double destLng = double.parse(controller.destinationLng.value);

      // Check if optional Garage Location is selected
      bool hasGarage =
          controller.garage_lat.value.isNotEmpty &&
          controller.garage_lng.value.isNotEmpty;

      double totalDistance = 0.0;

      if (hasGarage) {
        double garageLat = double.parse(controller.garage_lat.value);
        double garageLng = double.parse(controller.garage_lng.value);

        // Fetch both segments concurrently for high performance
        var results = await Future.wait([
          getDistanceMatrix(garageLat, garageLng, startLat, startLng),
          getDistanceMatrix(startLat, startLng, destLat, destLng),
        ]);

        double d1 = results[0]; // Garage to Source
        double d2 = results[1]; // Source to Destination
        totalDistance = d1 + d2;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Garage to Source: ${d1.toStringAsFixed(2)} km\n'
              'Source to Destination: ${d2.toStringAsFixed(2)} km\n'
              'Total: ${totalDistance.toStringAsFixed(2)} km',
            ),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 4),
          ),
        );
      } else {
        // Calculate standard one-leg route (Source to Destination)
        totalDistance = await getDistanceMatrix(
          startLat,
          startLng,
          destLat,
          destLng,
        );
      }

      // 2. Set Kilometer value in controller
      controller.kilometer.value = totalDistance.toStringAsFixed(2);

      // 3. Compute price rate
      double rate = double.tryParse(controller.rate.value) ?? 0.0;
      double totalPrice = totalDistance * rate;
      controller.motorHmanMan.value = totalPrice.toStringAsFixed(2);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text('Could not calculate distance. Error: $e'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<double> getDistanceMatrix(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) async {
    try {
      var response = await Dio().get(
        'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=$endLatitude,$endLongitude&origins=$startLatitude,$startLongitude&key=AIzaSyBaVam14iiWqOUY152i_UHbmhKiowB11-A',
      );

      var element = response.data['rows'][0]['elements'][0];
      if (element['status'] == 'OK') {
        // Safely extract numeric distance in meters and convert to kilometers
        int distanceInMeters = element['distance']['value'];
        double distanceInKm = distanceInMeters / 1000.0;
        return distanceInKm;
      } else {
        throw Exception("Route not found: ${element['status']}");
      }
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }
}
