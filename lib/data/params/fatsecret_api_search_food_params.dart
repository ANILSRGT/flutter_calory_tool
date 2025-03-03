class FatsecretApiSearchFoodParams {
  FatsecretApiSearchFoodParams({required this.query, this.pageNumber = 0});

  final String query;
  final int pageNumber;

  static const String searhExpressionKey = 'search_expression';
  static const String pageNumberKey = 'page_number';

  Map<String, dynamic> toMap() {
    return {searhExpressionKey: query, pageNumberKey: pageNumber};
  }
}
