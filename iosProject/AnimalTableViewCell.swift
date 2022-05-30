//
//  AnimalTableViewCell.swift
//  iosProject
//
//  Created by Rufina on 05.05.2022.
//

import UIKit

class AnimalViewModel {
    let title: String
    let subtitle: String
    
    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }
}


class AnimalTableViewCell: UITableViewCell {

    static let identifier = "AnimalTableViewCell"
    
    private let animalTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(animalTitleLabel)
        contentView.addSubview(subtitleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        animalTitleLabel.frame = CGRect(x: 10,
                                           y: 0,
                                           width: contentView.frame.size.width - 120,
                                           height: contentView.frame.size.height / 2)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        animalTitleLabel.text = nil
    }
    
    func configure( with viewModel: AnimalViewModel) {
        animalTitleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
    }
    
}
