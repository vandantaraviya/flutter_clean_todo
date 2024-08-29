enum ContentSortType {
  uploadedDateDesc,
  uploadedDate,
  mostLiked,
  expiredDate,
  favorites,
}

enum SearchFilterType {
  mostliked,
  montages,
  mostdubs,
  screenshots,
  gameclips,
}

enum LocatorType { download, thumbnailSmall, thumbnailLarge, unknown }

enum ContentStoragePlatformEnum {
  azureContainer,
  xboxServer,
}

enum UserLikeStatus {
  none,
  like,
  emptyLike,
  dislike,
  emptyDislike,
}

enum Status {
  isLoading,
  isError,
  isSuccess,
  isEmpty,
}
