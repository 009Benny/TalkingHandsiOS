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
    var youtubeID:String?
    var delegate:ViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.youtubeID = "SXNJCma9MEc"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.layoutIfNeeded()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.layoutIfNeeded()
        self.configYouTube()
    }
    
    func configYouTube(){
        if self.viewYoutube != nil{
            self.view.layoutIfNeeded()
            self.ytPlayer = YTPlayerView(frame: self.viewYoutube!.bounds)
            self.ytPlayer?.load(withVideoId: self.youtubeID ?? "")
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
    
    @IBAction func btnCamera(_ sender: Any) {
//        self.delegate?.showCamera()
        let controller = CameraViewController(nibName: "CameraViewController", bundle: nil)
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
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
    
    //MARK: - System
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
}
