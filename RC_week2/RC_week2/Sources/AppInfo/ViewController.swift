//
//  ViewController.swift
//  RC_week2
//
//  Created by 소정의 Mac on 2022/08/16.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var appStartButton: UIButton!
    @IBAction func appStart(_ sender: Any) {
        
    }
    
    var images = [#imageLiteral(resourceName: "appInfo_1.jpg"), #imageLiteral(resourceName: "appInfo_2.jpg"), #imageLiteral(resourceName: "appInfo_3.jpg"), #imageLiteral(resourceName: "appInfo_4.jpg"), #imageLiteral(resourceName: "appInfo_5.jpg"), #imageLiteral(resourceName: "appInfo_6.jpg")]
    var imageViews = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appStartButton.isHidden = true
        scrollView.delegate = self
        addContentScrollView()
        setPageControl()
    }

    private func addContentScrollView(){
        for i in 0..<images.count {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.backgroundColor = UIColor(red: 0, green: 0.5377243161, blue: 0.2155238986, alpha: 1)
            let xPos = scrollView.frame.width * CGFloat(i)
            imageView.frame=CGRect(x: xPos, y:0, width: self.view.bounds.width, height:scrollView.bounds.height)
            imageView.image = images[i]
            scrollView.addSubview(imageView)
            scrollView.contentSize.width = scrollView.frame.width * CGFloat(i+1)
            if i == 6 {
                appStartButton.isHidden = false
            }
        }
    }

    //페이지 컨트롤 세팅
    private func setPageControl() {
        pageControl.numberOfPages = images.count
    }
    
    //선택된 페이지
    private func setPageControlSelectedPage(currentPage: Int) {
        pageControl.currentPage = currentPage
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x/scrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }

}


