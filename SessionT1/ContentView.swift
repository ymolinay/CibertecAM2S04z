//
//  ContentView.swift
//  SessionT1
//
//  Created by DAMII on 26/11/24.
//

import SwiftUI

class ModeloAutores: ObservableObject {
    @Published var autores: [Autor] = [] {
        didSet {
            guardarDatos()
        }
    }

    init() {
        cargarDatos()
    }

    private func archivoURL() -> URL {
        let documentos = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentos.appendingPathComponent("autores.json")
    }

    private func guardarDatos() {
        do {
            let datos = try JSONEncoder().encode(autores)
            try datos.write(to: archivoURL())
        } catch {
            print("Error al guardar los datos: \(error)")
        }
    }

    private func cargarDatos() {
        do {
            let datos = try Data(contentsOf: archivoURL())
            autores = try JSONDecoder().decode([Autor].self, from: datos)
        } catch {
            print("Error al cargar los datos: \(error)")
        }
    }
}

struct ContentView: View {
    @StateObject private var modelo = ModeloAutores()

    var body: some View {
        NavigationView {
            ListaAutoresView(modelo: modelo)
        }
    }
}
