//
//  ViewController.swift
//  InstaHighlights
//
//  Created by Vania Radmila Alfitri on 05/05/19.
//  Copyright © 2019 Vania Radmila Alfitri. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var imageView: UIImageView!
    
    let items = [UIImage(named: "pasta2"), UIImage(named: "pasta"), UIImage(named: "fettuccine"), UIImage(named: "pasta2"), UIImage(named: "pasta"), UIImage(named: "fettuccine"), UIImage(named: "pasta2"), UIImage(named: "pasta"), UIImage(named: "fettuccine"), UIImage(named: "pasta2"), UIImage(named: "pasta"), UIImage(named: "fettuccine"), UIImage(named: "pasta2"), UIImage(named: "pasta"), UIImage(named: "fettuccine"), UIImage(named: "pasta2"), UIImage(named: "pasta"), UIImage(named: "fettuccine"), UIImage(named: "pasta2"), UIImage(named: "pasta"), UIImage(named: "fettuccine"), UIImage(named: "pasta2"), UIImage(named: "pasta"), UIImage(named: "fettuccine"), UIImage(named: "pasta2"), UIImage(named: "pasta"), UIImage(named: "fettuccine"), UIImage(named: "pasta2"), UIImage(named: "pasta"), UIImage(named: "fettuccine")]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.itemImage.image = items[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        imageView.image = items[indexPath.item]
    }

    @IBAction func savePhoto(_ sender: Any) {
        
        let imageData = imageView.image!.pngData()
        let compressedImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedImage!, nil, nil, nil)
        
        let alert = UIAlertController(title: "Saved", message: "Your image has been saved", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
}

