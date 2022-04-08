import 'package:get/get.dart';
import 'package:reddit_clone/models/response.dart';
import 'package:reddit_clone/services/http_services.dart';

class PostDataController extends GetxController {
  var postsModel = <ResponseModel>[].obs;

  getDataFromAPI() {
    HttpServices().getPostsData().then((value) {
      for (var i = 0; i < value!.data!.dist; i++) {
        postsModel.add(value);
      }
    });
  }
}
