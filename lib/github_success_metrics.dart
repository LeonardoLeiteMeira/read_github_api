import 'package:read_github_api/services/file_service.dart';
import 'package:read_github_api/services/github_service.dart';
import 'entity/github_success_entity.dart';

class GithubSucsessMetrics {
  final FileService _fileService = FileService();
  final GithubService _githubService = GithubService();

  List<GitHubSucessEntity> githubSuccess = [];

  void readSuccessMetrics() async {
    var softwareList = await _fileService.getSoftwareList();
    var successList = <GitHubSucessEntity>[];

    for (var software in softwareList) {
      var issues =
          await _githubService.getNumberOfIssues(software.owner, software.repo);
      var commits = await _githubService.getNumberOfCommits(
          software.owner, software.repo);
      var contributors = await _githubService.getNumberOfContributors(
          software.owner, software.repo);

      var success =
          GitHubSucessEntity(software.name, issues, commits, contributors);

      successList.add(success);
    }
  }

  void saveSuccessMetricsAsCSV(List<GitHubSucessEntity> successMetrics) {}
}
