//
//  Autor.swift
//  SessionT1
//
//  Created by DAMII on 26/11/24.
//

import SwiftUI

struct Autor: Identifiable, Codable {
    let id: UUID
    let nombre: String
    let descripcion: String
    var libros: [Libro]
}

