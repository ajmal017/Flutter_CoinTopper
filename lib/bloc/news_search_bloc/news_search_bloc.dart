import 'dart:async';
import 'package:cointopper/repositories/repo.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'news_search_event.dart';
import 'news_search_state.dart';

class NewsSearchBloc extends Bloc<NewsSearchEvent, NewsSearchState> {
  final CoinTopperRepository coinRepository;
  StreamSubscription _coinSubscription;

  NewsSearchBloc({@required this.coinRepository})
      : super(NewsSearchLoadInProgress());

  @override
  Stream<NewsSearchState> mapEventToState(NewsSearchEvent event) async* {
    if (event is LoadNewsSearch) {
      yield* _mapLoadNewsSearchState(event.keyword);
    }
    {
      if (event is UpdateNewsSearch) {
        yield* _mapUpdateNewsSearchListState(event);
      }
    }
  }

  Stream<NewsSearchState> _mapLoadNewsSearchState(keyword) async* {
    _coinSubscription?.cancel();
    _coinSubscription = coinRepository.loadSearchNewsList(keyword).listen(
          (list) => add(UpdateNewsSearch(list)),
        );
  }

  Stream<NewsSearchState> _mapUpdateNewsSearchListState(
      UpdateNewsSearch event) async* { 
    yield NewsSearchLoadSuccess(event.newsSearchList);
  }

  @override
  Future<void> close() {
    _coinSubscription?.cancel();
    return super.close();
  }
}
