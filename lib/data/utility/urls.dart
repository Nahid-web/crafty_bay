class Urls{
 static const String _baseUrl = 'https://craftybay.teamrabbil.com/api';
 static String sendEmailOtp(String email) => '$_baseUrl/UserLogin/$email';
 static String verifyOtp(String email, String otp) => '$_baseUrl/VerifyLogin/$email/$otp';
 static const String readProfile = '$_baseUrl/ReadProfile';
 static const String createProfile = '$_baseUrl/CreateProfile';
 static const String homeBanner = '$_baseUrl/ListProductSlider';
 static const String categoryList = '$_baseUrl/CategoryList';

 static const String popularProductList = '$_baseUrl/ListProductByRemark/popular';
 static const String newProductList = '$_baseUrl/ListProductByRemark/new';
 static const String specialProductList = '$_baseUrl/ListProductByRemark/special';

 static String productsByCategory(categoryId) => '$_baseUrl/ListProductByCategory/$categoryId';

 static String productsByProductId(productId) => '$_baseUrl/ProductDetailsById/$productId';

 static const String addToCart = '$_baseUrl/CreateCartList';

 static const String getCartList = '$_baseUrl/CartList';
}