//
//  Model.swift
//  StarWarsDemo
//
//  Created by Danilo Osorio on 13/02/25.
//

import Foundation

struct StarCardDTO: Codable {
    let id: Int
    let nombre: String
    let raza: String
    let descripcion: String
    let planetaOrigen: String
    let epoca: String
    let afiliacion: String
    let habilidades: String
    let armas: String
    let imagen: String
}

// this extencion transform dto to presentation
extension StarCardDTO {
    var toCard: StarCard {
        StarCard(id:id,
                 nombre: nombre,
                 raza: raza,
                 descripcion: descripcion,
                 planetaOrigen: planetaOrigen,
                 epoca: epoca,
                 afiliacion: afiliacion.components(separatedBy: ", ").map(\.capitalized),
                 habilidades: habilidades.components(separatedBy: ", "),
                 armas: armas.components(separatedBy: ", "),
                 imagen: imagen
        )
    }
}

//transform with array
struct StarCard: Identifiable, Hashable {
    let id: Int
    let nombre: String
    let raza: String
    let descripcion: String
    let planetaOrigen: String
    let epoca: String
    let afiliacion: [String]
    let habilidades: [String]
    let armas: [String]
    let imagen: String
}

extension StarCard {
    static let test = StarCard(
        id: 23445,
        nombre: "danilo",
        raza: "humano",
        descripcion: "desarrollador ios",
        planetaOrigen: "tierra",
        epoca: "ahora",
        afiliacion: ["holi","republica"],
        habilidades: ["swift","ios"],
        armas: ["mac"],
        imagen: "lukeskywalker"
    )
}
