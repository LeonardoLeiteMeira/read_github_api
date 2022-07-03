import 'package:dio/dio.dart';
import 'config/github_url_config.dart';

class GithubService {
  final Dio _dio = Dio();
  final GitHubUrlConfig _gitHubUrlConfig = GitHubUrlConfig();

  Future<int> getNumberOfIssues(String owner, String repo) async {
    var issuesUrl = _gitHubUrlConfig.getIssuesUrl(owner, repo);
    var response = await _dio.get(issuesUrl);
    if (response.statusCode == 200) {
      var issues = response.data["open_issues_count"];
      return issues;
    }
    throw ("Error to get issues");
  }

  Future<int> getNumberOfContributors(String owner, String repo) async {
    var contributorsUrl = _gitHubUrlConfig.getContributorsUrl(owner, repo);
    print(contributorsUrl);
    var response = await _dio.get(contributorsUrl);

    if (response.statusCode == 200) {
      var link = response.headers["link"];
      return _getTotalOfContributorsInlinkHeader(link!.first);
    }

    throw ("Error to get Contributors");
  }

  int _getTotalOfContributorsInlinkHeader(String link) {
    var split1 = link.split(",")[1];
    var toFind = (split1.split("&page="))[1];
    var numberAsString = "";

    for (var char in toFind.runes) {
      var result = int.tryParse(String.fromCharCode(char));
      if (result is int) {
        numberAsString += result.toString();
      } else {
        break;
      }
    }

    return int.parse(numberAsString);
  }
}
