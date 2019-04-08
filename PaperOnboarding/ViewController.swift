//
//  ViewController.swift
//  PaperOnboarding
//
//  Created by Roseanne Choi on 4/6/19.
//  Copyright © 2019 Roseanne Choi. All rights reserved.
//

import UIKit
import paper_onboarding

class ViewController: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate
{
    @IBOutlet weak var onboardingView: OnboardingView!
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        onboardingView.dataSource = self
        onboardingView.delegate = self
    }
    
    func onboardingItemsCount() -> Int
    {
        return 3
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo
    {
        let pageIcon = UIImage()
        let titleFont = UIFont(name: "Didot-Bold", size: 26)!
        let descriptionFont = UIFont(name: "Didot", size: 18)!
        
        let firstImage = UIImage(contentsOfFile: Bundle.main.path(forResource: "bmwblackemblem", ofType: "jpg")!)
        let secondImage = UIImage(contentsOfFile: Bundle.main.path(forResource: "bmwblueemblem", ofType: "jpg")!)
        let thirdImage = UIImage(contentsOfFile: Bundle.main.path(forResource: "bmwredemblem", ofType: "jpg")!)
        
        let firstItemInfo = OnboardingItemInfo(informationImage: firstImage!,
                                               title: "Black Emblem",
                                               description: "Tart powder toffee cotton candy pudding jelly gummies. Chocolate cake carrot cake sesame snaps jelly-o. Chupa chups chocolate cake apple pie tootsie roll. Cookie carrot cake icing.",
                                               pageIcon: pageIcon,
                                               color: UIColor.black,
                                               titleColor: UIColor.white,
                                               descriptionColor: UIColor.white,
                                               titleFont: titleFont,
                                               descriptionFont: descriptionFont)
        
        let secondItemInfo = OnboardingItemInfo(informationImage: secondImage!,
                                                title: "Blue Emblem",
                                                description: "Croissant chupa chups ice cream macaroon. Sugar plum macaroon apple pie. Chocolate cake candy canes lemon drops.",
                                                pageIcon: pageIcon,
                                                color: UIColor.blue,
                                                titleColor: UIColor.white,
                                                descriptionColor: UIColor.white,
                                                titleFont: titleFont,
                                                descriptionFont: descriptionFont)
        
        let thirdItemInfo = OnboardingItemInfo(informationImage: thirdImage!,
                                               title: "Red Emblem",
                                               description: "Biscuit chocolate jelly tiramisu topping liquorice carrot cake tiramisu. Gummi bears donut toffee sweet. Oat cake sesame snaps donut dessert. Candy canes chocolate bonbon sweet chocolate cake chocolate cake ice cream cupcake.",
                                               pageIcon: pageIcon,
                                               color: UIColor.red,
                                               titleColor: UIColor.white,
                                               descriptionColor: UIColor.white,
                                               titleFont: titleFont,
                                               descriptionFont: descriptionFont)
        
        return [firstItemInfo, secondItemInfo, thirdItemInfo][index]
    }
    
    func onboardingConfigurationItem(_: OnboardingContentViewItem, index _: Int)
    {
        
    }
    
    func onboardingWillTransitonToIndex(_ index: Int)
    {
        if (index == 1)
        {
            UIView.animate(withDuration: 0.5)
            {
                self.enterButton.alpha = 0
            }
        }
    }
    
    @IBAction func gotStarted(_ sender: Any)
    {
        let userDefaults = UserDefaults.standard
        
        userDefaults.set(true, forKey: "onboardingComplete")        
    }
    
    
    func onboardingDidTransitonToIndex(_ index: Int)
    {
        if (index == 2)
        {
            UIView.animate(withDuration: 0.5)
            {
                self.enterButton.alpha = 1
            }
        }
    }
}

