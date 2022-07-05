import 'package:read_github_api/github_success_metrics.dart';

void main(List<String> arguments) {
  var githubSuccessMetrics = GithubSucsessMetrics();

  githubSuccessMetrics.readSuccessMetrics();
  // githubSuccessMetrics.saveSuccessMetricsAsCSV();
}
