//
//  ViewController.swift
//  LocationTest
//
//  Created by 박승환 on 5/13/24.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var areaLabel: UILabel!
    
    @IBOutlet weak var weatherLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var feelLikeLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    let locationManager = CLLocationManager()
    
    let geocoder = CLGeocoder()
        
    var apiKey: String {
        get {
            guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
                  let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject],
                  let key = dict["API_KEY"] as? String else {
                fatalError("API Key not found.")
            }
            return key
        }
    }
    
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            //print("Current location: 위도 : \(location.coordinate.latitude), 경도 : \(location.coordinate.longitude)")
            latitude = location.coordinate.latitude
            longitude = location.coordinate.longitude
            fetchWeather(latitude: latitude, longitude: longitude)
            reverseGeocode(location: location)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
    
    func fetchWeather(latitude: Double, longitude: Double) {
        // OpenWeatherMap API URL 구성
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric&lang=kr"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error retrieving weather data: \(error)")
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
                    
                    // 날씨 데이터를 파싱하여 사용
                    DispatchQueue.main.async {
                        // 지역 이름과 날씨 설명, 온도 등을 출력
                        //print("지역: \(weatherResponse.name)")
                        //print("현재 날씨: \(weatherResponse.weather.first?.description ?? "정보 없음")")
                        self.weatherLabel.text = weatherResponse.weather.first?.description ?? "정보 없음"
                        //print("현재 온도: \(weatherResponse.main.temp)°C")
                        self.tempLabel.text = String(weatherResponse.main.temp)
                        self.feelLikeLabel.text = String(weatherResponse.main.feels_like)
                        self.maxTempLabel.text = String(weatherResponse.main.temp_max)
                        self.minTempLabel.text = String(weatherResponse.main.temp_min)
                        self.humidityLabel.text = String(weatherResponse.main.humidity)
                        //print("습도: \(weatherResponse.main.humidity)%")
                        let sunriseDate = Date(timeIntervalSince1970: TimeInterval(weatherResponse.sys.sunrise))
                        let sunsetDate = Date(timeIntervalSince1970: TimeInterval(weatherResponse.sys.sunset))
                        let dateFormatter = DateFormatter()
                        dateFormatter.timeZone = TimeZone(secondsFromGMT: weatherResponse.timezone)
                        dateFormatter.dateFormat = "HH:mm"
                        self.sunriseLabel.text = dateFormatter.string(from: sunriseDate)
                        self.sunsetLabel.text = dateFormatter.string(from: sunsetDate)
//                        print("일출 시간: \(dateFormatter.string(from: sunriseDate))")
//                        print("일몰 시간: \(dateFormatter.string(from: sunsetDate))")
                    }
                } catch {
                    print("Failed to decode weather data: \(error)")
                }
            } else {
                print("No data received")
            }

        }
        
        task.resume()
    }
    
    func reverseGeocode(location: CLLocation) {
        geocoder.reverseGeocodeLocation(location, preferredLocale: Locale(identifier: "ko-KR")) { [weak self] (placemarks, error) in
            guard let self = self else { return }
            if let error = error {
                print("Reverse geocoding failed: \(error)")
                return
            }

            if let placemark = placemarks?.first {
                // 주소의 구성 요소 중 'locality'는 도시 이름을, 'subLocality'는 지역 내 더 세부적인 위치를 나타냅니다.
                if let city = placemark.locality {
                    if let area = placemark.subLocality {
                        //print("현재 위치는 \(city) \(area)입니다.")
                        areaLabel.text = "\(city) \(area)"
                    } else {
                        //print("현재 위치는 \(city)입니다.")
                        areaLabel.text = "\(city)"
                    }
                } else {
                    print("상세 위치를 찾을 수 없습니다.")
                }
            }
        }
    }

}



// 전체 응답을 담을 구조체
struct WeatherResponse: Codable {
    let name: String           // 지역 이름
    let weather: [Weather]    // 날씨 배열
    let main: Main            // 온도와 습도 정보
    let sys: Sys              // 일출과 일몰 시간 등 추가 시스템 정보
    let timezone: Int         // 타임존 정보
    
    struct Weather: Codable {
        let description: String  // 날씨 상태 설명
        let icon: String         // 아이콘 코드
    }

    struct Main: Codable {
        let temp: Double         // 현재 온도
        let feels_like: Double    // 체감 온도
        let temp_min: Double      // 최저 온도
        let temp_max: Double      // 최고 온도
        let humidity: Int        // 습도
    }

    struct Sys: Codable {
        let sunrise: Int          // 일출 시간 (UNIX 타임스탬프)
        let sunset: Int           // 일몰 시간 (UNIX 타임스탬프)
    }
}
