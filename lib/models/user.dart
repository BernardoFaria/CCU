import '../report.dart';

class User {

  final String uid;
  List<Report> reports = [
    Report(name: '*****', cc: '*****', lastSession: '11/09', covidTest: 'teste.png'),
    Report(name: '*****', cc: '*****', lastSession: '12/09', covidTest: 'teste.png')
  ];


  List<Report> get reportsList {
    return reports;
  }

  void addReportsList(Report report) {
    reports.add(report) ;
  }

  User({ this.uid });

}