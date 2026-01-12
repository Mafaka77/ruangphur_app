import 'dart:ffi';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ruang_phur/constant/colors.dart';
import 'package:ruang_phur/constant/label_style.dart';
import 'package:ruang_phur/constant/my_appbar.dart';
import 'package:ruang_phur/constant/preview_answer_style.dart';
import 'package:ruang_phur/constant/reusable.dart';
import 'package:ruang_phur/constant/sized_box.dart';
import 'package:ruang_phur/controllers/tracking_controller.dart';
import 'package:ruang_phur/routes/routes.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class ViewApplicationScreen extends GetView<TrackingController> {
  const ViewApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var data = controller.applicationData.first;
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              color: MyColors.stepperBackgroundColor,
              child: Column(
                children: [
                  const Center(
                    child: Image(
                      height: 80,
                      image: AssetImage('images/mitthi_chungchang.png'),
                    ),
                  ),
                  Text(
                    data.deceased.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data.deceased.relation.name,
                          style: const TextStyle(fontSize: 18),
                        ),
                        sizedBoxWidth(20),
                        Text(
                          data.deceased.relativeName,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  sizedBoxHeight(10),
                  const Divider(
                    indent: 30,
                    endIndent: 30,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      childAspectRatio: 3 / 1, // Aspect ratio of each item
                      crossAxisSpacing: 10, // Space between columns
                      mainAxisSpacing: 10, // Space between rows
                    ),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Column(
                          children: [
                            index == 0
                                ? Text(
                                    data.transport.distance.toStringAsFixed(0),
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text(
                                    double.parse(data.transport.transportCost)
                                        .toStringAsFixed(0),
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                            index == 0
                                ? const Text('Kilometer')
                                : const Text('Amount (Rs)')
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            sizedBoxHeight(10),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Mitthi Chungchang',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  sizedBoxHeight(10),
                  Text(
                    'Mitthi pianni leh thla',
                    style: labelStyle(),
                  ),
                  Text(
                    data.deceased.dob,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  sizedBoxHeight(10),
                  Text(
                    'Gender',
                    style: labelStyle(),
                  ),
                  Text(
                    data.deceased.gender,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  sizedBoxHeight(10),
                  Text(
                    'Thih ni leh darkar',
                    style: labelStyle(),
                  ),
                  Text(
                    data.deceased.timeOfDeath,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  sizedBoxHeight(10),
                  Text(
                    'Thihna hmun',
                    style: labelStyle(),
                  ),
                  Text(
                    data.deceased.placeOfDeath,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  sizedBoxHeight(10),
                  Text(
                    'District',
                    style: labelStyle(),
                  ),
                  Text(
                    data.deceased.district.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  sizedBoxHeight(10),
                  Text(
                    'Veng/Khua',
                    style: labelStyle(),
                  ),
                  Text(
                    data.deceased.locality,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  sizedBoxHeight(10),
                  Text(
                    'Assembly Constituency',
                    style: labelStyle(),
                  ),
                  Text(
                    data.deceased.constituency.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  sizedBoxHeight(10),
                  const Divider(),
                  const Center(
                    child: Text(
                      'Ruang phurh leh motor chungchang',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  sizedBoxHeight(10),
                  Text(
                    'Ruang phurh tanna',
                    style: labelStyle(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'District',
                          style: labelStyle(),
                        ),
                        Text(
                          data.transport.sourceDistrict.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        sizedBoxHeight(10),
                        Text(
                          'Veng/Khua',
                          style: labelStyle(),
                        ),
                        Text(
                          data.transport.sourceLocality,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  sizedBoxHeight(10),
                  Text(
                    'Ruang dahna hmun',
                    style: labelStyle(),
                  ),
                  sizedBoxHeight(10),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'District',
                          style: labelStyle(),
                        ),
                        Text(
                          data.transport.destinationDistrict.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        sizedBoxHeight(10),
                        Text(
                          'Veng/Khua',
                          style: labelStyle(),
                        ),
                        Text(
                          data.transport.destinationLocality,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  sizedBoxHeight(10),
                  Text(
                    'Ruang phurhna motor',
                    style: labelStyle(),
                  ),
                  sizedBoxHeight(10),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Motor registration number',
                          style: labelStyle(),
                        ),
                        Text(
                          data.transport.vehicleNumber,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        sizedBoxHeight(10),
                        Text(
                          'Motor neitu/khalhtu hming',
                          style: labelStyle(),
                        ),
                        Text(
                          data.transport.driverName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        sizedBoxHeight(10),
                        Text(
                          'Motor neitu/khalhtu phone number',
                          style: labelStyle(),
                        ),
                        Text(
                          data.transport.driverPhone,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        sizedBoxHeight(10),
                        Text(
                          'Motor hman man (Rs)',
                          style: labelStyle(),
                        ),
                        Text(
                          data.transport.transportCost,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const Center(
                    child: Text(
                      'Ruang Phurh Diltu',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  sizedBoxHeight(10),
                  Text(
                    'Hming',
                    style: labelStyle(),
                  ),
                  Text(
                    data.applicant.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  sizedBoxHeight(10),
                  Text(
                    'District',
                    style: labelStyle(),
                  ),
                  Text(
                    data.applicant.district.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  sizedBoxHeight(10),
                  Text(
                    'Veng/Khua',
                    style: labelStyle(),
                  ),
                  Text(
                    data.applicant.locality,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  sizedBoxHeight(10),
                  Text(
                    'Phone Number',
                    style: labelStyle(),
                  ),
                  Text(
                    data.applicant.mobile,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  const Center(
                    child: Text(
                      'Bank Details',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  sizedBoxHeight(10),
                  Text(
                    'Bank Hming',
                    style: labelStyle(),
                  ),
                  Text(
                    data.applicant.bankName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  sizedBoxHeight(10),
                  Text(
                    'Bank Account Number',
                    style: labelStyle(),
                  ),
                  Text(
                    data.applicant.accountNo,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  sizedBoxHeight(10),
                  Text(
                    'IFSC Code',
                    style: labelStyle(),
                  ),
                  Text(
                    data.applicant.ifscCode,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  const Center(
                    child: Text(
                      'Document thiltel te',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 0, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          dense: true,
                          leading:
                              const Icon(size: 20, Icons.check_circle_sharp),
                          title: const Text(
                              'Mitthi Aadhaar/Voter ID/Birth Certificate'),
                          trailing: IconButton(
                              onPressed: () {
                                downloadFile(context, data.attachment.idProof);
                              },
                              icon: const Icon(Icons.download)),
                        ),
                        sizedBoxHeight(10),
                        ListTile(
                          dense: true,
                          leading:
                              const Icon(size: 20, Icons.check_circle_sharp),
                          title: const Text('Motor hman man Voucher/Receipt'),
                          trailing: IconButton(
                              onPressed: () {
                                downloadFile(context, data.attachment.receipt);
                              },
                              icon: const Icon(Icons.download)),
                        ),
                        sizedBoxHeight(10),
                        ListTile(
                          dense: true,
                          leading:
                              const Icon(size: 20, Icons.check_circle_sharp),
                          title: const Text('Death Certificate'),
                          trailing: IconButton(
                              onPressed: () {
                                downloadFile(
                                    context, data.attachment.deathCertificate);
                              },
                              icon: const Icon(Icons.download)),
                        ),
                        sizedBoxHeight(10),
                        ListTile(
                          dense: true,
                          leading:
                              const Icon(size: 20, Icons.check_circle_sharp),
                          title: const Text('Diltu Aadhaar/Voter ID'),
                          trailing: IconButton(
                              onPressed: () {
                                downloadFile(context,
                                    data.attachment.additionalDocument);
                              },
                              icon: const Icon(Icons.download)),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ),
            Center(
              child: MaterialButton(
                elevation: 0,
                minWidth: Get.width * 0.6,
                height: 50,
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  'Back to Track',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            sizedBoxHeight(40)
          ],
        ),
      ),
    );
  }

  void downloadFile(
    BuildContext context,
    String? file,
  ) async {
    print(Routes.DOWNLOAD_URL(file.toString()));
    // try {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    final Directory directory = await getApplicationDocumentsDirectory();
    // final Directory directory = Directory('/storage/emulated/0/Download/Rti');
    String filePath = '${directory.path}/$file';
    Dio dio = Dio();
    // ignore: use_build_context_synchronously
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: 'File Downloading...');
    await dio.download(
      Routes.DOWNLOAD_URL(file!),
      filePath,
      onReceiveProgress: (count, total) {
        if (total != -1) {
          controller.downloadPercentage.value = ((count / total * 100).toInt());
          pd.update(value: controller.downloadPercentage.value);
        }
      },
    );
    pd.close();
    OpenFile.open(filePath);
    showDownloadSuccessSnackBar(
        'Success',
        'File downloaded successfully',
        const Icon(
          Icons.check,
          color: Colors.blue,
        ),
        filePath);
  }
}
