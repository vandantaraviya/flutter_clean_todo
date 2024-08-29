import 'package:get/get.dart';
// import 'package:timer_count_down/timer_controller.dart';



enum SupportState {
  unknown,
  supported,
  unsupported,
}

class AuthController extends GetxController {
  // final StorageService storageService;
  // final LoginWithEmailPasswordUseCase loginWithEmailPasswordUseCase;
  //
  // AuthController({required this.storageService, required this.loginWithEmailPasswordUseCase});
  //
  // ///---------------------------------------------------------------------------------------------------
  // /// Non Xbox controllers , FocusNodes and FormKeys
  // ///---------------------------------------------------------------------------------------------------
  //
  // ///Text Controllers for non-xbox
  // late TextEditingController nonXboxUserNameController;
  // late TextEditingController nonXboxEmailController;
  // late TextEditingController nonXboxPasswordController;
  // late TextEditingController nonXboxConfirmPasswordController;
  //
  // /// Form key for non-xbox
  // late GlobalKey<FormState> nonXboxUserNameFormKey;
  // late GlobalKey<FormState> nonXboxEmailFormKey;
  // late GlobalKey<FormState> nonXboxPasswordFormKey;
  // late GlobalKey<FormState> nonXboxConfirmPasswordFormKey;
  //
  // /// FocusNode for non-xbox
  // late FocusNode nonXboxUserNameFocusNode;
  // late FocusNode nonXboxEmailFocusNode;
  // late FocusNode nonXboxPasswordFocusNode;
  // late FocusNode nonXboxConfirmPasswordFocusNode;
  //
  // ///---------------------------------------------------------------------------------------------------
  // ///---------------------------------------------------------------------------------------------------
  //
  // final Rx<UserModel> _userData = UserModel().obs;
  //
  // Rx<UserModel> get userData => _userData;
  //
  // // Rx<PlanModel> _userCurrentPlan = PlanModel().obs;
  // // Rx<PlanModel> get userCurrentPlan => _userCurrentPlan;
  //
  // final RxBool _isLoginEmailValid = true.obs;
  //
  // RxBool get isLoginEmailValid => _isLoginEmailValid;
  //
  // final RxBool _isNonXboxSignupLoginEmailValid = true.obs;
  //
  // RxBool get isNonXboxSignupLoginEmailValid => _isNonXboxSignupLoginEmailValid;
  //
  // final RxBool _isNonXboxSignupUserNameValid = true.obs;
  //
  // RxBool get isNonXboxSignupUserNameValid => _isNonXboxSignupUserNameValid;
  //
  // final RxBool _isLoginPasswordValid = true.obs;
  //
  // RxBool get isLoginPasswordValid => _isLoginPasswordValid;
  //
  // final Rx<SupportState> _supportState = SupportState.unknown.obs;
  //
  // Rx<SupportState> get supportState => _supportState;
  //
  // final Rx<bool> _canCheckBiometrics = false.obs;
  //
  // Rx<bool> get canCheckBiometrics => _canCheckBiometrics;
  //
  // // RxString _authorized = 'Not Authorized'.obs;
  // // RxString get authorized => _authorized;
  //
  // // RxBool _isAuthenticating = false.obs;
  // // RxBool get isAuthenticating => _isAuthenticating;
  //
  // final RxBool _isLoginPasswordObscureText = true.obs;
  //
  // RxBool get isLoginPasswordObscureText => _isLoginPasswordObscureText;
  //
  // final RxBool _isNonXboxLoginPasswordObscureText = true.obs;
  //
  // RxBool get isNonXboxLoginPasswordObscureText => _isNonXboxLoginPasswordObscureText;
  //
  // final RxBool _isNonXboxLoginConfirmPasswordObscureText = true.obs;
  //
  // RxBool get isNonXboxLoginConfirmPasswordObscureText => _isNonXboxLoginConfirmPasswordObscureText;
  //
  // // RxBool _isLocalAuthorize = false.obs;
  // // RxBool get isLocalAuthorize => _isLocalAuthorize;
  //
  // final RxBool _isNonXboxUser = false.obs;
  //
  // RxBool get isNonXboxUser => _isNonXboxUser;
  //
  // final RxString _webViewUrl = "https://google.com".obs;
  //
  // RxString get webViewUrl => _webViewUrl;
  //
  // final RxBool _isXboxUrlLoading = false.obs;
  //
  // RxBool get isXboxUrlLoading => _isXboxUrlLoading;
  //
  // final Rx<String> _forgotEmail = "".obs;
  //
  // Rx<String> get forgotEmail => _forgotEmail;
  //
  // late Rx<Timer> _timer;
  //
  // Rx<Timer> get timer => _timer;
  // //
  // // final Rx<CountdownController> _countdownController = CountdownController().obs;
  // //
  // // Rx<CountdownController> get countdownController => _countdownController;
  //
  // final RxBool _isBiometricEnable = false.obs;
  //
  // RxBool get isBiometricEnable => _isBiometricEnable;
  //
  // void initSignupUtils() {
  //   ///Text Controllers for non-xbox
  //   nonXboxUserNameController = TextEditingController();
  //   nonXboxEmailController = TextEditingController();
  //   nonXboxPasswordController = TextEditingController();
  //   nonXboxConfirmPasswordController = TextEditingController();
  //
  //   /// Form key for non-xbox
  //   nonXboxUserNameFormKey = GlobalKey<FormState>();
  //   nonXboxEmailFormKey = GlobalKey<FormState>();
  //   nonXboxPasswordFormKey = GlobalKey<FormState>();
  //   nonXboxConfirmPasswordFormKey = GlobalKey<FormState>();
  //
  //   /// FocusNode for non-xbox
  //   nonXboxUserNameFocusNode = FocusNode();
  //   nonXboxEmailFocusNode = FocusNode();
  //   nonXboxPasswordFocusNode = FocusNode();
  //   nonXboxConfirmPasswordFocusNode = FocusNode();
  // }
  //
  // void disposeSignupUtils() {
  //   nonXboxUserNameController.dispose();
  //   nonXboxEmailController.dispose();
  //   nonXboxPasswordController.dispose();
  //   nonXboxConfirmPasswordController.dispose();
  //   nonXboxUserNameFocusNode.dispose();
  //   nonXboxEmailFocusNode.dispose();
  //   nonXboxPasswordFocusNode.dispose();
  //   nonXboxConfirmPasswordFocusNode.dispose();
  // }
  //
  // void onTapOutSideNonXbox() {
  //   nonXboxUserNameFocusNode.unfocus();
  //   nonXboxEmailFocusNode.unfocus();
  //   nonXboxPasswordFocusNode.unfocus();
  //   nonXboxConfirmPasswordFocusNode.unfocus();
  //   if (nonXboxUserNameController.text.isEmpty) {
  //     nonXboxUserNameFormKey.currentState?.reset();
  //     nonXboxUserNameController.text = "";
  //     isNonXboxSignupUserNameValid.value = true;
  //   }
  //   if (nonXboxEmailController.text.isEmpty) {
  //     nonXboxEmailFormKey.currentState?.reset();
  //     nonXboxEmailController.text = "";
  //     isNonXboxSignupLoginEmailValid.value = true;
  //   }
  //   if (nonXboxPasswordController.text.isEmpty) {
  //     nonXboxPasswordFormKey.currentState?.reset();
  //     nonXboxPasswordController.text = "";
  //   }
  //   if (nonXboxConfirmPasswordController.text.isEmpty) {
  //     nonXboxConfirmPasswordFormKey.currentState?.reset();
  //     nonXboxConfirmPasswordController.text = "";
  //   }
  // }
  //
  // Future<void> showLoader() async {
  //   var a = LoadingOverlayManager();
  //   a.showAssetLoadingAnimation();
  //   // await Future.delayed(const Duration(seconds: 5));
  //   // a.hide();
  // }
  //
  // Future<void> loginWithEmailPassword({
  //   required String email,
  //   required String password,
  //   required BuildContext context,
  // }) async {
  //   // loading(show: true, title: "Authenticating...");
  //   try {
  //     var response = await loginWithEmailPasswordUseCase.call(params: LoginWithEmailPasswordParams(email: email, password: password));
  //     response.fold((baseFailure) {
  //       log(baseFailure.toString());
  //     }, (UserModel userModel) {
  //       log(userModel.firstName ?? "", name: "userEntity");
  //     });
  //   } on DioException catch (ex) {
  //     if (ex.response != null) {
  //       final data = ex.response!.data;
  //
  //       CustomSnackBar.errorSnackBar(message: data['message'] ?? "somethingWentWrong".tr);
  //     } else {
  //       CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
  //     }
  //   } catch (e) {
  //     CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
  //     log(e.toString());
  //   } finally {
  //     // loading(show: false);
  //   }
  // }
}
