//
//  ViewController.swift
//  OnboardingScreenUI
//
//  Created by admin on 21/2/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var firstLabel: UITextView!
    @IBOutlet weak var secondLabel: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private var viewModel: OnboardingViewModel!

        override func viewDidLoad() {
            super.viewDidLoad()
            
            viewModel = OnboardingViewModel()
            setupUI()
            updatePage()

            nextButton.layer.cornerRadius = 25
            startButton.layer.cornerRadius = 25
            startButton.alpha = 0
            
        }
        
        func setupUI() {
            pageControl.numberOfPages = viewModel.pages.count
            pageControl.currentPage = 0
        }
        
        func updatePage() {
            let page = viewModel.pageForCurrentIndex()
            
            firstLabel.text = page.firstLabel
            secondLabel.text = page.secondLabel
            imageView.image = UIImage(named: page.imageView)
            view.backgroundColor = UIColor(named: page.backgroundColor)
            pageControl.currentPage = viewModel.currentPageIndex
            
            startButton.alpha = viewModel.shouldShowStartButton() ? 1 : 0
            
            nextButton.isHidden = viewModel.currentPageIndex == viewModel.pages.count - 1
                
            skipButton.isHidden = viewModel.currentPageIndex == viewModel.pages.count - 1
        }
        
        @IBAction func nextButtonTapped(_ sender: UIButton) {
            viewModel.nextPage()
            updatePage()
        }
        
        
        @IBAction func skipButtonTapped(_ sender: UIButton) {
            viewModel.currentPageIndex = viewModel.pages.count - 1
            updatePage()
        }

}
