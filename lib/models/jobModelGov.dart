class MatchedObjectDescriptor {
  String id;
  String companyLogo;
  String jobTitle;
  String companyName;
  String location;
  String postDate;
  String linkToJob;

  MatchedObjectDescriptor(
      {this.id,
      this.companyLogo,
      this.jobTitle,
      this.companyName,
      this.location,
      this.postDate,
      this.linkToJob});

  factory MatchedObjectDescriptor.fromJson(Map<String, dynamic> json) {
    return MatchedObjectDescriptor(
        id: json['PositionID'],
        // companyLogo: json['company_logo'].toString(),
        jobTitle: json['PositionTitle'].toString(),
        companyName: json['OrganizationName'].toString(),
        location: json['PositionLocationDisplay'].toString(),
        postDate: json['PublicationStartDate'].toString(),
        linkToJob: json['PositionURI'].toString());
  }
}

class SearchResultItems {
  MatchedObjectDescriptor matchedObjectDescriptor;

  SearchResultItems({this.matchedObjectDescriptor});

  factory SearchResultItems.fromJson(Map<String, dynamic> json) {
    return SearchResultItems(
        matchedObjectDescriptor: json['MatchedObjectDescriptor']);
  }
}

class SearchResult {
  List<SearchResultItems> searchResulItemsList;

  SearchResult({this.searchResulItemsList});

  factory SearchResult.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['SearchResult'] as List;
    List<SearchResultItems> searchResult =
        list.map((i) => SearchResultItems.fromJson(i)).toList();

    return SearchResult(searchResulItemsList: searchResult);
  }
}
