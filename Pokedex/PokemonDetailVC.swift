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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = poke.name 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
