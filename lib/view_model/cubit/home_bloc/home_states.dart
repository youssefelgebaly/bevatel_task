abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetCategoriesLoadingState extends HomeState {}

class GetCategoriesSuccessState extends HomeState {}

class GetCategoriesErrorState extends HomeState {
  String error;
  GetCategoriesErrorState(this.error);
}

class GetProductsLoadingState extends HomeState {}

class GetProductsSuccessState extends HomeState {}

class GetProductsErrorState extends HomeState {
  String error;
  GetProductsErrorState(this.error);
}

class GetDetailsLoadingState extends HomeState {}

class GetDetailsSuccessState extends HomeState {}

class GetDetailsErrorState extends HomeState {
  String error;
  GetDetailsErrorState(this.error);
}

class GetCartsLoadingState extends HomeState {}

class GetCartsSuccessState extends HomeState {}

class GetCartsErrorState extends HomeState {
  String error;
  GetCartsErrorState(this.error);
}
