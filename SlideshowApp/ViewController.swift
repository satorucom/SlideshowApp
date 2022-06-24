//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 皆川 智 on 2022/06/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    var currentImageIndex: Int = 0
    var timer: Timer!
    var isEnabledSlideShow: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.showImage(index: currentImageIndex)
    }

    //画像を表示する
    private func showImage(index: Int) {
        let imageName = self.getImageList()[index]
        imageView.image = UIImage(named: imageName)

    }
    //スライドショーに用いる画像リストを取得
    private func getImageList() -> Array<String> {
        let imageList:[String] = ["free_mountains", "free_rainbow", "free_sea"]
        return imageList
    }
    
    private func showNextImage() {
        let imageIndex: Int = currentImageIndex >= self.getImageList().count - 1 ? 0 : currentImageIndex + 1
        currentImageIndex = imageIndex
        self.showImage(index: imageIndex)
    }

    //画像を進める
    @IBAction func showNext(_ sender: Any) {
        self.showNextImage()
    }
    
    //画像を戻す
    @IBAction func showPrev(_ sender: Any) {
        let imageIndex: Int = currentImageIndex == 0 ? self.getImageList().count - 1 : currentImageIndex - 1
        currentImageIndex = imageIndex
        self.showImage(index: imageIndex)
    }

    @objc func updateTimer(_ timer: Timer) {
        self.showNextImage()
    }

    private func startSlideShow() {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        }
        isEnabledSlideShow = true
        startButton.setTitle("停止", for: .normal)
        //戻る/進むボタンを押せなくする
        prevButton.isEnabled = false
        nextButton.isEnabled = false
    }
    
    private func stopSlideShow() {
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
        isEnabledSlideShow = false
        startButton.setTitle("再生", for: .normal)
        //戻る/進むボタンを押せるようにする
        prevButton.isEnabled = true
        nextButton.isEnabled = true
    }

    //再生/停止ボタンが押されたとき
    @IBAction func startOrStop(_ sender: Any) {
        if !isEnabledSlideShow {
            self.startSlideShow()
        } else {
            self.stopSlideShow()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //スライドショーが有効な場合。停止させる
        if isEnabledSlideShow {
            self.stopSlideShow()
            startButton.setTitle("再生/停止", for: .normal)
        }
        let expantionViewController:ExpansionViewController = segue.destination as! ExpansionViewController
        expantionViewController.imageName = self.getImageList()[currentImageIndex]
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }

    
}

