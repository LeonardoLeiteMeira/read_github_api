class GitHubSucessEntity {
  String softwareName;
  int numberOfIssues;
  int totalOfContributors;
  int totalOfCommits;
  double get commitsPerContributor {
    var result = (totalOfCommits / totalOfContributors).toStringAsFixed(3);
    return double.parse(result);
  }

  GitHubSucessEntity(this.softwareName, this.numberOfIssues,
      this.totalOfCommits, this.totalOfContributors);

  @override
  String toString() {
    return "$softwareName,$numberOfIssues,$totalOfContributors,$totalOfCommits,$commitsPerContributor\n";
  }
}
