
import 'package:crafty_bay/data/models/product_list_model.dart';
import 'package:crafty_bay/data/models/response_data.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';
import '../../data/utility/urls.dart';

class NewProductController extends GetxController {

  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  ProductListModel _productListModel = ProductListModel();

  ProductListModel get productListModel => _productListModel;

  Future<bool> getNewProductList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final ResponseData response = await NetworkCaller().getRequest(Urls.newProductList);
    _inProgress = false;
    if(response.isSuccess){
      _productListModel = ProductListModel.fromJson(response.responseBody);
      isSuccess = true;
    }
    else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
