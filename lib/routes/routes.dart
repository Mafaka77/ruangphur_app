class Routes {
  static String BASE_URL = 'https://ruangphur.swta.msegs.in/api/';
  // static String BASE_URL = 'http://localhost:5001/api/';
  static String DOWNLOAD_URL(String fileName) =>
      'https://ruangphur.swta.msegs.in$fileName';

  static String GET_DISTRICT = '${BASE_URL}get-district';
  static String GET_CONSTITUENCY(String id) =>
      '${BASE_URL}get-constituency/$id';
  static String GET_RELATIVE = '${BASE_URL}get-relation';
  static String UPLOAD_MITTHI_DOCUMENT = '${BASE_URL}upload-mobile-file';
  static String SEND_OTP = '${BASE_URL}send-otp';
  static String VERIFY_OTP = '${BASE_URL}verify-otp';
  static String SUBMIT_FORM = '${BASE_URL}submit-form';
  static String TRACK_BY_ID(String trackingId) =>
      '${BASE_URL}track-application/$trackingId';
  static String GET_ALL_APPLICATIONS(String trackingId) =>
      '${BASE_URL}view-application/$trackingId';
  static String GET_FAQ(int limit) => '${BASE_URL}get-faq/$limit';
  static String GET_ALL_INFORMATION = '${BASE_URL}get-information';
  static String GET_RATE = '${BASE_URL}get-rate';
}
