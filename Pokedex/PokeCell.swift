//
//  PokeCell.swift
//  Pokedex
//
//  Created by Aditya Gunda on 8/4/17.
//  Copyright © 2017 Aditya Gunda. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
 
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0 
    }
    
    func configureCell(_ pokemon: Pokemon) {
        self.pokemon = pokemon
        nameLbl.text = pokemon.name.capitalized
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }
}
