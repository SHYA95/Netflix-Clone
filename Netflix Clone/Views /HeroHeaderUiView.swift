//
//  HeroHeaderUiView.swift
//  Netflix Clone
//
//  Created by Shrouk Yasser on 06/02/2023.
//

import UIKit

class HeroHeaderUiView: UIView {

    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "dune")
        return imageView
        
    }()
    private let playButton :UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
        
    }()
    
    private let DownloadButton :UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
        
    }()
    
    
    
    private func  addGradient (){
        let gradiantLayer = CAGradientLayer()
        gradiantLayer.colors = [
            UIColor.clear.cgColor ,
            UIColor.systemBackground.cgColor
        ]
        gradiantLayer.frame = bounds
        layer.addSublayer(gradiantLayer)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient ()
        addSubview(playButton)
        addSubview(DownloadButton)
        applyConstrains()
    }
    
    private func applyConstrains(){
        let playButtonConstrains = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor ,constant: 70),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        let downloadButtonConstrains = [
            DownloadButton.trailingAnchor.constraint(equalTo: trailingAnchor ,constant: -70),
            DownloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            DownloadButton.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        NSLayoutConstraint.activate(downloadButtonConstrains)
        NSLayoutConstraint.activate(playButtonConstrains)
    }
   
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    

    required init?(coder: NSCoder) {
       fatalError()
    }
    
   
}
