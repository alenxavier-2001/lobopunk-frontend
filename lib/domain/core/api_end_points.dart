import 'package:lobopunk/core/contasts.dart';

class ApiEndPoints {
  static const auth = "${kBaseurl}auth/";
  static const getuserdata = "${kBaseurl}user/getuserdata/";
  static const getusername = "${kBaseurl}user/getusername/";
  static const getuserposts = "${kBaseurl}getuserposts/";
  static const updateuserdata = "${kBaseurl}user/updateuserdata/";
  static const updateusersociallink = "${kBaseurl}user/updateusersociallink/";
  static const updateuserprofileimage = "${kBaseurl}user/profilepicupload/";
  static const uploadpostfile = "${kBaseurl}postfileupload";
  static const uploadpostdata = "${kBaseurl}addpost";
  static const getsubscribedposts = "${kBaseurl}getallposts/";

  static const likepost = "${kBaseurl}likepost";
  static const dislikepost = "${kBaseurl}dislikepost";
}
