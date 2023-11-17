class Functions{

  static String formatDate(String inputDate) {
    // Parse the input string to a DateTime object
    DateTime date = DateTime.parse(inputDate);

    // Define the month names abbreviation array
    List<String> months = [
      '', // 0 index is not used
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];

    // Extract month and day values
    int month = date.month;
    int day = date.day;

    // Format the date to 'MMM d'
    String formattedDate = '${months[month]} $day';

    return formattedDate;
  }
}