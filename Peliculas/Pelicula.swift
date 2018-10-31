//
//  Pelicula.swift
//  Peliculas
//
//  Created by Alumno on 31/10/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import Foundation

class Pelicula {
    var Titulo : String
    var Año : Int
    var Clasificacion : String?
    var Genero : String?
    var Director : String?
    
    init(Titulo : String, Año : Int){
        self.Titulo = Titulo
        self.Año = Año
    }
    
    init(diccionario : NSDictionary){
        Titulo = ""
        Año = 0
        if let valorTitulo = diccionario.value(forKey: "Title") as? String{
            Titulo = valorTitulo
        }
        if let valorAño = diccionario.value(forKey: "Year") as? String{
            Año = Int(valorAño)!
        }
    }
}
