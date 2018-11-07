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
    var Duracion : String?
    var ID : String?
    var urlPoster : String?
    
    init(Titulo : String, Año : Int, ID : String){
        self.Titulo = Titulo
        self.Año = Año
        self.ID = ID
    }
    
    init(diccionario : NSDictionary){
        Titulo = ""
        Año = 0
        ID = ""
        if let valorTitulo = diccionario.value(forKey: "Title") as? String{
            Titulo = valorTitulo
        }
        if let valorAño = diccionario.value(forKey: "Year") as? String{
            let indiceFinal = valorAño.index(valorAño.startIndex, offsetBy : 4)
            Año = Int(valorAño[..<indiceFinal])!
        }
        if let imdbID = diccionario.value(forKey: "imdbID") as? String{
            ID = imdbID
        }
    }
}
