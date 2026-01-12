import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ruang_phur/constant/colors.dart';
import 'package:ruang_phur/constant/my_appbar.dart';
import 'package:ruang_phur/constant/reusable.dart';
import 'package:ruang_phur/constant/sized_box.dart';
import 'package:ruang_phur/controllers/home_controller.dart';
import 'package:ruang_phur/routes/routes.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class DownloadScreen extends GetView<HomeController> {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              width: Get.width,
              color: MyColors.stepperBackgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AutoSizeText(
                    'Download Notice',
                    style: TextStyle(fontSize: 24),
                  ),
                  sizedBoxHeight(10),
                  const AutoSizeText(
                    'Ruangphurh chungchuang mipui te hriattur chhuahna',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Obx(
                    () => controller.downloadList.isEmpty
                        ? const Center(
                            child: Text('No Data'),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.downloadList.length,
                            itemBuilder: (c, i) => ListTile(
                              focusColor: MyColors.stepperBackgroundColor,
                              tileColor: MyColors.stepperBackgroundColor,
                              dense: true,
                              title: Text(
                                controller.downloadList[i].title.toString(),
                              ),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_today_outlined,
                                        size: 18,
                                      ),
                                      Text(
                                        DateFormat('dd MMM yyyy').format(
                                          DateTime.parse(
                                            controller
                                                .downloadList[i].created_at
                                                .toString(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  sizedBoxWidth(40),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.access_time,
                                        size: 18,
                                      ),
                                      Text(
                                        DateFormat('hh:mm a ').format(
                                          DateTime.parse(
                                            controller
                                                .downloadList[i].created_at
                                                .toString(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  downloadFile(context,
                                      controller.downloadList[i].attachment);
                                },
                                icon: const Icon(
                                  Icons.file_download_outlined,
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void downloadFile(
    BuildContext context,
    String? file,
  ) async {
    print(file);
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
