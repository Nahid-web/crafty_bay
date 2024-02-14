
import 'package:crafty_bay/data/models/response_data.dart';
import 'package:crafty_bay/data/models/wish_list_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';
import '../../data/utility/urls.dart';

class WishListController extends GetxController {

  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  WishListModel _wishListModel = WishListModel();
  WishListModel get wishListModel => _wishListModel;

  Future<bool> getWishList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final ResponseData response = await NetworkCaller().getRequest(Urls.getWishList);
    _inProgress = false;
    if(response.isSuccess){
      _wishListModel = WishListModel.fromJson(response.responseBody);
      isSuccess = true;
    }
    else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }

  Future<bool> createWishList(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final ResponseData response = await NetworkCaller().getRequest(Urls.createWishList(productId));
    _inProgress = false;
    if(response.isSuccess){
      // _wishListModel = WishListModel.fromJson(response.responseBody);
      isSuccess = true;
    }
    else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }

  Future<bool> removeWishList(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final ResponseData response = await NetworkCaller().getRequest(Urls.removeWishList(productId));
    _inProgress = false;
    if(response.isSuccess){
      // _wishListModel = WishListModel.fromJson(response.responseBody);
      isSuccess = true;
    }
    else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
