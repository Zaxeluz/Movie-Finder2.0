//
//  ViewController.swift
//  Peliculas
//
//  Created by Alumno on 31/10/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->CGFloat{
        return 73.5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Datos.resultadosPeliculas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "cellResultadoPelicula") as! CeldaPeliculaController
        celda.lblPelicula.text = Datos.resultadosPeliculas[indexPath.row].Titulo
        celda.lblAño.text = "\(Datos.resultadosPeliculas[indexPath.row].Año)"
        return celda
    }
    

    @IBOutlet weak var tvResultadosPeliculas: UITableView!
    @IBOutlet weak var txtBusqueda: UITextField!
    @IBOutlet weak var aiCargandoBusqueda: UIActivityIndicatorView!
    @IBAction func doTapBuscarPelicula(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Alamofire.request("https://www.omdbapi.com/?apikey=fbf7bf8f&s=godfather").responseJSON{
            response in
            
            Datos.resultadosPeliculas.removeAll()
            
            if let dicResponse = response.result.value as? NSDictionary{
                if let arrResponse = dicResponse.value(forKey: "Search") as? NSArray{
                    for resultado in arrResponse{
                        if let dicResultado = resultado as? NSDictionary{
                            let nuevoResultado = Pelicula(diccionario: dicResultado)
                            Datos.resultadosPeliculas.append(nuevoResultado)
                        }
                    }
                    self.tvResultadosPeliculas.reloadData()
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

