//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Aditya Gunda on 8/4/17.
//  Copyright © 2017 Aditya Gunda. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var poke: Pokemon!

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var baseAttackLabel: UILabel!
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = poke.name.capitalized
        poke.downloadPokemonDetail {
            self.updateUI()
        }
    }

    func updateUI(){
        baseAttackLabel.text = poke.attack
        defenseLabel.text = poke.defense
        heightLabel.text = poke.height
        weightLabel.text = poke.weight
        mainImage.image = UIImage(named: "\(poke.pokedexId)")
        idLabel.text = "\(poke.pokedexId)"
        typeLabel.text = poke.type
        descriptionLabel.text = poke.description
        //next evo image
        //evo text
    }
}
