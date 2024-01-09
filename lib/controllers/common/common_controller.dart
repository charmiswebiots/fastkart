import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../config.dart';

class CommonController extends GetxController {
  final storage = GetStorage();
  double rateValue = 0.0;
  String priceSymbol = "₹";
  bool isLoading = false;

  //show loader
  void showLoading() {
    isLoading = true;
    update();
  }

  //hide loader
  void hideLoading() {
    isLoading = false;
    update();
  }

  //show toast
  showToast(error) {
    Fluttertoast.showToast(msg: error);
  }

  //bottom sheet for filter
  bottomSheet() {
    BottomSheetLayout().bottomSheet(child: const LanguageBottomSheet());
  }

  //currency bottom sheet for filter
  currencyBottomSheet() {
    BottomSheetLayout().bottomSheet(child: const CurrencyBottomSheet());
  }

  priceConvertor(to, currencySymbol) async {
    String from = storage.read(Session.currencyCode) ?? 'INR';
    var headers = {
      'apiKey': 'uxFOyt05OINcjyRzh5LRfRIsNwn3ODKh',
    };

    final response = await http.get(
        Uri.parse(
            'https://api.apilayer.com/fixer/latest?base=$from&symbols=$to'),
        headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      final rate = jsonResponse['rates'][to].toDouble();
      rateValue = rate;
      priceSymbol = currencySymbol;
      update();
      await storage.write(Session.currencyCode, to);
      await storage.write(Session.currencySymbol, currencySymbol);
      update();
    } else {
      throw Exception(response.statusCode);
    }
  }
}
