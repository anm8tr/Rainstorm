//
//  RootViewController.swift
//  Rainstorm
//
//  Created by Richard Garrison on 4/3/21.
//

import UIKit

final class RootViewController: UIViewController {
    
     // Mark: - Properties
    
    private let dayViewController: DayViewController = {
        guard let dayViewController = UIStoryboard.main.instantiateViewController(identifier: DayViewController.storyboardIdentifier) as? DayViewController else {
            fatalError("Unable to instantiate Day View Controller")
        }
        
        // Configure Day View Controller
        dayViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        return dayViewController
    }()
    
    private let weekViewController: WeekViewController = {
        guard let weekViewController = UIStoryboard.main.instantiateViewController(identifier: WeekViewController.storyboardIdentifier) as? WeekViewController else {
            fatalError("Unable to instantiate Day View Controller")
        }
        
        // Configure Week View Controller
        weekViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        return weekViewController
    }()
    
     // Mark: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Child Vi ew Controllers
        setupChildViewControllers()
       
    }
    
     // Mark: - Helper Methods
    
    private func setupChildViewControllers() {
        addChild(dayViewController)
        addChild(weekViewController)
         
        view.addSubview(dayViewController.view)
        view.addSubview(weekViewController.view)
        
        NSLayoutConstraint.activate([
            dayViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            dayViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            dayViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            dayViewController.view.heightAnchor.constraint(equalToConstant: Layout.DayView.height),
            
            weekViewController.view.topAnchor.constraint(equalTo: dayViewController.view.bottomAnchor),
            weekViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            weekViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            weekViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        dayViewController.didMove(toParent: self)
        weekViewController.didMove(toParent: self)
        
    }


}

extension RootViewController {
    
    fileprivate enum Layout {
        enum DayView {
            static let height: CGFloat = 200
        }
    }
}

