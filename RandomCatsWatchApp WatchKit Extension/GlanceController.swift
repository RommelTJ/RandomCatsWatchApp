//
//  GlanceController.swift
//  RandomCatsWatchApp
//
//  Created by Rommel Rico on 4/20/15.
//  Copyright (c) 2015 Rommel Rico. All rights reserved.
//

import WatchKit
import Foundation


class GlanceController: WKInterfaceController {

    @IBOutlet weak var catImage: WKInterfaceImage!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var url = NSURL(string: "http://thecatapi.com/api/images/get?format=src&type=png")
        var imageRequest = NSURLRequest(URL: url!)
        NSURLConnection.sendAsynchronousRequest(imageRequest, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            if error == nil {
                var image = UIImage(data: data)
                self.catImage.setImage(image)
            } else {
                println("We got an error \(error)")
            }
        }
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
