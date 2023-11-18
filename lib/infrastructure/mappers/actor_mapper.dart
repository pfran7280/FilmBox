import 'package:filmbox/domain/entities/actor.dart';

import '../models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) =>
      Actor(
        id: cast.id, 
        name: cast.name, 
        profilePath: cast.profilePath != null
        ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
        : 'https://th.bing.com/th/id/R.85940e99208a94c8f1d9628f42cf36f8?rik=oUbEF2S%2bY6attQ&pid=ImgRaw&r=0',
        character: cast.character
        );
}
