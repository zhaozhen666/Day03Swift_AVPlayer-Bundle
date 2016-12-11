//
//  ViewController.swift
//  Day03_PlayVideo
//
//  Created by zhaozhen on 16/12/8.
//  Copyright © 2016年 zhaozhen. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var playtableView: UITableView!
    var data = [
        
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
        
    ]
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //在viewDidLoad方法中
        let cellNib = UINib(nibName: "VideoViewCell", bundle: nil)
        playtableView.register(cellNib, forCellReuseIdentifier: "VideoViewCell")
        playtableView.delegate=self
        playtableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //在TableView的代理中
        let cell = playtableView.dequeueReusableCell(withIdentifier: "VideoViewCell") as! VideoViewCell
        let video = data[indexPath.row]
        cell.backImg.image = UIImage.init(named: video.image)
        cell.playbtn .addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        return cell
    }
    
    
    func btnClicked()  {
        let path = Bundle.main.path(forResource: "emoji", ofType:"mp4")
        playerView = AVPlayer(url: URL(fileURLWithPath: path!) as URL)
        
        playViewController.player = playerView
        
        self.present(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
    }

    

}

