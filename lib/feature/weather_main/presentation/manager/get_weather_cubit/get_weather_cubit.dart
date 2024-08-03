import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/feature/weather_main/data/model/weather_model.dart';
import 'package:weather_app/feature/weather_main/data/services/get_weather_service.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(GetWeatherInitial());
  WeatherModel? weatherModel;

  getWeather({required city}) async {
    emit(GetWeatherLoading());
    try {
      weatherModel = await GetWeatherService().getWeather(city: city);

      emit(GetWeatherSuccuess());
    } catch (e) {
      emit(GetWeatherFailuer());
    }
  }
}
