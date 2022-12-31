part of 'publicpage_bloc.dart';

@freezed
class PublicpageEvent with _$PublicpageEvent {
  const factory PublicpageEvent.loadPublicPage() = LoadPublicPage;
  const factory PublicpageEvent.loadExploreSection() = LoadExploreSection;
  const factory PublicpageEvent.searchEvent({required String data}) =
      SearchEvent;
}
