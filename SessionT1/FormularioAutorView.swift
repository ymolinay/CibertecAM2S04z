//
//  FormularioAutorView.swift
//  SessionT1
//
//  Created by DAMII on 26/11/24.
//

import SwiftUI

struct FormularioAutorView: View {
    @ObservedObject var modelo: ModeloAutores
    @Binding var mostrarFormulario: Bool
    @State private var nombre: String = ""
    @State private var descripcion: String = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Nombre del Autor", text: $nombre)
                TextField("Descripción", text: $descripcion)

                Button("Guardar") {
                    let nuevoAutor = Autor(id: UUID(), nombre: nombre, descripcion: descripcion, libros: [])
                    modelo.autores.append(nuevoAutor)
                    mostrarFormulario = false
                }
                .disabled(nombre.isEmpty || descripcion.isEmpty)
            }
            .navigationTitle("Nuevo Autor")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        mostrarFormulario = false
                    }
                }
            }
        }
    }
}
