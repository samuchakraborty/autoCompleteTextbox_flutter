import 'dart:convert';
import 'package:http/http.dart' as http;

class PlayersViewModel {
  static List<SearchApi> search = [];

  static Future loadPlayers(String query) async {
    try {
      http.Response jsonString = await http.get(
          "https://anazbd.com/api/search/tags?query=" + query,
          headers: headers);
      final jsonResponse = json.decode(jsonString.body);
      SearchModel searchModel = new SearchModel.fromJson(jsonResponse);
      //List<SearchApi> searchApi = [];

      print('hello');
      for (var i = 0; i < searchModel.searchApi.length; i++) {
        search.add(searchModel.searchApi[i]);
      }

      print(search);
      return search;
    } catch (e) {
      print(e);
    }
  }

//   static List<Product> searchProductShow = [];

//   static Future loadSearchProduct(String query) async {
//     try {
//       http.Response jsonString = await http
//           .get("https://anazbd.com/api/search?query=" + query, headers: headers);
//       final jsonResponse = json.decode(jsonString.body);
//       SearchProduct searchProduct = new SearchProduct.fromJson(jsonResponse);
//       //List<SearchApi> searchApi = [];
//       for (var i = 0; i < searchProduct.data.product.length; i++) {
//         searchProductShow.add(searchProduct.data.product[i]);
//         print(searchProduct.data.product[i]);
//       }
//       return search;

//     } catch (e) {
//       print(e);
//     }
//   }

// }

}

// class SearchProduct {
//   SearchProduct({
//     this.status,
//     this.message,
//     this.data,
//   });

//   String status;
//   String message;
//   Data data;

//   factory SearchProduct.fromJson(Map<String, dynamic> json) => SearchProduct(
//         status: json["status"],
//         message: json["message"],
//         data: Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": data.toJson(),
//       };
// }

// class Data {
//   Data({
//     this.currentPage,
//     this.product,
//     this.firstPageUrl,
//     this.from,
//     this.lastPage,
//     this.lastPageUrl,
//     this.nextPageUrl,
//     this.path,
//     this.perPage,
//     this.prevPageUrl,
//     this.to,
//     this.total,
//   });

//   int currentPage;
//   List<Product> product;
//   String firstPageUrl;
//   int from;
//   int lastPage;
//   String lastPageUrl;
//   String nextPageUrl;
//   String path;
//   int perPage;
//   dynamic prevPageUrl;
//   int to;
//   int total;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         currentPage: json["current_page"],
//         product:
//             List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
//         firstPageUrl: json["first_page_url"],
//         from: json["from"],
//         lastPage: json["last_page"],
//         lastPageUrl: json["last_page_url"],
//         nextPageUrl: json["next_page_url"],
//         path: json["path"],
//         perPage: json["per_page"],
//         prevPageUrl: json["prev_page_url"],
//         to: json["to"],
//         total: json["total"],
//       );

//   Map<String, dynamic> toJson() => {
//         "current_page": currentPage,
//         "data": List<dynamic>.from(product.map((x) => x.toJson())),
//         "first_page_url": firstPageUrl,
//         "from": from,
//         "last_page": lastPage,
//         "last_page_url": lastPageUrl,
//         "next_page_url": nextPageUrl,
//         "path": path,
//         "per_page": perPage,
//         "prev_page_url": prevPageUrl,
//         "to": to,
//         "total": total,
//       };
// }

// class Product {
//   Product({
//     this.name,
//     this.slug,
//     this.deliveryCharge,
//     this.featureImage,
//     this.warrantyPeriod,
//     this.warrantyPolicy,
//     this.highlights,
//     this.description,
//     this.featureImageResized,
//     this.thumbFeatureImage,
//     this.shortDescription,
//     this.additionalDeliveryCharge,
//     this.status,
//     this.deliverySizeId,
//     this.rating,
//     this.maxOrderableQty,
//     this.bestSeller,
//     this.digitalSheba,
//     this.isWishlisted,
//     this.originalPrice,
//     this.variants,
//   });

