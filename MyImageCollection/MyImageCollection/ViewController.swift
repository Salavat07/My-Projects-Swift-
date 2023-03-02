//
//  ViewController.swift
//  MyImageCollection
//
//  Created by Salavat on 26.02.2023.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionViewOne: UICollectionView!
    @IBOutlet weak var collectionViewTwo: UICollectionView!
    
    let arrayTempareture = ["temp.green",
                            "temp.blackGreen",
                            "temp.lightYellow",
                            "temp.darkYellow",
                            "temp.orange",
                            "temp.red"]
    
    let arraySmiles = ["bad",
                       "nice",
                       "hate",
                       "favorite",
                       "notPleasant",
                       "routine"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewOne.delegate = self
        collectionViewOne.dataSource = self
        collectionViewTwo.delegate = self
        collectionViewTwo.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ShowImageVC") as? ShowImageVC else { return }
        var currentSelectedImage: String!
     
        if collectionView == collectionViewOne{
          currentSelectedImage = arrayTempareture[indexPath.row]
        }
     
        if collectionView == collectionViewTwo{
          currentSelectedImage = arraySmiles[indexPath.row]
        }
     
        vc.setImageName(name: currentSelectedImage)
        present(vc, animated: true, completion: nil)
      }
     
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewOne {
              return arrayTempareture.count
            }
            if collectionView == collectionViewTwo {
              return arraySmiles.count
            }
            return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewOne{
          if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellOne", for: indexPath) as? Cell {
            let imageName = arrayTempareture[indexPath.row]
            cell.setTemparetureImage(tempName: imageName)
            return cell
          }
        }
        if collectionView == collectionViewTwo{
          if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTwo", for: indexPath) as? Cell {
            let imageName = arraySmiles[indexPath.row]
            cell.setSmileImage(smileName: imageName)
            return cell
          }
        }
        return UICollectionViewCell()
      }
}

