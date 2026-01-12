import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ruang_phur/constant/my_snackbar.dart';
import 'package:ruang_phur/models/application_model.dart';
import 'package:ruang_phur/routes/routes.dart';
import 'package:ruang_phur/services/base_services.dart';

class TrackingServices extends BaseService {
  Future trackById(String trackingId) async {
    try {
      var response = await client.get(Routes.TRACK_BY_ID(trackingId));
      return response;
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future<Application?> getAllApplications(String trackingId) async {
    try {
      var response = await client.get(Routes.GET_ALL_APPLICATIONS(trackingId));
      if (response.statusCode == 200) {
        if (response.data['status'] == 200) {
          return Application.fromJson(response.data['data']);
        } else if (response.data['status'] == 404) {
          mySnackBar(
              response.data['message'],
              const Icon(
                Icons.warning,
                color: Colors.red,
              ));
        }
      }
    } catch (ex) {
      return Future.error(ex);
    }
    return null;
  }
}
