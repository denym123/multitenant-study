import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../shared.dart';

class PagingControllerHelper<Model, Dto extends MetaDto<Model>> {
  final Future<Dto> Function(int pageKey) fetchFunction;
  int? lastPageKey;
  late final PagingController<int, Model> controller;

  PagingControllerHelper({required this.fetchFunction}) : super() {
    bool? nullMeta;

    controller = PagingController<int, Model>(
      getNextPageKey: (state) {
        return state.lastPageIsEmpty ? null : state.nextIntPageKey;
      },
      fetchPage: (pageKey) async {
        bool isLastPage = lastPageKey != null && pageKey > lastPageKey!;
        bool metaNullAndSecondPage = nullMeta == true && pageKey > 1;

        if (isLastPage || metaNullAndSecondPage) {
          return List.empty();
        }
        return await fetchFunction(pageKey).then((dto) {
          lastPageKey = dto.meta?.lastPage;
          if (dto.meta == null) {
            nullMeta = true;
          }
          return dto.list;
        });
      },
    );
  }
}
