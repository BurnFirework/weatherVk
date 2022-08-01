//
//  PhotosViewController.swift
//  weatherVk
//
//  Created by Арина Соколова on 28.07.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    var initialCenter = CGPoint()
    
    var selectedPhoto = 0
    
    var photos = [UIImage]()
    
    @IBOutlet weak var imagePhoto: UIImageView!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePhoto.image = photos[selectedPhoto]
        
        let swipe = UIPanGestureRecognizer(target: self, action: #selector(swipePhotos))
        imagePhoto.isUserInteractionEnabled = true
        imagePhoto.addGestureRecognizer(swipe)
        print("loaded")
    }
    
    @objc func swipePhotos(_ gestureRecognizer : UIPanGestureRecognizer) {
        let piece = gestureRecognizer.view!
        // Get the changes in the X and Y directions relative t
        // the superview's coordinate space.
        let translation = gestureRecognizer.translation(in: piece.superview)
        
        if gestureRecognizer.state == .began {
            // Save the view's original position.
            self.initialCenter = piece.center
        }
              // Update the position for the .began, .changed, and .ended states
        if gestureRecognizer.state != .cancelled {
            // Add the X and Y translation to the view's original position.
            let newCenter = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y)
            imagePhoto.center = newCenter
            
            let absoluteChangeX = abs(translation.x)
            imagePhoto.transform = .init(scaleX: 1 - absoluteChangeX / 800, y: 1 - absoluteChangeX / 800)
            
            if newCenter.x > initialCenter.x + 200 {
                if selectedPhoto > 0 {
                    selectedPhoto -= 1
                    imagePhoto.image = photos[selectedPhoto]
                    imagePhoto.center = CGPoint(x: initialCenter.x - 500, y: initialCenter.y)
                }
                
                gestureRecognizer.setTranslation(CGPoint(x: 0, y: 0), in: nil)
                imagePhoto.transform = .identity
                UIView.animate(withDuration: 0.5, animations: {
                    self.imagePhoto.center = self.initialCenter
                }) {_ in
                    gestureRecognizer.isEnabled = true
                }
                gestureRecognizer.isEnabled = false
            }
            
            if newCenter.x < initialCenter.x - 200 {
                if selectedPhoto < photos.count - 1 {
                    selectedPhoto += 1
                    imagePhoto.image = photos[selectedPhoto]
                    imagePhoto.center = CGPoint(x: initialCenter.x + 500, y: initialCenter.y)
                }
                
                gestureRecognizer.setTranslation(CGPoint(x: 0, y: 0), in: nil)
                imagePhoto.transform = .identity
                UIView.animate(withDuration: 0.5, animations: {
                    self.imagePhoto.center = self.initialCenter
                }) {_ in
                    gestureRecognizer.isEnabled = true
                }
                gestureRecognizer.isEnabled = false
            }
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.imagePhoto.transform = .identity
                self.imagePhoto.center = self.initialCenter
            }) {_ in
                gestureRecognizer.isEnabled = true
            }
            gestureRecognizer.isEnabled = false
        }
        
        if gestureRecognizer.state == .ended {
            UIView.animate(withDuration: 0.5, animations: {
                self.imagePhoto.transform = .identity
                self.imagePhoto.center = self.initialCenter
            }) {_ in
                gestureRecognizer.isEnabled = true
            }
            gestureRecognizer.isEnabled = false
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
