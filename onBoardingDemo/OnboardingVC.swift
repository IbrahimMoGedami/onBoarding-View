//
//  OnboardingVC.swift
//  onBoardingDemo
//
//  Created by Ibrahim Mo Gedami on 04/02/2022.
//

import UIKit

class OnboardingVC : UIViewController{
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    var slides: [OnboardingSlide] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            } else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
            OnboardingSlide(title: "Welcome", description: "value proposition #1 plug in device using charger provided Device will charge fully in under 20 minutes.", image: #imageLiteral(resourceName: "screen1")),
            OnboardingSlide(title: "Charging your device", description: "value proposition #1 plug in device using charger provided Device will charge fully in under 20 minutes.", image: #imageLiteral(resourceName: "screen2")),
            OnboardingSlide(title: "First Puff", description: "value proposition #1 plug in device using charger provided Device will charge fully in under 20 minutes.", image: #imageLiteral(resourceName: "screen3")),
            OnboardingSlide(title: "Usage Statistics", description: "value proposition #1 plug in device using charger provided Device will charge fully in under 20 minutes.", image: #imageLiteral(resourceName: "screen4")),
            OnboardingSlide(title: "Device Locator", description: "value proposition #1 plug in device using charger provided Device will charge fully in under 20 minutes.", image: #imageLiteral(resourceName: "screen5")),
            OnboardingSlide(title: "Lock & Unlock", description: "value proposition #1 plug in device using charger provided Device will charge fully in under 20 minutes.", image: #imageLiteral(resourceName: "screen6"))
        ]
        nextBtn.layer.cornerRadius = 10
        
        pageControl.numberOfPages = slides.count
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            /**Push to Home ViewController*/
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension OnboardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.identifier, for: indexPath) as? OnboardingCell{
            cell.setup(slides[indexPath.row])
            return cell
        }else{
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
