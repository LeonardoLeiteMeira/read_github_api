import 'package:read_github_api/github_service.dart';
import 'package:read_github_api/file_service.dart';

void main(List<String> arguments) {
  // GithubService()
  //     .getNumberOfCommits("spring-projects", "spring-framework")
  //     .then((value) => print(value));
  FileService().getSoftwareList().then((list) {
    // FileService().writeSoftwareList(list);
  });
}
