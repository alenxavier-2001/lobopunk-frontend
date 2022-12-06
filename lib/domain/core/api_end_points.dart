import 'package:lobopunk/core/contasts.dart';

class ApiEndPoints {
  static const auth = "${kBaseurl}auth/";
  static const getuserdata = "${kBaseurl}user/getuserdata/";
  static const getuserposts = "${kBaseurl}getuserposts/";
  static const updateuserdata = "${kBaseurl}user/updateuserdata/";
  static const updateusersociallink = "${kBaseurl}user/updateusersociallink/";
  static const updateuserprofileimage = "${kBaseurl}user/profilepicupload/";
  static const uploadpostfile = "${kBaseurl}postfileupload";
  static const uploadpostdata = "${kBaseurl}addpost";
  static const getsubscribedposts = "${kBaseurl}getallposts/";
}
