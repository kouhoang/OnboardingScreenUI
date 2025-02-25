//
//  OnboardingViewModel.swift
//  OnboardingScreenUI
//
//  Created by admin on 21/2/25.
//

import UIKit

class OnboardingViewModel {
    var pages: [ScreenModel] = []
    var currentPageIndex: Int = 0 {
        didSet {
            updatePage()
        }
    }
    
    init() {
        pages = [
            ScreenModel(firstLabel: "Track your work and get the result", secondLabel: "Remember to keep track of your professional accomplishments", imageView: "candidate-interview-1", backgroundColor: "background1"),
            ScreenModel(firstLabel: "Stay organized with team", secondLabel: "But understanding the contributions our colleagues make to our teams and companies", imageView: "candidate-interview-2", backgroundColor: "background2"),
            ScreenModel(firstLabel: "Get notified when work happens", secondLabel: "Takes control of notifications, collaborate live or on your own time", imageView: "candidate-interview-3", backgroundColor: "background3"),
            
        ]
    }
    
    func nextPage() {
        if currentPageIndex < pages.count - 1 {
            currentPageIndex += 1
        }
    }
    
    func updatePage() {
        // Logic to update UI based on the current page index
    }
    
    func shouldShowStartButton() -> Bool {
        return currentPageIndex == pages.count - 1
    }
    
    func pageForCurrentIndex() -> ScreenModel {
        return pages[currentPageIndex]
    }
}
