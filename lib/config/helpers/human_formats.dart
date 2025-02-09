import 'package:intl/intl.dart';

class HumanFormats {
  static String number(double number, {int decimal = 0}){
    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: decimal,
      symbol: '',
      locale:'en' 
    ).format(number);

    return formattedNumber;
  }

  static String dayNameMonthNumber(){
    
    final actualdate = DateFormat('EEEE d').format(DateTime.now());

    return actualdate;
  }
}