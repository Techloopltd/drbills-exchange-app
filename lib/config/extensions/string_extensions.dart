import 'package:intl/intl.dart';

extension AssetStrings on String {
  String get png => 'assets/images/$this.png';
  String get jpg => 'assets/images/$this.jpg';
  String get svg => 'assets/icons/$this.svg';
}

extension StringExtension on String {
  String get capitalize {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String get withNaira {
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    mathFunc(Match match) => '${match[1]},';
    var nairaV = replaceAllMapped(reg, mathFunc);

    return "₦$nairaV";
  }
}

extension NairaFormatted on double {
  String get formatedNaira {
    final formatter = NumberFormat.currency(locale: "en_NG", symbol: "₦");

    var formatted = formatter.format(this);

    return formatted;
  }
}
