import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business_screen.dart';
import 'package:news_app/modules/general_screen.dart';
import 'package:news_app/modules/science_screen.dart';
import 'package:news_app/modules/sports_screen.dart';
import 'package:news_app/modules/technology_screen.dart';
import 'package:news_app/news_layout/cubit/states.dart';

import '../../shared/network/local/cache_helper.dart';
import '../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    TechnologyScreen(),
    BusinessScreen(),
    SportsScreen(),
    GeneralScreen(),
    ScienceScreen(),
  ];

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.computer),
      label: 'Technology',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.work),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'General',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 0) {
      getTechnology();
    }
    if (index == 1) {
      getBusiness();
    }
    if (index == 2) {
      getSports();
    }
    if (index == 3) {
      getGeneral();
    }
    if (index == 4) {
      getScience();
    }
    emit(NewsChangeNavState());
  }

  List<dynamic> technology = [];

  void getTechnology() {
    emit(GetTechnologyLoadingState());

    if (technology.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'technology',
          'apiKey': '864d88c0496e4fcca4396952ac3fce69',
        },
      ).then((value) {
        technology = value.data['articles'];
        emit(GetTechnologySuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetTechnologyErrorState(error.toString()));
      });
    } else {
      emit(GetTechnologySuccessState());
    }
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(GetBusinessLoadingState());

    if (business.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': '864d88c0496e4fcca4396952ac3fce69',
        },
      ).then((value) {
        business = value.data['articles'];
        emit(GetBusinessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetBusinessErrorState(error.toString()));
      });
    } else {
      emit(GetBusinessSuccessState());
    }
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(GetSportsLoadingState());

    if (sports.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '864d88c0496e4fcca4396952ac3fce69',
        },
      ).then((value) {
        sports = value.data['articles'];
        emit(GetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetSportsErrorState(error.toString()));
      });
    } else {
      emit(GetSportsSuccessState());
    }
  }

  List<dynamic> general = [];

  void getGeneral() {
    emit(GetGeneralLoadingState());

    if (general.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'general',
          'apiKey': '864d88c0496e4fcca4396952ac3fce69',
        },
      ).then((value) {
        general = value.data['articles'];
        emit(GetGeneralSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetGeneralErrorState(error.toString()));
      });
    } else {
      emit(GetGeneralSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(GetScienceLoadingState());

    if (science.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '864d88c0496e4fcca4396952ac3fce69',
        },
      ).then((value) {
        science = value.data['articles'];
        emit(GetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetScienceErrorState(error.toString()));
      });
    } else {
      emit(GetScienceSuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(GetSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': value,
        'apiKey': '864d88c0496e4fcca4396952ac3fce69',
      },
    ).then((value) {
      search = value.data['articles'];
      emit(GetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSearchErrorState(error.toString()));
    });
  }

  bool isDark = false;

  void changeMode({
    bool? fromShred,
  }) {
    if (fromShred != null) {
      isDark = fromShred;
      emit(ChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(
        key: 'isDark',
        value: isDark,
      ).then((value) {
        emit(ChangeModeState());
      });
      emit(ChangeModeState());
    }
  }

// void changeMode({bool? fromShared}) {
//   if (fromShared != null) {
//     isDark = fromShared;
//     emit(ChangeModeState());
//   } else {
//     isDark = !isDark;
//     CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
//       emit(ChangeModeState());
//     });
//   }
// }

}

/*




//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca


 */
