//
//  CollectionViewTableViewCell.swift
//  Netflix Clone
//
//  Created by Shrouk Yasser on 06/02/2023.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    static let identifier = "CollectionViewTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    }

