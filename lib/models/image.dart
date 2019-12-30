class Img {
  final String id, author, url, downloadUrl;
  final int width, height;
  const Img(this.id, this.author, this.width, this.height, this.url,
      this.downloadUrl);
  Img.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.author = json['author'],
        this.width = json['width'],
        this.height = json['height'],
        this.url = json['url'],
        this.downloadUrl = json['downloadUrl'];
}
