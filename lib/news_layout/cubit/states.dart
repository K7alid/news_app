abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsChangeNavState extends NewsStates {}

class GetTechnologyLoadingState extends NewsStates {}

class GetTechnologySuccessState extends NewsStates {}

class GetTechnologyErrorState extends NewsStates {
  final String error;

  GetTechnologyErrorState(this.error);
}

class GetBusinessLoadingState extends NewsStates {}

class GetBusinessSuccessState extends NewsStates {}

class GetBusinessErrorState extends NewsStates {
  final String error;

  GetBusinessErrorState(this.error);
}

class GetSportsLoadingState extends NewsStates {}

class GetSportsSuccessState extends NewsStates {}

class GetSportsErrorState extends NewsStates {
  final String error;

  GetSportsErrorState(this.error);
}

class GetGeneralLoadingState extends NewsStates {}

class GetGeneralSuccessState extends NewsStates {}

class GetGeneralErrorState extends NewsStates {
  final String error;

  GetGeneralErrorState(this.error);
}

class GetScienceLoadingState extends NewsStates {}

class GetScienceSuccessState extends NewsStates {}

class GetScienceErrorState extends NewsStates {
  final String error;

  GetScienceErrorState(this.error);
}

class ChangeModeState extends NewsStates {}

class GetSearchLoadingState extends NewsStates {}

class GetSearchSuccessState extends NewsStates {}

class GetSearchErrorState extends NewsStates {
  final String error;

  GetSearchErrorState(this.error);
}
