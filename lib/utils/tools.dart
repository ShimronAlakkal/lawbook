class Tools {
  Tools();

  String dateFormatterFromDate({required DateTime date}) {
    String year = date.toString().substring(0, 4);
    String month = date.toString().substring(5, 7);
    String day = date.toString().substring(8, 10);
    return '$day/$month/$year';
  }
}
