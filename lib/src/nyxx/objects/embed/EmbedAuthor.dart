part of nyxx;

/// Author of embed. Can contain null elements.
class EmbedAuthor implements Downloadable {
  /// Name of embed author
  String name;

  /// Url to embed author
  String url;

  /// Url to author's url
  String iconUrl;

  /// Proxied icon url
  String iconProxyUrl;

  EmbedAuthor._new(Map<String, dynamic> raw) {
    this.name = raw['name'] as String;
    this.url = raw['url'] as String;
    this.iconUrl = raw['icon_url'] as String;
    this.iconProxyUrl = raw['iconProxyUrl'] as String;
  }

  @override
  Future<List<int>> download() => utils.downloadFile(Uri.parse(url));

  @override
  Future<File> downloadFile(File file) async =>
      file.writeAsBytes(await download());

  @override
  String toString() => name;

  @override
  int get hashCode => url.hashCode * 37 + name.hashCode * 37 + iconUrl.hashCode * 37;

  @override
  bool operator ==(other) => other is EmbedAuthor ? other.url == this.url && other.name == this.name && other.iconUrl == this.iconUrl : false;
}
