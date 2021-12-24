//
//  ApiHandler.swift
//  MyStockApp
//
//  Created by RG on 16/12/21.
//

/*
 
 https://api2.binance.com/api/v3/ticker/24hr
 
 [
 {
 "symbol":"ETHBTC",
 "priceChange":"0.00219900",
 "priceChangePercent":"2.749",
 "weightedAvgPrice":"0.08094947",
 "prevClosePrice":"0.07998900",
 "lastPrice":"0.08218500",
 "lastQty":"0.14880000",
 "bidPrice":"0.08218200",
 "bidQty":"3.40090000",
 "askPrice":"0.08218300",
 "askQty":"4.21430000",
 "openPrice":"0.07998600",
 "highPrice":"0.08322500",
 "lowPrice":"0.07830500",
 "volume":"98801.35430000",
 "quoteVolume":"7997.91759581",
 "openTime":1639547204955,
 "closeTime":1639633604955,
 "firstId":315585534,
 "lastId":315817639,
 "count":232106
 },
 ]
 */

import Foundation
class ApiHandler {
    static let shared = ApiHandler()
    
    private init() {}
    /*func getStockPrices(completion: @escaping([Stock]) -> Void ) {
     if let url = URL(string: "https://api2.binance.com/api/v3/ticker/24hr") {
     URLSession.shared.dataTask(with: url) { data, response, error in
     guard let data = data, error == nil else {
     completion([Stock]())
     return
     }
     
     if let stocks = try? JSONDecoder().decode([Stock].self, from: data) {
     completion(stocks)
     } else {
     completion([Stock]())
     }
     }.resume()
     } else {
     completion([Stock]())
     }
     }*/
    func getstates(completion:@escaping ((States)->Void)) {
        print("qqq")
        
        if let url = URL(string: "https://cdn-api.co-vin.in/api/v2/admin/location/states") {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    let s:States? = nil
                    completion(s!)
                    return
                }
                //print(e)
                //print(d)
                //print(response?.mimeType)
                //print(data.)
                //print(response?.description)
                /*if let response = response as? HTTPURLResponse,
                    (100..<300).contains(response.statusCode) == false {
                    //completionHandler(nil, response, SessionError.statusCode)
                    print("uuuu")
                }*/
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    let states = try decoder.decode(States.self, from: data)
                    print(states.states[0].state_name)
                    completion(states)
                } catch {
                    print(error)
                }
                /*if let states = try? JSONDecoder().decode([State].self, from: data) {
                    print("rrr")
                    completion(states)
                } else {
                    completion([State]())
                    print("dd")
                }*/
                }.resume()
        } else {
            let ss:States? = nil
            completion(ss!)
            
        }
    }
    
    /*func getstates(completion:@escaping ([State]) -> ()) {
     let urlStr = "https://cdn-api.co-vin.in/api/v2/admin/location/states"
     let url = URL(string: urlStr)
     var request = URLRequest(url: url!)
     request.httpMethod = "GET"
     request.setValue("application/json", forHTTPHeaderField:"Content-Type")
     //request.setValue("Bearer \(yourToken)", forHTTPHeaderField:"Authorization")
     request.timeoutInterval = 60.0
     URLSession.shared.dataTask(with: request) {
     (data: Data?, response: URLResponse?, error: Error?) -> Void in
     guard let data = data, error == nil else {
     
     completion([State]())
     return
     }
     //print(response?.value(forKey: "state_id") ?? "")
     if let states = try? JSONDecoder().decode([State].self, from: data) {
     print("rrr")
     completion(states)
     } else {
     
     completion([State]())
     print("dd")
     }
     }
     }*/
}
