class Job {
  String id;
  String companyLogo;
  String jobTitle;
  String companyName;
  String location;
  String postDate;
  String linkToJob;

  Job(
      {this.id,
      this.companyLogo,
      this.jobTitle,
      this.companyName,
      this.location,
      this.postDate,
      this.linkToJob});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
        id: json['id'],
        companyLogo: json['company_logo'].toString(),
        jobTitle: json['title'].toString(),
        companyName: json['company'].toString(),
        location: json['location'].toString(),
        postDate: json['created_at'].toString(),
        linkToJob: json['url'].toString());
  }
}
