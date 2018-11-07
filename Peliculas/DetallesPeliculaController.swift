//
//  DetallesPeliculaController.swift
//  Peliculas
//
//  Created by Alumno on 01/11/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class DetallesPeliculaController : UIViewController{
    
    var pelicula : Pelicula?
    let urlBase = "https://www.omdbapi.com/?apikey=fbf7bf8f&i="
    
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblAño: UILabel!
    @IBOutlet weak var lblClasificacion: UILabel!
    @IBOutlet weak var lblDuracion: UILabel!
    @IBOutlet weak var lblGenero: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var uiPoster: UIImageView!
    
    var movie: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if pelicula != nil {
            lblTitulo.text = pelicula!.Titulo
            lblAño.text = "\(pelicula!.Año)"
            Alamofire.request("\(urlBase)\(pelicula!.ID!)").responseJSON{
                response in
                if let dictResultado = response.result.value as? NSDictionary {
                    
                    if let Clasificacion = dictResultado.value(forKey: "Rated") as? String {
                        self.pelicula?.Clasificacion = Clasificacion
                        self.lblClasificacion.text = Clasificacion
                    }
                    if let Director = dictResultado.value(forKey: "Director") as? String {
                        self.pelicula?.Director = Director
                        self.lblDirector.text = Director
                    }
                    if let Duracion = dictResultado.value(forKey: "Runtime") as? String {
                        self.pelicula?.Duracion = Duracion
                        self.lblDuracion.text = Duracion
                    }
                    if let Genero = dictResultado.value(forKey: "Genre") as? String {
                        self.pelicula?.Genero = Genero
                        self.lblGenero.text = Genero
                    }
                    if let Poster = dictResultado.value(forKey: "Poster") as? String {
                        self.pelicula?.urlPoster = Poster
                        Alamofire.request(Poster).responseImage{
                            response in
                            self.uiPoster.image = response.result.value
                        }
                    }
                }
            }
        }
    }
    
    
    @IBAction func tapBack(_ sender: Any) {
        performSegue(withIdentifier: "goBack", sender: self)
    }
}
