import 'package:dio/dio.dart';
import 'package:read_github_api/config/env.dart';
import '../config/github_url_config.dart';

class GithubService {
  final Dio _dio = Dio();
  final GitHubUrlConfig _gitHubUrlConfig = GitHubUrlConfig();

  GithubService() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: ((options, handler) {
      var githubPersonalToken = Env().gitHubPersonalToken;
      options.headers.addAll({"Authorization": "Token $githubPersonalToken"});
      return handler.next(options);
    })));
  }

  Future<int> getNumberOfIssues(String owner, String repo) async {
    var issuesUrl = _gitHubUrlConfig.getIssuesUrl(owner, repo);
    var response = await _dio.get(issuesUrl);
    if (response.statusCode == 200) {
      var issues = response.data["open_issues_count"];
      return issues;
    }
    print(response.data);
    throw ("Error to get total of issues");
  }

  Future<int> getNumberOfContributors(String owner, String repo) async {
    var contributorsUrl = _gitHubUrlConfig.getContributorsUrl(owner, repo);
    var response = await _dio.get(contributorsUrl);

    if (response.statusCode == 200) {
      var link = response.headers["link"];
      return _getTotalOfPagesInLinkHeader(link!.first);
    }

    throw ("Error to get total of Contributors");
  }

  Future<int> getNumberOfCommits(String owner, String repo) async {
    var commitsUrl = _gitHubUrlConfig.getCommitsUrl(owner, repo);
    var response = await _dio.get(commitsUrl);
    if (response.statusCode == 200) {
      var link = response.headers["link"];
      return _getTotalOfPagesInLinkHeader(link!.first);
    }
    throw ("Error to get total of commits");
  }

  int _getTotalOfPagesInLinkHeader(String link) {
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
