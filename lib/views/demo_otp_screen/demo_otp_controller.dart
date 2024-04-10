import '../../widgets/all_widgets.dart';

class DemoOtpController extends GetxController {
  String code = '';
  String error = '';

  btnBackClicked() {
    Get.back();
  }

  btnCloseClicked() {
    Get.back(result: '');
  }

  btnKeypadClicked(String digit) {
    if (code.length < 6) {
      code = code + digit;
      if (code.length == 6) {
        submit();
      }
    }
    update();
  }

  btnBackspaceClicked() {
    if (code.length > 0) {
      code = code.substring(0, code.length - 1);
    }
    update();
  }

  btnResendOtpClicked() {
    Get.back(result: '');
  }

  clear(String error) {
    code = '';
    this.error = error;
    update();
  }

  submit() {
    Get.loading();
    Future.delayed(Duration(milliseconds: 2000), () {
      final hardcodedCode = '123456';
      if (code == hardcodedCode) {
        Get.back(result: code);
      } else {
        clear(
            'OTP yang anda masukkan salah. OTP sebenarnya adalah $hardcodedCode.');
      }
      Get.back();
    });
  }
}
