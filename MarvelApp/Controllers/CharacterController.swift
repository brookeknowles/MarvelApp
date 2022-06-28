//
//  CharacterController.swift
//  MarvelApp
//
//  Created by Brooke Knowles on 27/06/22.
//
// Deals with getting the character data from the marvel API

import Foundation

public class CharacterController {
    var listOfCharactersForClass: [Character] = []
    
    func createListOfCharacters(character: Character) {
        self.listOfCharactersForClass.append(character)
    }
    
    func getListOfCharacters() {
        getCharactersFromAPI()
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            print(self.listOfCharactersForClass)
        }
    }

    func getCharactersFromAPI(limit:String = "20", offset:String = "0") {
        
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5.MD5Hex(data: MD5.MD5(string: ts + privateKey + publicKey)).lowercased()
        
        // There are 1562 characters in total, can only get them from API 100 at a time
        // e.g: /v1/public/characters?limit=[limit]&offset=[offset]&apikey=[apikey]. default get first 20
        let url = URL(string: "https://gateway.marvel.com/v1/public/characters?ts=\(ts)&limit=\(limit)&offset=\(offset)&apikey=\(publicKey)&hash=\(hash)")! as URL
        
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            let decoder = JSONDecoder()

            if let data = data {
                do {
                    let tasks = try decoder.decode(CharacterDataWrapper.self, from: data)
                    let results = tasks.data?.results
                    
                    for i in results ?? [] {
                        self.createListOfCharacters(character: i)
                    }

                } catch{
                    print(error)
                }
            }
        }

        task.resume()
    }

}
