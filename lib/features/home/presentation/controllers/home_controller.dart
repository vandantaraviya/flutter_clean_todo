import 'package:get/get.dart';

//
// class IsolateMessage {
//   final SendPort sendPort;
//   final RootIsolateToken token;
//   final List<UserFeedPost> posts;
//   // Function(String)? onError;
//   // final String userContentId;
//   // final String type; // 'error' or 'refreshed'
//   // final String? errorMessage;
//
//   IsolateMessage({
//     required this.sendPort,
//     required this.posts,
//     required this.token,
//     // required this.onError,
//   });
// }
//
// class UserFeedCheckBoxItem {
//   final String name;
//   bool? isSelected;
//
//   UserFeedCheckBoxItem({required this.name, this.isSelected = false});
//   @override
//   String toString() {
//     return name;
//   }
// }

class HomeController extends GetxController {
  // final _apiServices = Get.find<ApiServices>();

  // Future<UserFeedModel?> fetchUserFeed({required int pageNumber, required bool isNewCall}) async {
  //   isFeedLoading.value = true;
  //   userFeedData.value = UserFeedModel();
  //
  //   if (isNewCall) {
  //     feedPostList.value = [];
  //   }
  //   List<UserFeedCheckBoxItem> _selectedList = getSelectedItems();
  //   _categoryFilterList.value = [];
  //   _selectedList.forEach((UserFeedCheckBoxItem item) {
  //     _categoryFilterList.add(item.name);
  //   });
  //
  //   String filterCategoriesString = _categoryFilterList.join(',');
  //
  //   try {
  //     final response = await _apiServices.get(
  //       endPoint: ApiEndpoints.getUserFeed,
  //       queryParameters: {
  //         "Pagination.PageNumber": pageNumber,
  //         "Pagination.PageSize": pageItemSize.value,
  //         "CategoryFilter": filterCategoriesString,
  //       },
  //     );
  //     if (response != null) {
  //       if (response.statusCode == 200) {
  //         var data = response.data;
  //         userFeedData.value = UserFeedModel.fromMap(data);
  //         currentPageIndex.value = _userFeedData.value.pageNumber!;
  //         totalPageIndex.value = _userFeedData.value.totalPages!;
  //
  //         feedPostList.addAll(_userFeedData.value.data!.posts!);
  //
  //         // // // Cache content of the first post immediately
  //         // // try {
  //         // //   await cacheManagerService.getHomeFeedCacheManager().getSingleFile(_userFeedData.value.data!.posts![0].contentUri!,
  //         // //       key: postCacheKey(id: _userFeedData.value.data!.posts![0].userContentId!));
  //         // // } catch (e) {
  //         // //   log(e.toString(), name: "post");
  //         // // }
  //         // await cacheManagerService.getHomeFeedCacheManager().emptyCache();
  //         // // Extract content of remaining posts for background caching
  //         // List<Post> remainingPosts = List<Post>.from(_userFeedData.value.data!.posts!);
  //         //
  //         // // Start background caching
  //
  //         // cacheContentInBackground(posts: remainingPosts);
  //
  //         isFeedLoading.value = false;
  //         return _userFeedData.value;
  //       } else {
  //         isFeedLoading.value = false;
  //         return null;
  //       }
  //     } else {
  //       isFeedLoading.value = false;
  //       return null;
  //     }
  //   } on DioException catch (dioErr) {
  //     isFeedLoading.value = false;
  //     if (dioErr.response != null) {
  //       final data = dioErr.response!.data;
  //
  //       CustomSnackBar.errorSnackBar(
  //         message: data['message'] ?? "somethingWentWrong".tr,
  //       );
  //     } else {
  //       CustomSnackBar.errorSnackBar(
  //         message: "somethingWentWrong".tr,
  //       );
  //     }
  //     log(dioErr.toString());
  //     return null;
  //   } catch (err) {
  //     isFeedLoading.value = false;
  //     log(err.toString());
  //     return null;
  //   }
  // }
  //

}
