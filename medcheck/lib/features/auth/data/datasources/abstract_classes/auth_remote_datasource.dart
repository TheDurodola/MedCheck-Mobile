import '../../models/registration_model.dart';
import '../../models/sign_up_request_model.dart';
import '../../models/user_model.dart';
import '../../models/login_request_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> loginUser(SignInRequestModel request);
  Future<RegistrationModel> signUpCustomer(SignUpRequestModel request);
}



