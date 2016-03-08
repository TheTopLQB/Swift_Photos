//
//  AlbumCollectionViewController.swift
//  Swift_Photos
//
//  Created by 李庆彬 on 3/6/16.
//  Copyright © 2016 LQB. All rights reserved.
//

import UIKit
import Photos


class AlbumCollectionViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    var fetchResult:PHFetchResult!
    var imageManager:PHImageManager!
    var cellSize:CGSize!
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.registerNib(UINib.init(nibName: "AlbumCollectionViewCell", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: "albumCell");
        self.collectionView.backgroundColor = UIColor.redColor();
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        let layout = UICollectionViewFlowLayout.init();
        self.collectionView.collectionViewLayout = layout;
        self.imageManager = PHImageManager.init();
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(self.fetchResult.count);
        return self.fetchResult.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("albumCell", forIndexPath: indexPath) as!AlbumCollectionViewCell;
        let asset:PHAsset = self.fetchResult[indexPath.item] as! PHAsset;
        let width = UIScreen.mainScreen().bounds.size.width;
        let cellWidth = (width - 50) / 4;

        self.imageManager.requestImageForAsset(asset, targetSize: CGSizeMake(cellWidth, cellWidth), contentMode: PHImageContentMode.AspectFill, options: nil) { (image, dic) -> Void in
            cell.image = image!;
        };
        cell.backgroundColor = UIColor.yellowColor();
        return cell;
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = UIScreen.mainScreen().bounds.size.width;
        let cellWidth = (width - 50) / 4;
        return CGSizeMake(cellWidth, cellWidth);
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 10, 10, 10);
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
