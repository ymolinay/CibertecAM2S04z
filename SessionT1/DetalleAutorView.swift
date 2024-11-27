//
//  DetalleAutorView.swift
//  SessionT1
//
//  Created by DAMII on 26/11/24.
//

import SwiftUI

struct DetalleAutorView: View {
    var autor: Autor
    @ObservedObject var modelo: ModeloAutores
    @State private var mostrarFormulario = false

    var body: some View {
        VStack {
            Text(autor.nombre)
                .font(.largeTitle)
                .bold()
                .padding()

            List {
                ForEach(autor.libros) { libro in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(libro.titulo)
                                .font(.headline)
                            Text(libro.descripcion)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Button(action: {
                            marcarComoLeido(libro)
                        }) {
                            Text(libro.leido ? "Leído" : "No leído")
                                .padding(8)
                                .background(libro.leido ? Color.green : Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                }
                .onDelete { indices in
                    eliminarLibro(indices)
                }
            }
            .navigationTitle("Libros")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        mostrarFormulario = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $mostrarFormulario) {
                FormularioLibroView(autor: autor, modelo: modelo, mostrarFormulario: $mostrarFormulario)
            }
        }
    }

    private func marcarComoLeido(_ libro: Libro) {
        if let indiceAutor = modelo.autores.firstIndex(where: { $0.id == autor.id }),
           let indiceLibro = modelo.autores[indiceAutor].libros.firstIndex(where: { $0.id == libro.id }) {
            modelo.autores[indiceAutor].libros[indiceLibro].leido.toggle()
        }
    }

    private func eliminarLibro(_ offsets: IndexSet) {
        if let indiceAutor = modelo.autores.firstIndex(where: { $0.id == autor.id }) {
            modelo.autores[indiceAutor].libros.remove(atOffsets: offsets)
        }
    }
}
