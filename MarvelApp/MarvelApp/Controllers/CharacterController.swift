//
//  CharacterController.swift
//  MarvelApp
//
//  Created by Brooke Knowles on 27/06/22.
//
// Deals with getting the character data from the marvel API

import Foundation
import CryptoKit

public class CharacterController {
    
    func getCharacters(limit:String = "20", offset:String = "0"){
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5.MD5Hex(data: MD5.MD5(string: ts + privateKey + publicKey)).lowercased()
        
        // There are 1562 characters in total, can only get them from API 100 at a time
        // e.g: /v1/public/characters?limit=[limit]&offset=[offset]&apikey=[apikey]. default get first 20
        guard let url = URL(string: "https://gateway.marvel.com/v1/public/characters?ts=\(ts)&limit=\(limit)&offset=\(offset)&apikey=\(publicKey)&hash=\(hash)") else{
            return
        }
        
        // might need to change guard code for URL to below if getCharacters needs to return something
//        let url = URL(string: "https://gateway.marvel.com/v1/public/characters?ts=\(ts)&limit=\(limit)&offset=\(offset)&apikey=\(publicKey)&hash=\(hash)")! as URL
        
        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            
            let decoder = JSONDecoder()

            if let data = data {
                do {
                    let tasks = try decoder.decode(CharacterDataWrapper.self, from: data)
                    let results = tasks.data?.results
                    
                    for i in results ?? [] {
                        print(i as Any)
                    }

                } catch{
                    print(error)
                }
            }
        }
        
        task.resume()
    }
    
    func cleanData(currentChar:Character) -> Character {
        // get rid of irrelevant info like the "Optional()"
        // e.g. id: Optional(1011334), name: Optional("3-D Man"), description: Optional("")
        // becomes id: 1011334, name: "3-D Man", description: ""
        
        return currentChar
    }

}
