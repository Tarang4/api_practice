class ProductModal {
  List<Data>? data;
  Pagination? pagination;

  ProductModal({this.data, this.pagination});

  ProductModal.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  int? price;
  List<String>? imagesUrl;

  Data({this.id, this.name, this.description, this.price, this.imagesUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    imagesUrl = json['images_url'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['images_url'] = imagesUrl;
    return data;
  }
}

class Pagination {
  int? perPage;
  int? items;
  int? from;
  int? to;
  int? next;
  int? currentPage;
  int? totalPages;
  int? totalCount;

  Pagination(
      {this.perPage,
        this.items,
        this.from,
        this.to,
        this.next,
        this.currentPage,
        this.totalPages,
        this.totalCount});

  Pagination.fromJson(Map<String, dynamic> json) {
    perPage = json['per_page'];
    items = json['items'];
    from = json['from'];
    to = json['to'];
    next = json['next'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['per_page'] = perPage;
    data['items'] = items;
    data['from'] = from;
    data['to'] = to;
    data['next'] = next;
    data['current_page'] = currentPage;
    data['total_pages'] = totalPages;
    data['total_count'] = totalCount;
    return data;
  }
}