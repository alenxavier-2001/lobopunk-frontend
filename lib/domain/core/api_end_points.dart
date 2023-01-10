import 'package:lobopunk/core/contasts.dart';

class ApiEndPoints {
  static const auth = "${kBaseurl}auth/";
  static const getuserdata = "${kBaseurl}user/getuserdata/";
  static const getuserdatabyid = "${kBaseurl}user/getuserdatabyid/";
  static const getusername = "${kBaseurl}user/getusername/";
  static const getuserposts = "${kBaseurl}getuserposts/";
  static const getuserpostsbyid = "${kBaseurl}getuserpostsbyid/";
  static const edituserposts = "${kBaseurl}postediting/";
  static const updateuserdata = "${kBaseurl}user/updateuserdata/";
  static const updateusersociallink = "${kBaseurl}user/updateusersociallink/";
  static const updateuserprofileimage = "${kBaseurl}user/profilepicupload/";
  static const uploadpostfile = "${kBaseurl}postfileupload";
  static const uploadpostdata = "${kBaseurl}addpost";
  static const getsubscribedposts = "${kBaseurl}getallposts/";
//Home section
  static const getuserinterestedposts = "${kBaseurl}getuserinterestedpost/";

//Post Section API
  static const likepost = "${kBaseurl}likepost";
  static const dislikepost = "${kBaseurl}dislikepost";
  static const reportpost = "${kBaseurl}report";

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

  //=======================================//
  //public page Section
  static const getexplorepage = "${kBaseurl}getexplorepage";
  static const getcontinuepage = "${kBaseurl}continue/";

  static const searchUsers = "${kBaseurl}searchusers/";
  static const getsinglepost = "${kBaseurl}getsinglepost/";
  //punk a user
  static const punkUsers = "${kBaseurl}punk";

  //get hash tags
  static const gethashtags = "${kBaseurl}gethashtags";

//Repost Section
  static const repost = "${kBaseurl}repost";
  static const repostdelete = "${kBaseurl}deleterepost";
  static const repostrequest = "${kBaseurl}repostrequest";
  static const acceptrepostrequest = "${kBaseurl}acceptrepostrequest";
  static const rejectrepostrequest = "${kBaseurl}rejectrepostrequest";
  static const removerepostrequest = "${kBaseurl}removerepostrequest";
  static const getrepostreceivedrequests =
      "${kBaseurl}getrepostreceivedrequests";
  static const getrepostsentrequests = "${kBaseurl}getrepostsentrequests";
}
