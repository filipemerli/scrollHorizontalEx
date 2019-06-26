//
//  ViewController.swift
//  Banners
//
//  Created by Filipe on 26/06/19.
//  Copyright © 2019 Filipe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageDots: UIPageControl!
    
    var numberOfScrolls = CGFloat(3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self
        setUpUi()
    }

    func setUpUi() {
        self.scrollView.frame = CGRect(x:0, y:0, width:view.frame.width, height:view.frame.height)
        let scrollViewWidth:CGFloat = scrollView.frame.width
        let scrollViewHeight:CGFloat = scrollView.frame.height
        let imgOne = UIImageView(frame: CGRect(x:0, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgOne.image = #imageLiteral(resourceName: "image1")
        imgOne.backgroundColor = .red
        imgOne.contentMode = .scaleAspectFit
        let imgTwo = UIImageView(frame: CGRect(x:scrollViewWidth, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgTwo.image = #imageLiteral(resourceName: "image2")
        imgTwo.backgroundColor = .blue
        imgTwo.contentMode = .scaleAspectFit
        let imgThree = UIImageView(frame: CGRect(x:scrollViewWidth*2, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgThree.image = #imageLiteral(resourceName: "image3")
        imgThree.backgroundColor = .green
        imgThree.contentMode = .scaleAspectFit
        scrollView.addSubview(imgOne)
        scrollView.addSubview(imgTwo)
        scrollView.addSubview(imgThree)
        scrollView.contentSize = CGSize(width:(scrollView.frame.width * numberOfScrolls), height:scrollView.frame.height)
        pageDots.currentPage = 0
    }

    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        pageDots.currentPage = Int(currentPage)
        
    }
    
    @IBAction func moveToPage(_ sender: UIPageControl) {
        let page: Int? = sender.currentPage
        print("Current Page = \(String(describing: page))")
        var frame: CGRect = scrollView.frame
        frame.origin.x = frame.size.width * CGFloat(page ?? 0)
        frame.origin.y = 0
        scrollView.scrollRectToVisible(frame, animated: true)
    }

    
}

