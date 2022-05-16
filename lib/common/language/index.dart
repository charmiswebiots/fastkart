import 'package:fastkart/common/language/ar.dart';
import 'package:get/get.dart';
import 'en.dart';
import 'hi.dart';
import 'kr.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'hi_IN': hi,
        'ar_AE': ar,
        'ko_KR': kr,
      };
}
