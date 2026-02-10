import 'package:flutter/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../shared.dart';

class PagedFutureHandler<Dto extends MetaDto<ItemType>, ItemType> {
  final Future<Dto> repositoryFunction;
  PagingController<int, ItemType> pagingController;
  ValueSetter<Dto>? onValue;
  void Function(Object e, StackTrace s)? catchError;

  PagedFutureHandler({
    required this.pagingController,
    required this.repositoryFunction,
    this.onValue,
    this.catchError,
  });

  Future<void> call() async {
    await repositoryFunction
        .then((response) {
          pagingController.value = PagingState(
            pages: pagingController.value.pages?..add(response.list),
            keys: List.generate(response.list.length, (index) => index),
            isLoading: false,
          );
        })
        .catchError((Object e, StackTrace s) {
          if (catchError != null) catchError!(e, s);
          throw e;
        });
  }
}
