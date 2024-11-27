//
//  Libro.swift
//  SessionT1
//
//  Created by DAMII on 26/11/24.
//

import SwiftUI

struct Libro: Identifiable, Codable {
    let id: UUID
    let titulo: String
    let descripcion: String
    var leido: Bool
}
