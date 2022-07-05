class GitHubSucessEntity {
  String softwareName;
  int numberOfIssues;
  int totalOfContributors;
  int totalOfCommits;
  double get commitsPerContributor {
    return totalOfCommits / totalOfContributors;
  }

  GitHubSucessEntity(this.softwareName, this.numberOfIssues,
      this.totalOfCommits, this.totalOfContributors);

  @override
  String toString() {
    return "$softwareName,$numberOfIssues,$totalOfContributors,$totalOfCommits,$commitsPerContributor\n";
  }
}
