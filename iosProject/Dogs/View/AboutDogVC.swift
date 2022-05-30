//
//  AboutDogVC.swift
//  iosProject
//
//  Created by Rufina on 30.05.2022.
//

import UIKit

class AboutDogVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var temperament: UILabel!
    @IBOutlet weak var adaptability: UILabel!
    @IBOutlet weak var dog_friendly: UILabel!
    @IBOutlet weak var country: UILabel!
    
    var dog: Dogs?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if dog?.origin != nil {
            country.text = "Country: \((dog?.origin)!)"
        } else if dog?.origin == nil {
            desc.text = "Unknown"
        }
        name.text = "Name: \((dog?.name)!)"
        if dog?.description != nil {
            desc.text = "Description: \((dog?.description)!)"
        } else if dog?.description == nil {
            desc.text = "Good Doggo, needn't for description"
        }
        temperament.text = "Temperament: \((dog?.temperament)!)"
        adaptability.text = "Life span: \((dog?.life_span)!)"
        dog_friendly.text = "Bred for: \((dog?.bred_for)!)"
        
        
        name.numberOfLines = 0
        desc.numberOfLines = 0
        temperament.numberOfLines = 0
        
        
        if dog!.reference_image_id != nil {
            if let url = URL(string: "https://cdn2.thedogapi.com/images/\((dog!.reference_image_id)!).jpg" ) {
                URLSession.shared.dataTask(with: url) { data, _, err in
                    guard let data = data, err == nil else {return}
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                    }
                }.resume()
            }
        }
         else {
            self.imageView.image = UIImage(named: "noPhoto")
        }
        // Do any additional setup after loading the view.
    }
    

}
