class CoinData {
  int? id;
  String? slug;
  String? symbol;
  String? name;
  String? type;
  String? category;
  num? rank;
  num? Volume24hBase;
  Values? values;
  List<Tokens> tokens;
  List<Links> links;
  num? circlatingSupply;
  num? totalSupply;
  num? maxSupply;
  String? lastUpdated;
  Images? images;

  CoinData({
    this.id,
    this.slug,
    this.symbol,
    this.name,
    this.type,
    this.category,
    this.rank,
    this.Volume24hBase,
    this.values,
    required this.tokens,
    required this.links,
    this.circlatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.lastUpdated,
    this.images,
  });

  CoinData.fromJson(Map<String,dynamic> json){
    id = json['id'];
    slug = json['slug'];
    symbol = json['symbol'];
    name = json['name'];
    type = json['type'];
    category = json['category'];
    rank = json['rank'];
    Volume24hBase = json['Volume24hBase'];
    values = json['values'] != null ? Values.fromJson(json['values']) : null;
    if (json['tokens'] != null) {
      tokens = <Tokens>[];
      json['tokens'].forEach((v){
        tokens.add(Tokens.fromJson(v));
      });
    }
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v){
        links.add(Links.fromJson(v));
      });
    }
    circlatingSupply = json['circlatingSupply'];
    totalSupply = json['totalSupply'];
    maxSupply = json['maxSupply'];
    lastUpdated = json['lastUpdated'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = <String,dynamic>{}; 
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['type'] = this.type;
    data['category'] = this.category;
    data['rank'] = this.rank;
    data['Volume24hBase'] = this.Volume24hBase;
    if (values != null) {
      data['values'] = values!.toJson();
    }
    if (tokens != null) {
      data['tokens'] = tokens.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links.map((v) => v.toJson()).toList();
    }
    data['circlatingSupply'] = this.circlatingSupply;
    data['totalSupply'] = this.totalSupply;
    data['maxSupply'] = this.maxSupply;
    data['lastUpdated'] = this.lastUpdated;
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    return data;
  }

}