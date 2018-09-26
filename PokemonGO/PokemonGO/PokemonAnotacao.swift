//
//  PokemonAnotacao.swift
//  PokemonGO
//
//  Created by Hicharles Rocha on 25/09/18.
//  Copyright © 2018 Hicharles. All rights reserved.
//

import UIKit
import MapKit

class PokemonAnotacao: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var pokemon: Pokemon
    
    init(coordenadas: CLLocationCoordinate2D, pokemon: Pokemon) {
        self.coordinate = coordenadas
        self.pokemon = pokemon
    }
}
