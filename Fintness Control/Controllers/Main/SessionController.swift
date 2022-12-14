//
//  SessionController.swift
//  Fintness Control
//
//  Created by Mikhail Kolkov on 11/15/22.
//

import UIKit

class SessionController: RootViewController {
    //MARK: - Properties
    
    private let timerView : TimerView = {
        let view = TimerView()
        
        return view
    }()
    
    private let statsView = SessionStatsView(with: "Workout Stats".uppercased())
    
    private let stepsView = SessionStepsView(with: "Steps Counter".uppercased())
    
    //MARK: - Lifecycle
    
    //MARK: - Helpers
}

extension SessionController {
    override func addView() {
        super.addView()
        
        view.addActivatedView(timerView)
        view.addActivatedView(statsView)
        view.addActivatedView(stepsView)
    }
    
    override func layout() {
        super.layout()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            statsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 11),
            statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            statsView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -7.5),
            
            stepsView.topAnchor.constraint(equalTo: statsView.topAnchor),
            stepsView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 7.5),
            stepsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stepsView.heightAnchor.constraint(equalTo: statsView.heightAnchor)
        ])
    }
    
    override func configure() {
        super.configure()
        
        title = "High Intensity Cardio"
        navigationController?.tabBarItem.title = Resourses.Strings.session
        
        addNavButton(at: .left, with: "Pause")
        addNavButton(at: .right, with: "Finish")
        
        statsView.configureStack(with: [.heartRate(value: "155"),
                                        .averagePace(value: "9'20"),
                                        .totalSteps(value: "7,682"),
                                        .totalDistance(value: "8.25")])
        
        stepsView.configure(with: [ .init(value: "8k", height: 1, title: "2/14"),
                                    .init(value: "7k", height: 0.8, title: "2/15"),
                                    .init(value: "5k", height: 0.6, title: "2/16"),
                                    .init(value: "6k", height: 0.7, title: "2/17")
        ])
    }
}