//   String name;
//   String slug;
//   String deliveryCharge;
//   String featureImage;
//   dynamic warrantyPeriod;
//   dynamic warrantyPolicy;
//   dynamic highlights;
//   String description;
//   String featureImageResized;
//   String thumbFeatureImage;
//   String shortDescription;
//   dynamic additionalDeliveryCharge;
//   String status;
//   String deliverySizeId;
//   String rating;
//   String maxOrderableQty;
//   String bestSeller;
//   String digitalSheba;
//   bool isWishlisted;
//   int originalPrice;
//   List<Variant> variants;

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         name: json["name"],
//         slug: json["slug"],
//         deliveryCharge: json["delivery_charge"],
//         featureImage: json["feature_image"],
//         warrantyPeriod: json["warranty_period"],
//         warrantyPolicy: json["warranty_policy"],
//         highlights: json["highlights"],
//         description: json["description"],
//         featureImageResized: json["feature_image_resized"],
//         thumbFeatureImage: json["thumb_feature_image"],
//         shortDescription: json["short_description"],
//         additionalDeliveryCharge: json["additional_delivery_charge"],
//         status: json["status"],
//         deliverySizeId: json["delivery_size_id"],
//         rating: json["rating"],
//         maxOrderableQty: json["max_orderable_qty"],
//         bestSeller: json["best_seller"],
//         digitalSheba: json["digital_sheba"],
//         isWishlisted: json["isWishlisted"],
//         originalPrice: json["original_price"],
//         variants: List<Variant>.from(
//             json["variants"].map((x) => Variant.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "slug": slug,
//         "delivery_charge": deliveryCharge,
//         "feature_image": featureImage,
//         "warranty_period": warrantyPeriod,
//         "warranty_policy": warrantyPolicy,
//         "highlights": highlights,
//         "description": description,
//         "feature_image_resized": featureImageResized,
//         "thumb_feature_image": thumbFeatureImage,
//         "short_description": shortDescription,
//         "additional_delivery_charge": additionalDeliveryCharge,
//         "status": status,
//         "delivery_size_id": deliverySizeId,
//         "rating": rating,
//         "max_orderable_qty": maxOrderableQty,
//         "best_seller": bestSeller,
//         "digital_sheba": digitalSheba,
//         "isWishlisted": isWishlisted,
//         "original_price": originalPrice,
//         "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
//       };
// }

// class Variant {
//   Variant({
//     this.colorId,
//     this.sizeId,
//     this.sku,
//     this.qty,
//     this.price,
//     this.salePrice,
//     this.mrp,
//     this.image,
//     this.imageResized,
//     this.saleStartDay,
//     this.saleEndDay,
//   });

//   dynamic colorId;
//   dynamic sizeId;
//   String sku;
//   String qty;
//   int price;
//   String salePrice;
//   dynamic mrp;
//   dynamic image;
//   dynamic imageResized;
//   DateTime saleStartDay;
//   DateTime saleEndDay;

//   factory Variant.fromJson(Map<String, dynamic> json) => Variant(
//         colorId: json["color_id"],
//         sizeId: json["size_id"],
//         sku: json["sku"],
//         qty: json["qty"],
//         price: json["price"],
//         salePrice: json["sale_price"],
//         mrp: json["mrp"],
//         image: json["image"],
//         imageResized: json["image_resized"],
//         saleStartDay: DateTime.parse(json["sale_start_day"]),
//         saleEndDay: DateTime.parse(json["sale_end_day"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "color_id": colorId,
//         "size_id": sizeId,
//         "sku": sku,
//         "qty": qty,
//         "price": price,
//         "sale_price": salePrice,
//         "mrp": mrp,
//         "image": image,
//         "image_resized": imageResized,
//         "sale_start_day":
//             "${saleStartDay.year.toString().padLeft(4, '0')}-${saleStartDay.month.toString().padLeft(2, '0')}-${saleStartDay.day.toString().padLeft(2, '0')}",
//         "sale_end_day":
//             "${saleEndDay.year.toString().padLeft(4, '0')}-${saleEndDay.month.toString().padLeft(2, '0')}-${saleEndDay.day.toString().padLeft(2, '0')}",
//       };
// }

Map<String, String> headers = {
  "HttpHeaders.contentTypeHeader": "application/json",
  'Charset': 'utf-8'
};

class SearchModel {
  SearchModel({
    this.status,
    this.message,
    this.searchApi,
  });

  String status;
  String message;
  List<SearchApi> searchApi;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        status: json["status"],
        message: json["message"],
        searchApi: List<SearchApi>.from(
            json["data"].map((x) => SearchApi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(searchApi.map((x) => x.toJson())),
      };
}

class SearchApi {
  SearchApi({
    this.id,
    this.name,
    this.status,
    //  this.createdAt,
    //  this.updatedAt,
  });

  int id;
  String name;
  int status;
  // DateTime createdAt;
  // DateTime updatedAt;

  factory SearchApi.fromJson(Map<String, dynamic> json) => SearchApi(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        //  createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        //   "created_at": createdAt.toIso8601String(),
        //   "updated_at": updatedAt.toIso8601String(),
      };
}
