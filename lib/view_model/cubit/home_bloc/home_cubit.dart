import 'package:bevatel_task/model/carts_model.dart';
import 'package:bevatel_task/model/products_model.dart';
import 'package:bevatel_task/view_model/api/end_point.dart';

import '../../api/dio_helper.dart';
import 'home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);
  List categories = [];
  List<ProductsModel>? products = [];
  ProductsModel? productsModel;
  List<CartsModel>? cartsModel;

  Future<void> getCategoriesData() async {
    emit(GetCategoriesLoadingState());
    DioHelper.get(
      endPoint: getCategories,
    ).then((value) {
      developer.log(">>>>>>>>>>>>>>>>> $value");
      categories = value!.data as List;
      emit(GetCategoriesSuccessState());
    }).catchError((onError) {
      developer.log(onError.toString());

      emit(GetCategoriesErrorState(onError.toString()));
    });
  }

  Future<void> getProductiesData() async {
    emit(GetProductsLoadingState());
    DioHelper.get(
      endPoint: getProducts,
    ).then((value) {
      products = ProductsModel.listFromJson(value!.data);
      emit(GetProductsSuccessState());
    }).catchError((onError) {
      developer.log(onError.toString());

      emit(GetProductsErrorState(onError.toString()));
    });
  }

  Future<void> getSingleProductiesData({required String id}) async {
    emit(GetDetailsLoadingState());
    DioHelper.get(
      endPoint: '$getProducts/$id',
    ).then((value) {
      developer.log("getSingleProductiesData >>>>>>>>>>>>>>>>> ${value?.data}");
      productsModel = ProductsModel.fromJson(value!.data);
      emit(GetDetailsSuccessState());
    }).catchError((onError) {
      developer.log(onError.toString());

      emit(GetDetailsErrorState(onError.toString()));
    });
  }

  Future<void> getCartsData() async {
    emit(GetDetailsLoadingState());
    DioHelper.get(
      endPoint: carts,
    ).then((value) {
      developer.log("getCartsData >>>>>>>>>>>>>>>>> ${value?.data}");
      cartsModel = CartsModel.listFromJson(value!.data);
      emit(GetDetailsSuccessState());
    }).catchError((onError) {
      developer.log(onError.toString());
      emit(GetDetailsErrorState(onError.toString()));
    });
  }
}
