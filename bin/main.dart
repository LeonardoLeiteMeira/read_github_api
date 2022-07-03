import 'package:read_github_api/github_service.dart';

void main(List<String> arguments) {
  //print('Hello world: ${read_github_api.calculate()}!');

  GithubService()
      .getNumberOfContributors("spring-projects", "spring-framework")
      .then((value) => print(value));
}
