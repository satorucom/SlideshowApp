//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by 皆川 智 on 2022/06/20.
//

import UIKit

class ExpansionViewController: UIViewController {

    @IBOutlet weak var expantionImage: UIImageView!
    var imageName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        expantionImage.image = UIImage(named: imageName)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
