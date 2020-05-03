//
//  ExampleViewController.swift
//  TalkingHandsApp
//
//  Created by Sandra on 3/6/20.
//  Copyright © 2020 TalkingHands. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class ExampleViewController: UIViewController, YTPlayerViewDelegate {
    @IBOutlet weak var viewYoutube: UIView?
    var ytPlayer:YTPlayerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configYouTube()
    }
    
    func configYouTube(){
        if self.viewYoutube != nil{
            self.ytPlayer = YTPlayerView(frame: self.viewYoutube!.bounds)
            self.ytPlayer?.load(withVideoId: "SXNJCma9MEc&t=1s", playerVars: [
                "playsinline":1,
                "modestbranding":1,
                "rel":0,
                "showinfo":0,
                "autoplay":1,
                "origin":"http://www.youtube.com/"
            ])
            self.viewYoutube!.addSubview(self.ytPlayer!)
            self.ytPlayer!.backgroundColor = .black
            self.ytPlayer!.isOpaque = false
            self.ytPlayer?.delegate = self
        }
    }

    // MARK: - Button Actions
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    //MARK: - VideoYouTubeDelegate
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        print("ready")
    }
    
    func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState) {
        switch state {
        case .paused:
            print("VIDEO: paused")
            break
        case .playing:
            print("VIDEO: playing")
            break
        case .ended:
            print("VIDEO: ended")
            break
        case .queued:
            print("VIDEO: queued")
            break
        case .buffering:
            print("VIDEO: buffering")
            break
        case .unstarted:
            print("VIDEO: unstarted")
            break
        default:
            break
        }
    }
    
    func playerView(_ playerView: YTPlayerView, receivedError error: YTPlayerError) {
        print("VIDEO: error \(error.hashValue)")
    }
    
}
