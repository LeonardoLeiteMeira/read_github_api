class GitHubSucessEntity {
  int numberOfIssues;
  int totalOfContributors;
  int totalOfCommits;
  get commitsPerContributor {
    return totalOfCommits / totalOfContributors;
  }

  GitHubSucessEntity(
      this.numberOfIssues, this.totalOfCommits, this.totalOfContributors);

  @override
  String toString() {
    return "$numberOfIssues, $totalOfContributors, $totalOfCommits $commitsPerContributor\n";
  }
}
