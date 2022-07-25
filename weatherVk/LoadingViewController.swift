//
//  LoadingViewController.swift
//  weatherVk
//
//  Created by Арина Соколова on 23.07.2022.
//

import UIKit

class LoadingViewController: UIViewController {
    
    @IBOutlet weak var circleOne: UIImageView!
    @IBOutlet weak var circleTwo: UIImageView!
    @IBOutlet weak var circleThree: UIImageView!
    
    private let dot1Animation = CABasicAnimation(keyPath: "transform.scale")
    private let dot2Animation = CABasicAnimation(keyPath: "transform.scale")
    private let dot3Animation = CABasicAnimation(keyPath: "transform.scale")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupAnimation()
        startAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.stopAnimation()
            self.performSegue(withIdentifier: "MainScreen", sender: nil)
        }
    }
    
    func setupAnimation() {
        [dot1Animation, dot2Animation, dot3Animation].forEach {
            $0.autoreverses = true
            $0.duration = 0.5
            $0.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            $0.isRemovedOnCompletion = false
            $0.toValue = 0.7
            $0.repeatCount = Float.infinity
        }
    }
    
    public func startAnimation() {
        dot2Animation.beginTime = CACurrentMediaTime() + 0.25
        dot3Animation.beginTime = CACurrentMediaTime() + 0.5
        
        circleOne.layer.add(dot1Animation, forKey: "ScaleDot1Animation")
        circleTwo.layer.add(dot2Animation, forKey: "ScaleDot2Animation")
        circleThree.layer.add(dot3Animation, forKey: "ScaleDot3Animation")
    }
    
    public func stopAnimation() {
        [circleOne, circleTwo, circleThree].forEach {
            $0.layer.removeAllAnimations()
        }
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
