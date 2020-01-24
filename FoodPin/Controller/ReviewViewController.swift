//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by shuo on 2019/12/17.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var rateButtons: [UIButton]!
    @IBOutlet var crossButton: UIButton!
    
    
    var restaurant: RestaurantMO!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let restaurantImage = restaurant.image {
            backgroundImageView.image = UIImage(data: restaurantImage as Data)
        }
        
        
        //應用模糊背景
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        
        let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0)
        let scaleUpTransform = CGAffineTransform.init(scaleX: 5.0, y: 5.0)
        let moveScaleTransform = scaleUpTransform.concatenating(moveRightTransform)
        let moveTopTransform = CGAffineTransform.init(translationX: 0, y: -600)
        
        //使按鈕隱藏並移至畫面外
        for rateButton in rateButtons {
            rateButton.transform = moveScaleTransform
            rateButton.alpha = 0
        }
        crossButton.transform = moveTopTransform
        crossButton.alpha = 0
    }
    
    //加入淡入效果
    override func viewWillAppear(_ animated: Bool) {
        
        var delay: Double = 0.1
        
        for rateButton in 0...4 {
            UIView.animateKeyframes(withDuration: 0.4, delay: delay, options: [], animations: {
                self.rateButtons[rateButton].alpha = 1.0
                self.rateButtons[rateButton].transform = .identity
            }, completion: nil)
            
            delay += 0.05
        }
        
        UIView.animate(withDuration: 0.8, delay: 0, options: [], animations: {
            self.crossButton.alpha = 1.0
            self.crossButton.transform = .identity
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
