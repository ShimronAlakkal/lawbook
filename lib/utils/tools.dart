import 'package:lawbook/models/file_model.dart';
import 'package:encrypt/encrypt.dart';
import 'package:lawbook/models/hearing_model.dart';
import 'package:lawbook/models/party_model.dart';

class Tools {
  Tools();

  String dateFormatterFromDate({required DateTime date}) {
    String year = date.toString().substring(0, 4);
    String month = date.toString().substring(5, 7);
    String day = date.toString().substring(8, 10);
    return '$day/$month/$year';
  }
}