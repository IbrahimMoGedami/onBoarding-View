//
//  OnboardingCell.swift
//  onBoardingDemo
//
//  Created by Ibrahim Mo Gedami on 04/02/2022.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLbl: UILabel!
    @IBOutlet weak var slideDescriptionLbl: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLbl.text = slide.title
        slideDescriptionLbl.text = slide.description
    }
}
