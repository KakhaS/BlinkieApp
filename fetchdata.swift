//
//  fetchdata.swift
//  Blinkie
//
//  Created by Kakha Sepashvili on 21.05.21.
//

import Foundation

class FetchData {
    
    //MARK: პარამეტრებში ქლოუჟერია რომელიც იღებს სტრინგს და არაფერს აბრუნებს
    func fetchData(completion: @escaping (_ ip: String) -> Void) {
        var currentIP: String = ""
        let url = URL(string: "https://api.myip.com" )
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let data = data, error == nil {
                do {
                    let data = try JSONDecoder().decode(UserData.self, from: data)
                    currentIP = data.ip
                    DispatchQueue.main.async {
                        
    //MARK: აქ იძახება ჩვენი ქლოუჟერი
                        
                        completion(currentIP)
                    }
                }
                catch {
                    print("error")
                }
            } else {
                print("Error")            }
        }.resume()
    }
}
