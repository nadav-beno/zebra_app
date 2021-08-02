class contact {
  String name;
  String url; // location url for send data

  contact({required this.name, this.url = ''});

  void setName(name) {
    this.name = name;
  }
}
