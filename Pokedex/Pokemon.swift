//
//  Pokemon.swift
//  Pokedex
//
//  Created by Aditya Gunda on 8/4/17.
//  Copyright © 2017 Aditya Gunda. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {

    private var _name: String!
    private var _pokdexId: String!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvoTxt: String!
    private var _pokemonURL: String!
    
    var name: String {
        return self._name
    }
    
    var pokedexId: String {
        return self._pokdexId
    }
    
    var nextEvoTxt: String {
        if self._nextEvoTxt == nil {
            self._nextEvoTxt = ""
        }
        return self._nextEvoTxt
    }
    
    var attack: String {
        if self._attack == nil {
            self._attack = ""
        }
        return self._attack
    }
    
    var weight: String {
        if self._weight == nil {
            self._weight = ""
        }
        return self._weight
    }
    
    var height: String {
        if self._height == nil {
            self._height = ""
        }
        return self._height
    }
    
    var defense: String {
        if self._defense == nil {
            self._defense = ""
        }
        return self._defense
    }
    
    var type: String {
        if self._type == nil {
            self._type = ""
        }
        return self._type
    }
    
    var description: String {
        if self._description == nil {
            self._description = ""
        }
        return self._description
    }
    
    init(name: String, pokedexId: String)
    {
     self._name = name
     self._pokdexId = pokedexId
     self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self._pokdexId!)/"
    }
    
    func downloadPokemonDetail(completed: @escaping DownloadComplete) {
        Alamofire.request(self._pokemonURL).responseJSON{ response in
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                //print("after alamofire")
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                if let height = dict["height"] as? String {
                    self._height = height
                }
                if let id = dict["pkdx_id"] as? String {
                    self._pokdexId = id
                }
                if let weight = dict["weight"] as? String{
                    self._weight = weight
                }
                
                if let type = dict["types"] as? [Dictionary<String,String>] , type.count > 0 {
                    if let first = type[0]["name"] as? String {
                            self._type = first.capitalized
                    }
                    
                    if type.count > 1 {
                        for x in 1..<type.count {
                            if let name = type[x]["name"] {
                                self._type! += "/\(name.capitalized)"
                            }
                        }
                    }
                }
                
                if let descriptions = dict["descriptions"] as? [Dictionary<String, String>] {
                    if let first = descriptions[0]["resource_uri"] {
                        let descURL = "\(URL_BASE)\(first)"
                        Alamofire.request(descURL).responseJSON{ response in
                            if let descDict = response.result.value as? Dictionary<String,AnyObject> {
                                if let desc = descDict["description"] as? String {
                                    self._description = desc
                                    print(self._description)
                                }
                            }
                            completed()
                        }
                        
                    } else {
                        self._description = ""
                    }
                }
                completed()
                //print(self._description)
                /*
                print(self._weight)
                print(self._height)
                print(self._defense)
                print(self._pokdexId)
                print(self._attack)
                */
                
              }
            }
        }
    }
