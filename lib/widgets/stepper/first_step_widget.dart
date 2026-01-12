import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ruang_phur/constant/label_style.dart';
import 'package:ruang_phur/constant/my_snackbar.dart';
import 'package:ruang_phur/constant/sized_box.dart';
import 'package:ruang_phur/constant/text_field_decoration.dart';
import 'package:ruang_phur/controllers/submit_form_controller.dart';
import 'package:ruang_phur/models/constituency_model.dart';
import 'package:ruang_phur/models/district_model.dart';
import 'package:ruang_phur/models/relation_model.dart';
import 'package:ruang_phur/widgets/stepper/first_step_preview.dart';

class FirstStepWidget extends GetView<SubmitFormController> {
  const FirstStepWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: controller.firtStepFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 10,
                    width: 4,
                    color: Colors.black,
                  ),
                  sizedBoxWidth(10),
                  const Text(
                    'Mitthi Chungchang',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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
                controller: controller.mitthi_hming,
                decoration: textFieldDecoration('Mitthi Hming', null, ''),
              ),
              sizedBoxHeight(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * 0.3,
                    child: DropdownSearch<RelativeModel>(
                      validator: (value) {
                        if (value == null) {
                          return 'Required';
                        }
                        return null;
                      },
                      items: (f, cs) async => await controller.getRelative(f),
                      selectedItem: controller.selectedRelative.value,
                      compareFn: (item1, item2) => item1.isEqual(item2),
                      popupProps: const PopupProps.menu(fit: FlexFit.loose),
                      decoratorProps: DropDownDecoratorProps(
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'In laichin na',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        controller.relationId.value = value!.id;
                        controller.relationshipType.value = value.name;
                        controller.selectedRelative.value = value;
                      },
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.55,
                    child: TextFormField(
                      validator: (value) {
                        if (value == '' || value == null) {
                          return 'Required';
                        }
                        return null;
                      },
                      controller: controller.chhungte_hming,
                      decoration: textFieldDecoration(
                          'Mitthi Chhungte Hming', null, ''),
                    ),
                  ),
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
                onTap: () {
                  openDOBPicker(context, controller);
                },
                readOnly: true,
                controller: controller.dob,
                decoration: textFieldDecoration(
                  'Mitthi Pianni leh thla',
                  const Icon(
                    Icons.calendar_today_outlined,
                  ),
                  '',
                ),
              ),
              sizedBoxHeight(10),
              DropdownSearch<String>(
                validator: (value) {
                  if (value == '' || value == null) {
                    return 'Required';
                  }
                  return null;
                },
                items: (f, cs) => ["Male", 'Female'],
                selectedItem: controller.gender.value.isEmpty
                    ? null
                    : controller.gender.value,
                popupProps: PopupProps.menu(
                    disabledItemFn: (item) => item == 'Item 3',
                    fit: FlexFit.loose),
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Gender',
                    hintStyle: TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onChanged: (value) {
                  controller.gender.value = value!;
                },
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
                selectedItem: controller.selectedDistrict.value,
                popupProps: const PopupProps.menu(fit: FlexFit.loose),
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Ruang zalhna tur District',
                    labelStyle: TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onChanged: (value) {
                  controller.districtText.value = value!.name!;
                  controller.districtId.value = value.id!;
                  controller.selectedDistrict.value = value;
                },
              ),
              sizedBoxHeight(10),
              Obx(
                () => DropdownSearch<ConstituencyModel>(
                  enabled: controller.districtText.isEmpty ? false : true,
                  validator: (value) {
                    if (value == null) {
                      return 'Required';
                    }
                    return null;
                  },
                  items: (f, cs) async => await controller.getConstituency(f),
                  compareFn: (item1, item2) => item1.isEqual(item2),
                  selectedItem: controller.selectedConstituency.value,
                  popupProps: const PopupProps.menu(fit: FlexFit.loose),
                  decoratorProps: DropDownDecoratorProps(
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Assembly Constituency',
                      labelStyle: TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    controller.constituencyText.value = value!.name!;
                    controller.constituencyId.value = value.id!;
                    controller.selectedConstituency.value = value;
                  },
                ),
              ),
              sizedBoxHeight(10),
              TextFormField(
                validator: (value) {
                  if (value == '' || value == null) {
                    return 'Required';
                  }
                  return null;
                },
                controller: controller.vengKhua,
                decoration: textFieldDecoration('Veng/Khua', null, ''),
              ),
              sizedBoxHeight(10),
              TextFormField(
                validator: (value) {
                  if (value == '' || value == null) {
                    return 'Required';
                  }
                  return null;
                },
                onTap: () {
                  openDeathTimeDate(context, controller);
                },
                readOnly: true,
                controller: controller.deathDateTime,
                decoration: textFieldDecoration(
                    'Thih ni leh Darkar',
                    const Icon(
                      Icons.calendar_today_outlined,
                    ),
                    ''),
              ),
              sizedBoxHeight(10),
              TextFormField(
                validator: (value) {
                  if (value == '' || value == null) {
                    return 'Required';
                  }
                  return null;
                },
                controller: controller.placeOfDeath,
                decoration: textFieldDecoration('Thihna hmun', null, ''),
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
                      Get.back();
                    },
                    child: const Text('Back'),
                  ),
                  MaterialButton(
                    elevation: 0,
                    minWidth: Get.width * 0.4,
                    height: Get.height * 0.06,
                    color: Colors.black,
                    onPressed: () {
                      if (controller.firtStepFormKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        previewFirstStep(context, controller);
                      } else {
                        mySnackBar(
                          'Please fill all required forms',
                          const Icon(
                            Icons.warning,
                            color: Colors.red,
                          ),
                        );
                      }

                      // controller.activeStep.value = 1;
                    },
                    child: const Text(
                      'Preview',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              sizedBoxHeight(30),
            ],
          ),
        ),
      ),
    );
  }

  openDOBPicker(BuildContext context, SubmitFormController controller) {
    return showModalBottomSheet(
      showDragHandle: true,
      elevation: 0,
      enableDrag: true,
      shape: const BeveledRectangleBorder(),
      context: context,
      builder: (_) => CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        minimumYear: 1900,
        maximumYear: DateTime.now().year,
        onDateTimeChanged: (date) {
          controller.dob.text = DateFormat('yyyy-MM-dd ').format(date);
        },
      ),
    );
  }

  openDeathTimeDate(BuildContext context, SubmitFormController controller) {
    return showModalBottomSheet(
      showDragHandle: true,
      elevation: 0,
      enableDrag: true,
      shape: const BeveledRectangleBorder(),
      context: context,
      builder: (_) => CupertinoDatePicker(
        mode: CupertinoDatePickerMode.dateAndTime,
        minimumYear: 2024,
        maximumYear: DateTime.now().year,
        onDateTimeChanged: (date) {
          controller.deathDateTime.text =
              DateFormat('yyyy-MM-dd hh:mm a').format(date);
        },
      ),
    );
  }
}
