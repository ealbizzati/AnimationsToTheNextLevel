//
//  PropertiesTransformView.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 08/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class PropertiesTransformView: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet var animatedViews: [UIView]!
    
    var animator: UIViewPropertyAnimator?
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
    init() {
        super.init(nibName: String(describing: PropertiesTransformView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        self.scrollView.contentInsetAdjustmentBehavior = .never
        self.scrollView.delegate = self
        
        self.animatedViews.forEach { $0.layer.cornerRadius = 20 }
        self.animatedViews.forEach { $0.isUserInteractionEnabled = false }
        self.animatedViews.forEach { $0.backgroundColor = .lightGray }
        self.setupAnimator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func setupAnimator() {
        
        self.animator = UIViewPropertyAnimator(duration: 0.3, curve: .linear, animations: {
            
            self.animatedViews.forEach { view in
                let random:CGFloat = CGFloat((2...5).randomElement()!)
                view.transform = CGAffineTransform(scaleX: random, y: random)
                view.alpha = 0.7
            }
            
        })
        
        animator?.pausesOnCompletion = true
        
    }
    
}

extension PropertiesTransformView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let percent = scrollView.contentOffset.x / (scrollView.contentSize.width - scrollView.frame.width)
        animator?.fractionComplete = percent
    }
    
}
