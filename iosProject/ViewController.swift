//
//  ViewController.swift
//  iosProject
//
//  Created by Rufina on 01.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var listOfCatsButton: UIButton!
    @IBOutlet weak var listOfDogsButton: UIButton!
    
    private var results = [Animals]()
    

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Классы животных"
        label.font = UIFont.systemFont(ofSize: 28)
        label.textColor = .black
        return label
    }()
    
    weak var jsonCaller: APICaller?
//    private var viewModels = [AnimalViewModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Энциклопедия домашних животных"
        
        
        listOfCatsButton.layer.cornerRadius = 8
        listOfDogsButton.layer.cornerRadius = 8
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func listOfCatsBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "showList", sender: self)
        print("listOfCatsBtnPressed")
    }
    
    
    @IBAction func listOfDogsBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "showDogList", sender: self)
        print("listOfDogsBtnPressed")
    }
    
    

}

