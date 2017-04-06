//
//  ViewController.swift
//  scrollview 0406
//
//  Created by 黃毓皓 on 2017/4/6.
//  Copyright © 2017年 ice elson. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var myScrollview: UIScrollView!
    let imageView = UIImageView(image: UIImage(named: "sample.jpeg"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.contentMode = .scaleAspectFit
        myScrollview.addSubview(imageView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        imageView.frame = myScrollview.bounds
        let size = getImageSizeafterapscetfit()
        imageView.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    }
    
    func getImageSizeafterapscetfit() -> CGSize{
        guard imageView.image != nil else{
            return CGSize(width: 0, height: 0)
        }
        
        let widthRatio = imageView.bounds.size.width / (imageView.image?.size.width)!
        let heightRatio = imageView.bounds.size.height / (imageView.image?.size.height)!
        let scale = (widthRatio >= heightRatio) ? heightRatio : widthRatio
        let imageWidth = scale * imageView.image!.size.width
        let imageHeight = scale * imageView.image!.size.height
        
        return CGSize(width: imageWidth, height: imageHeight)
       
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

