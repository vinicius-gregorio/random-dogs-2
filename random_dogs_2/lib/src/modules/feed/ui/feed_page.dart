import 'package:flutter/material.dart';
import 'package:random_dogs_2/src/modules/feed/domain/usecases/load_feed_usecase.dart';
import 'package:random_dogs_2/src/modules/feed/external/dogs_api/dogs_api_impl.dart';
import 'package:random_dogs_2/src/modules/feed/infra/repositories/feed_repository_impl.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final loadfeedUsecase = LoadFeedUsecase(FeedRepositoryImpl(DogsApiImpl()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
          onPressed: () {
            loadfeedUsecase.repository
                .getFeed(LoadFeedParams(numberOfPhotos: 10));
          },
          child: Text('test')),
    );
  }
}
