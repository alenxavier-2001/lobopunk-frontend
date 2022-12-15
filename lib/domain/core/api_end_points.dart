import 'package:lobopunk/core/contasts.dart';

class ApiEndPoints {
  static const auth = "${kBaseurl}auth/";
  static const getuserdata = "${kBaseurl}user/getuserdata/";
  static const getusername = "${kBaseurl}user/getusername/";
  static const getuserposts = "${kBaseurl}getuserposts/";
  static const edituserposts = "${kBaseurl}postediting/";
  static const updateuserdata = "${kBaseurl}user/updateuserdata/";
  static const updateusersociallink = "${kBaseurl}user/updateusersociallink/";
  static const updateuserprofileimage = "${kBaseurl}user/profilepicupload/";
  static const uploadpostfile = "${kBaseurl}postfileupload";
  static const uploadpostdata = "${kBaseurl}addpost";
  static const getsubscribedposts = "${kBaseurl}getallposts/";

//Post Section API
  static const likepost = "${kBaseurl}likepost";
  static const dislikepost = "${kBaseurl}dislikepost";

  //Comments api
  static const getcomment = "${kBaseurl}getcomment/";

  //post comment section
  static const commentpost = "${kBaseurl}comment";
  static const deletecomment = "${kBaseurl}deletebycommentid/";

  static const likecomment = "${kBaseurl}likecomment";
  static const dislikecomment = "${kBaseurl}dislikecomment";
  //sub comment
  static const subcommentpost = "${kBaseurl}subcomment";
  static const deletesubcomment = "${kBaseurl}deletesubcomment";
  static const likesubcomment = "${kBaseurl}likesubcomment";
  static const dislikesubcomment = "${kBaseurl}dislikesubcomment";
}
