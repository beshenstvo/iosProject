//
//  CatListVC.swift
//  iosProject
//
//  Created by Rufina on 16.05.2022.
//

import UIKit

class CatListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    private let tableView: UITableView = {
       let table = UITableView()
        table.register(CatTVC.self, forCellReuseIdentifier: CatTVC.identifier)
        print("Tableview")
        return table
    }()
    
    var results = [Animals]()
    var cat: Animals?
    var animalResponse = [APIResponse]()
    private var viewModels = [CatTableViewCellModel]()

    
    func getCatsList(completion: @escaping () -> Void ) {
        let urlString = "https://api.thecatapi.com/v1/breeds?x-api-key=4d962ba8-ab05-4347-ad30-b12c816a4ded"

        guard let url = URL(string: urlString) else {return}

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }

            guard let data = data else {
                return
            }


            do {
                let animals = try JSONDecoder().decode([Animals].self, from: data)
                self.results = animals
                completion()
            } catch {
                print(error)
            }

        }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = .systemBackground
        
        getCatsList() { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        // Do any additional setup after loading the view.
    }
    

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(results.count)
        return results.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("pr")
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CatTVC.identifier,
            for: indexPath
        ) as? CatTVC else {
            fatalError()
        }
        print("results.count: \(results.count)")
        
        cell.configure(with: results[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.cat = results[indexPath.row]
        performSegue(withIdentifier: "showAbout", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AboutVC {
            destination.cat = self.cat
        }
    }
}
