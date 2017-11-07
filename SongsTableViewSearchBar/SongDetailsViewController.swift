//
//  SongDetailsViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class SongDetailsViewController: UIViewController {
    
    var namePassedOver: String?
    var artistPassedOver: String?
    var imagePassedOver: UIImage?

    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var SongImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SongImageView.image = UIImage(named: "loveSongs")
        songNameLabel.text = namePassedOver
        artistNameLabel.text = artistPassedOver
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
