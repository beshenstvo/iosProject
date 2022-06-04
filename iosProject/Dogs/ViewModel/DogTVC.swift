//
//  DogTVC.swift
//  iosProject
//
//  Created by Rufina on 30.05.2022.
//

import UIKit

class DogTVCViewModel {
    let title: String
    
    init(title: String) {
        self.title = title
    }
}


class DogTVC: UITableViewCell {

    static let identifier = "DogTVC"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private let dogTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    private let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 4
        imageView.backgroundColor = .secondarySystemBackground
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(dogTitleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        dogTitleLabel.frame = CGRect(x: 10,
                                           y: 0,
                                           width: contentView.frame.size.width - 120,
                                           height: contentView.frame.size.height / 2)
        
        characterImageView.frame = CGRect(x: contentView.frame.size.width-170,
                                          y: 5,
                                          width: 160,
                                          height: contentView.frame.size.height - 10)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        dogTitleLabel.text = nil
    }
    
    func configure(with viewModel: Dogs) {
        dogTitleLabel.text = viewModel.name
    }
    
    
    
}
