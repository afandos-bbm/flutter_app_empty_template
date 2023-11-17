part of 'language_cubit.dart';

class LanguageState extends Equatable {
  const LanguageState({this.selectedLanguage = 'en'});

  final String selectedLanguage;

  @override
  List<Object?> get props => [selectedLanguage];

  LanguageState copyWith({
    String? selectedLanguage,
  }) {
    return LanguageState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}
