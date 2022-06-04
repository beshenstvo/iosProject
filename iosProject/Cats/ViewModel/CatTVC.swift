//
//  CatTVC.swift
//  iosProject
//
//  Created by Rufina on 23.05.2022.
//

import UIKit

class CatTableViewCellModel {
    let title: String
    let subtitle: String
    
    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }
}

class CatTVC: UITableViewCell {

    static let identifier = "CatTVC"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private let catTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .medium)
        label.numberOfLines = 0
        return label
    }()

    private let catSubtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(catTitleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        catTitleLabel.frame = CGRect(x: 10,
                                           y: 0,
                                           width: contentView.frame.size.width - 120,
                                           height: contentView.frame.size.height / 2)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        catTitleLabel.text = nil
    }
    
    func configure(with viewModel: Animals) {
        catTitleLabel.text = viewModel.name
        print(catTitleLabel.text)
        print(catSubtitleLabel.text)
        
    }
}
