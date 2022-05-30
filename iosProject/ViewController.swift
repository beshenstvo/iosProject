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
    private var viewModels = [AnimalViewModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Энциклопедия домашних животных"
        
        
        listOfCatsButton.layer.cornerRadius = 8
        listOfDogsButton.layer.cornerRadius = 8
        
//        let urlString = "https://api.thecatapi.com/v1/breeds/search?q=air&x-api-key=4d962ba8-ab05-4347-ad30-b12c816a4ded"
//
//        guard let url = URL(string: urlString) else {return}
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print(error)
//                return
//            }
//
//            guard let data = data else { return }
//
////            let jsonString = String(data: data, encoding: .utf8)
////            print(jsonString)
//            do {
////                let res = JSONDecoder()
////                res.keyDecodingStrategy = .convertFromSnakeCase
////                let ss = try res.decode([Animals].self, from: data)
//                let animals = try JSONDecoder().decode([Animals].self, from: data)
//                self.results = animals
//                print(animals.first)
//            } catch {
//                print(error)
//            }
//
//        }.resume()
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

