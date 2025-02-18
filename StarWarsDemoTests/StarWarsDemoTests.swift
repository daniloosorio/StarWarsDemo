//
//  StarWarsDemoTests.swift
//  StarWarsDemoTests
//
//  Created by Danilo Osorio on 12/02/25.
//

import Testing
@testable import StarWarsDemo

extension Tag {
    @Tag static var repository: Self
}

@Suite("prueba del repository start cards", .tags(.repository))
struct StarWarsDemoTests {
    let repository = Repository()
    let viewModel = StarCardVM(repository: RepositoryTest())
    
    @Test("Pruebas de carga del repositorio")
    func dataLoad() throws {
        let data = try repository.getData()
        #expect(data.count > 10)
    }
    
    @Test("Prueba de carga de datos del viewmodel")
    func dataLoadVM() throws {
        #expect(viewModel.cards.count == 4)
    }


}
