import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cointopper/repositories/repo.dart';
import 'package:meta/meta.dart';

import 'news_details_event.dart';
import 'news_details_state.dart';

class NewsDetailsBloc extends Bloc<NewsDetailsEvent, NewsDetailsState> {
  final CoinTopperRepository coinRepository;
  StreamSubscription _coinSubscription;

  NewsDetailsBloc({@required this.coinRepository})
      : super(NewsDetailsLoadInProgress());

  @override
  Stream<NewsDetailsState> mapEventToState(NewsDetailsEvent event) async* {
    if (event is LoadNewsDetails) {
      yield* _mapLoadNewsDetailsState(event.id);
    }
    {
      if (event is UpdateNewsDetails) {
        yield* _mapUpdateNewsDetailsListState(event);
      }
    }
  }

  Stream<NewsDetailsState> _mapLoadNewsDetailsState(id) async* {
    _coinSubscription?.cancel();
    _coinSubscription = coinRepository.loadNewsDetails(id).listen(
          (list) => add(UpdateNewsDetails(list)),
        );
  }

  Stream<NewsDetailsState> _mapUpdateNewsDetailsListState(
      UpdateNewsDetails event) async* {
    yield NewsDetailsLoadSuccess(event.newsDetailsList);
  }

  @override
  Future<void> close() {
    _coinSubscription?.cancel();
    return super.close();
  }
}
