//
//  StarCardVM.swift
//  StarWarsDemo
//
//  Created by Danilo Osorio on 13/02/25.
//

import SwiftUI

@Observable
final class StarCardVM {
    let repository: DataRepository
    
    var cards: [StarCard]
    
    init(repository: DataRepository = Repository()){
        self.repository = repository
        do {
            cards = try repository.getData()
        }catch {
            cards = []
        }
    }
}
