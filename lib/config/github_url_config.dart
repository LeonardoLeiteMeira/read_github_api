class GitHubUrlConfig {
  final String _baseUrl = "https://api.github.com/repos/";
  final String _issues = "{OWNER}/{REPO}";
  final String _contributors =
      "{OWNER}/{REPO}/contributors?per_page={PAGE_SIZE}&anon=true";
  final String _commits = "{OWNER}/{REPO}/commits?per_page={PAGE_SIZE}";

  String getIssuesUrl(String owner, String repo) {
    var issuesUrl = _issues.replaceFirst("{OWNER}", owner);
    issuesUrl = issuesUrl.replaceFirst("{REPO}", repo);

    return _baseUrl + issuesUrl;
  }

  String getContributorsUrl(String owner, String repo) {
    var contributorsUrl = _contributors.replaceFirst("{OWNER}", owner);
    contributorsUrl = contributorsUrl.replaceFirst('{REPO}', repo);
    contributorsUrl = contributorsUrl.replaceFirst("{PAGE_SIZE}", "1");

    return _baseUrl + contributorsUrl;
  }

  String getCommitsUrl(String owner, String repo) {
    var commitsUrl = _commits.replaceFirst("{OWNER}", owner);
    commitsUrl = commitsUrl.replaceFirst('{REPO}', repo);
    commitsUrl = commitsUrl.replaceFirst("{PAGE_SIZE}", "1");

    return _baseUrl + commitsUrl;
  }
}
