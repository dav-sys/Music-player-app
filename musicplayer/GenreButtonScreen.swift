//
//  ViewController.swift
//  musicplayer
//
//  Created by David Taddese on 13/10/2021.
//

import UIKit
import MediaPlayer


var musicplayer = MPMusicPlayerController.applicationMusicPlayer //

class GenreButtonScreen: UIViewController {
    
    @IBAction func GenreButtonTapped(_ sender: UIButton) {
        // request auth, get status, check status = authorized 
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized{
                self.playGenre(genre: sender.currentTitle!)
            }
        }
        
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        musicplayer.skipToNextItem()
    }
    
    @IBAction func StoppedButtonTapped(_ sender: UIButton) {
        musicplayer.stop()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func playGenre(genre : String){
        
        musicplayer.stop()
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicplayer.setQueue(with: query)
        musicplayer.shuffleMode = .songs
        musicplayer.play()
    }
    
}

