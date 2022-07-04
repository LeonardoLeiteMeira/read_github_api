class SoftwareEntity {
  String name;
  String owner;
  String repo;

  SoftwareEntity(this.name, this.owner, this.repo);

  @override
  String toString() {
    return "$name, $owner, $repo\n";
  }
}
