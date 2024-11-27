//
//  ListaAutoresView.swift
//  SessionT1
//
//  Created by DAMII on 26/11/24.
//

import SwiftUI

struct ListaAutoresView: View {
    @ObservedObject var modelo: ModeloAutores
    @State private var mostrarFormulario = false

    var body: some View {
        VStack {
            List {
                ForEach(modelo.autores) { autor in
                    NavigationLink(destination: DetalleAutorView(autor: autor, modelo: modelo)) {
                        VStack(alignment: .leading) {
                            Text(autor.nombre).font(.headline)
                            Text(autor.descripcion)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete(perform: eliminarAutor)
            }
            .navigationTitle("Autores")
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
                FormularioAutorView(modelo: modelo, mostrarFormulario: $mostrarFormulario)
            }
        }
    }

    private func eliminarAutor(at offsets: IndexSet) {
        modelo.autores.remove(atOffsets: offsets)
    }
}
