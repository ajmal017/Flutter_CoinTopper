import 'dart:async';
import 'package:cointopper/repositories/repo.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'featured_news_event.dart';
import 'featured_news_state.dart';
 

class FeaturedNewsBloc extends Bloc<FeaturedNewsEvent, FeaturedNewsState> {
  final CoinTopperRepository coinRepository;
  StreamSubscription _coinSubscription;

  FeaturedNewsBloc({@required this.coinRepository})
      : super(FeaturedNewsListLoadInProgress());

  @override
  Stream<FeaturedNewsState> mapEventToState(FeaturedNewsEvent event) async* {
    if (event is LoadFeaturedNewsList) {
      yield* _mapLoadFeaturedNewsListState();
    }
    {
      if (event is UpdateFeaturedNewsList) {
        yield* _mapUpdateFeaturedNewsListState(event);
      }
    }
  }

  Stream<FeaturedNewsState> _mapLoadFeaturedNewsListState() async* {
    print("bloc enterred");
    _coinSubscription?.cancel();
    _coinSubscription = coinRepository.loadFeaturedNewsList().listen(
          (list) => add(UpdateFeaturedNewsList(list)),
        );
  }

  Stream<FeaturedNewsState> _mapUpdateFeaturedNewsListState(
      UpdateFeaturedNewsList event) async* { 
    yield FeaturedNewsListLoadSuccess(event.featuredNewsList);
  }

  @override
  Future<void> close() {
    _coinSubscription?.cancel();
    return super.close();
  }
}
