const String appName = 'Weather Info';
const String cityNameLabel = 'City Name';
const String temperatureLabel = 'Temperature';
const String windSpeedUnitLabel = ' km/h';
const String percentageLabel = ' %';
const String pressureLabel = ' hPa';

const String searchButtonLabel = 'Search';

// const String API_KEY = '[YOUR OPEN WEATHER MAP API KEY]';
//Testing Open Weather Map API key f85c042d5d9da516bad2c9ca30120d48

const String API_KEY = 'f85c042d5d9da516bad2c9ca30120d48';

const String weatherList =
    'https://api.openweathermap.org/data/2.5/group?id=2147714,4163971,2174003&units=metric&APPID=' +
        API_KEY;

const SUCCESS = 200;
const WEATHER_INVALID_RESPONSE = 100;
const NO_INTERNET = 101;
const INVALID_FORMAT = 102;
const UNKNOWN_ERROR = 103;
