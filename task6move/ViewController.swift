//
//  ViewController.swift
//  task6move
//
//  Created by Vladislav Dudevich on 17.07.2023.
//

import UIKit

class ViewController: UIViewController {

    private let squreView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.cornerCurve = .continuous
        view.backgroundColor = .systemBlue
        return view
    }()

    private lazy var animator = UIDynamicAnimator(referenceView: view)

    override func viewDidLoad() {
        super.viewDidLoad()
        squreView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        squreView.center = view.center
        view.addSubview(squreView)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }

        let touchPoint = touch.location(in: view)
        animator.removeAllBehaviors()
        let snapping = UISnapBehavior(item: squreView, snapTo: touchPoint)
        snapping.damping = 0.85
        let collision = UICollisionBehavior(items: [squreView])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        animator.addBehavior(snapping)
    }
}
