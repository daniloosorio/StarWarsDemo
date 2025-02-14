//
//  Repository.swift
//  StarWarsDemo
//
//  Created by Danilo Osorio on 13/02/25.
//

import Foundation

protocol DataRepository { //protocol like interface
    var url: URL { get }
}
extension DataRepository { //each repository can the function data
    func getData() throws -> [StarCard] {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode([StarCardDTO].self, from: data).map(\.toCard)
    }
}


struct Repository: DataRepository {
    var url: URL {
        Bundle.main.url(forResource: "StarWars", withExtension: "json")!
    }
}

struct RepositoryTest: DataRepository {
    var url: URL {
        Bundle.main.url(forResource: "StarWars Test", withExtension: "json")!
    }
}

//MARK: -  other way
/*struct Repository: DataRepository{
    
    func getData() throws -> [StarCard]{ // i said that this function maybe throw error
        guard let url = Bundle.main.url(forResource: "StarWars", withExtension: "json") //if null return empty array simi lar to ?:
        else { return [] }
        let data = try! Data(contentsOf: url) // delegate error to function that call me
        
        /*way to manage error
         do {
         let data = try Data(contentsOf: url)
         }catch{
         print("ha habido un error \(error)") //catch contiene error
         }*/
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase // data_from_server to dataFromServer
        return try decoder.decode([StarCardDTO].self, from: data).map(\.toCard)
    }
}*/
