
import 'package:crafty_bay/data/models/response_data.dart';
import 'package:crafty_bay/data/models/review_list_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';
import '../../data/utility/urls.dart';

class ReviewListController extends GetxController {

  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  ReviewListModel _reviewListModel = ReviewListModel();
  ReviewListModel get reviewListModel => _reviewListModel;

  Future<bool> getReviewList(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final ResponseData response = await NetworkCaller().getRequest(Urls.getReviewListByProduct(productId));
    _inProgress = false;
    if(response.isSuccess){
      _reviewListModel = ReviewListModel.fromJson(response.responseBody);
      isSuccess = true;
    }
    else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }

  Future<bool> createReviewList({required String description, required int productId, required int rating}) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final Map<String, dynamic> inputParams = {
        "description": description,
        "product_id": productId,
        "rating": rating,
    };
    final ResponseData response = await NetworkCaller().postRequest(
        Urls.createReview,
    body: inputParams);
    _inProgress = false;
    if(response.isSuccess){
      // _reviewListModel = ReviewListModel.fromJson(response.responseBody);
      isSuccess = true;
    }
    else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }

}
