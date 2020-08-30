class JobGov {
  String id;
  String companyLogo;
  String jobTitle;
  String companyName;
  String location;
  String postDate;
  String linkToJob;

  JobGov(
      {this.id,
      this.companyLogo,
      this.jobTitle,
      this.companyName,
      this.location,
      this.postDate,
      this.linkToJob});

  factory JobGov.fromJson(Map<String, dynamic> json) {
    return JobGov(
        id: json['id'],
        companyLogo: json['company_logo'].toString(),
        jobTitle: json['title'].toString(),
        companyName: json['company'].toString(),
        location: json['location'].toString(),
        postDate: json['created_at'].toString(),
        linkToJob: json['url'].toString());
  }
}
