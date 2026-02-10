import '../shared.dart';

abstract class MetaDto<L> {
  Meta? get meta;
  List<L> get list;
}
