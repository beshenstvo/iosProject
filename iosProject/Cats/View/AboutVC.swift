//
//  AboutVC.swift
//  iosProject
//
//  Created by Rufina on 30.05.2022.
//

import UIKit

class AboutVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var temperament: UILabel!
    @IBOutlet weak var adaptability: UILabel!
    @IBOutlet weak var dog_friendly: UILabel!
    @IBOutlet weak var country: UILabel!
    
    
    var cat: Animals?
    static let shared = AboutVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = "Name: \((cat?.name)!)"
        desc.text = "Description: \((cat?.description)!)"
        temperament.text = "Temperament: \((cat?.temperament)!)"
        adaptability.text = "Adaptability: \((cat?.adaptability)!)"
        dog_friendly.text = "Dog friendly: \((cat?.dog_friendly)!)"
        country.text = "Country: \((cat?.origin)!)"
        
        desc.numberOfLines = 0
        temperament.numberOfLines = 0
        
        if cat!.reference_image_id != nil {
            if let url = URL(string: "https://cdn2.thecatapi.com/images/\((cat!.reference_image_id)!).jpg" ) {
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
        
        print(cat)
        // Do any additional setup after loading the view.
    }
    


}
