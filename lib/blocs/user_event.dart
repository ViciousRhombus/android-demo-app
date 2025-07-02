abstract class UserEvent {}

class FetchUsers extends UserEvent {}

class SearchUsers extends UserEvent {
  final String query;
  SearchUsers(this.query);
}
