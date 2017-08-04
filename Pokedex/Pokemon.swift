//
//  Pokemon.swift
//  Pokedex
//
//  Created by Aditya Gunda on 8/4/17.
//  Copyright © 2017 Aditya Gunda. All rights reserved.
//

import Foundation

class Pokemon {

    fileprivate var _name: String!
    fileprivate var _pokdexId: Int!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokdexId
    }
    
    init(name: String, pokedexId: Int)
    {
     self._name = name
     self._pokdexId = pokedexId
    }
}
