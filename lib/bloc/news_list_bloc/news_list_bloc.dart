import 'dart:async';
import 'package:cointopper/repositories/repo.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'news_list_event.dart';
import 'news_list_state.dart';

class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  final CoinTopperRepository coinRepository;
  StreamSubscription _coinSubscription;

  NewsListBloc({@required this.coinRepository})
      : super(NewsListLoadInProgress());

  @override
  Stream<NewsListState> mapEventToState(NewsListEvent event) async* {
    if (event is LoadNewsList) {
      yield* _mapLoadNewsListState();
    }
    {
      if (event is UpdateNewsList) {
        yield* _mapUpdateNewsListListState(event);
      }
    }
  }

  Stream<NewsListState> _mapLoadNewsListState() async* {
    print("bloc enterred");
    _coinSubscription?.cancel();
    _coinSubscription = coinRepository.loadNewsList().listen(
          (list) => add(UpdateNewsList(list)),
        );
  }

  Stream<NewsListState> _mapUpdateNewsListListState(
      UpdateNewsList event) async* { 
    yield NewsListLoadSuccess(event.newsList);
  }

  @override
  Future<void> close() {
    _coinSubscription?.cancel();
    return super.close();
  }
}
