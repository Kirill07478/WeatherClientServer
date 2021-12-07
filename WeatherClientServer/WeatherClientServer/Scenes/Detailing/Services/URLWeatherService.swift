//
//  URLWeatherService.swift
//  WeatherClientServer
//
//  Created by Kiryusha Orlov on 07.12.2021.
//

import Foundation

class URLWeatherService {
    
    static func firstRequest (elementId: Int, completion: @escaping (DetailingWeatherModel) -> Void ) {

//        var city: DetailingWeatherModel
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let apiKey = "9365bd23f11a403221187f8a1ebac65b"

        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?id=\(elementId)&lang=ru&units=metric&APPID=\(apiKey)") else { return }
        
        let task = session.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
            print("PRETTYJSON")
            print(data.prettyJSON)
            
            do {

                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                print(json)
                
                let object = json as! [String:Any]
                let main = object["main"] as! [String:Any]
                
                let temp = main["temp"] as! Double
                let city = DetailingWeatherModel(citiesId: elementId, temp: temp)
                completion(city)

            } catch {
                print(error)
            }
                        
        }
        
        task.resume()

    }

}
