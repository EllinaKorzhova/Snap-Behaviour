//
//  ViewController.swift
//  AnimationRectangle
//
//  Created by Эллина Коржова on 17.03.23.
//

import UIKit

import UIKit

class ViewController: UIViewController {
    
    var snap: UISnapBehavior!
    var animator: UIDynamicAnimator!
    var animateView: UIView!
    var colision: UICollisionBehavior!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        animateView.center = view.center
        animateView.backgroundColor = .systemBlue
        animateView.layer.cornerRadius = 10
        animateView.layer.masksToBounds = true
        view.addSubview(animateView)
        createGesture()
        createAnimator()
    }
    
    func createAnimator(){
        animator = UIDynamicAnimator(referenceView: view)
        snap = UISnapBehavior(item: animateView, snapTo: animateView.center)
        animator.addBehavior(snap)
        colision = UICollisionBehavior(items: [animateView])
        colision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(colision)
    }
    
    func createGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(randomTap:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(randomTap: UITapGestureRecognizer){
        let tapPoint = randomTap.location(in: view)
        if snap != nil {
            animator.removeBehavior(snap)
        }
        snap = UISnapBehavior(item: animateView, snapTo: tapPoint)
        snap.damping = 0.7
        animator.addBehavior(snap)
    }
}
