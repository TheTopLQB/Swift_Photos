//
//  AlbumTableViewController.swift
//  Swift_Photos
//
//  Created by 李庆彬 on 3/6/16.
//  Copyright © 2016 LQB. All rights reserved.
//

import UIKit
import Photos

class AlbumTableViewController: UITableViewController {
    var fetchresults:[PHFetchResult] = [];
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView();
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "reuseIdentifier");
        
        let allPhotos = PHAsset.fetchAssetsWithOptions(nil);
        self.fetchresults = [allPhotos];
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.fetchresults.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        cell.selectionStyle = UITableViewCellSelectionStyle.None;
        cell.textLabel?.text = "所有照片";
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let albumCollectionVC = AlbumCollectionViewController();
        albumCollectionVC.fetchResult = self.fetchresults[0];
        self.navigationController?.pushViewController(albumCollectionVC, animated: true);
    }

}
