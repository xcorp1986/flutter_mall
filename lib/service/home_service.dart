import 'package:mall/entity/banner_entity.dart';
import 'package:mall/utils/http_util.dart';
import 'package:mall/api/api.dart';
import 'package:mall/entity/category_entity.dart';
import 'package:mall/entity/coupon_entity.dart';
import 'package:mall/entity/group_buy_entity.dart';
import 'package:mall/entity/product_entity.dart';
import 'package:mall/constant/string.dart';

typedef OnSuccessList<T>(List<T> banners);

typedef OnFail(String message);

class HomeService {
  Future getBannerData(OnSuccessList onSuccessList, {OnFail onFail}) async {
    try {
      var responseList = [];
      var response = await HttpUtil.instance.get(Api.BANNER_URL);
      if (response['errno'] == 0) {
        responseList = response['data'];
        print(responseList);
        BannerListEntity bannerListEntity =
            BannerListEntity.fromJson(responseList);
        onSuccessList(bannerListEntity.bannerEntitys);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future getCategoryData(OnSuccessList onSuccessList, {OnFail onFail}) async {
    try {
      var responseList = [];
      var response = await HttpUtil.instance.get(Api.CATEGORY_URL);
      if (response['errno'] == 0) {
        responseList = response['data'];
        CategoryListEntity categoryListEntity =
            CategoryListEntity.fromJson(responseList);
        onSuccessList(categoryListEntity.categoryEntityList);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future getCouponData(OnSuccessList onSuccessList, {OnFail onFail}) async {
    try {
      var responseList = [];
      var response = await HttpUtil.instance.get(Api.COUPON_URL);
      if (response['errno'] == 0) {
        responseList = response['data'];
        CouponListEntity couponListEntity =
            CouponListEntity.fromJson(responseList);
        onSuccessList(couponListEntity.couponEntityList);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future getGroupBy(OnSuccessList onSuccessList, {OnFail onFail}) async {
    try {
      var responseList = [];
      var response = await HttpUtil.instance.get(Api.GROUP_BY_URL);
      if (response['errno'] == 0) {
        responseList = response['data'];
        GroupBuyListEntity groupBugListEntity =
            GroupBuyListEntity.fromJson(responseList);
        onSuccessList(groupBugListEntity.groupBuyEntitys);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future getNewProduct(OnSuccessList onSuccessList, {OnFail onFail}) async {
    try {
      var responseList = [];
      var response = await HttpUtil.instance.get(Api.HOME_PRODUCT_URL);
      if (response['errno'] == 0) {
        responseList = response['data'];
        ProductListEntity productListEntity =
            ProductListEntity.fromJson(responseList);
        onSuccessList(productListEntity.productEntitys);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future getHotProduct(OnSuccessList onSuccessList, {OnFail onFail}) async {
    try {
      var responseList = [];
      var response = await HttpUtil.instance.get(Api.HOME_HOT_PRODUCT_URL);
      if (response['errno'] == 0) {
        responseList = response['data'];
        ProductListEntity productListEntity =
            ProductListEntity.fromJson(responseList);
        onSuccessList(productListEntity.productEntitys);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }
}