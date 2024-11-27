//
//  FormularioLibroView.swift
//  SessionT1
//
//  Created by DAMII on 26/11/24.
//

import SwiftUI

struct FormularioLibroView: View {
    var autor: Autor
    @ObservedObject var modelo: ModeloAutores
    @Binding var mostrarFormulario: Bool
    @State private var titulo: String = ""
    @State private var descripcion: String = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Título del Libro", text: $titulo)
                TextField("Descripción", text: $descripcion)

                Button("Guardar") {
                    if let indiceAutor = modelo.autores.firstIndex(where: { $0.id == autor.id }) {
                        let nuevoLibro = Libro(id: UUID(), titulo: titulo, descripcion: descripcion, leido: false)
                        modelo.autores[indiceAutor].libros.append(nuevoLibro)
                    }
                    mostrarFormulario = false
                }
                .disabled(titulo.isEmpty || descripcion.isEmpty)
            }
            .navigationTitle("Nuevo Libro")
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
