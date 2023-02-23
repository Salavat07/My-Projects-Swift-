//
//  MyCollectionVC.swift
//  PracticeCollectionView
//
//  Created by Salavat on 21.02.2023.
//

import UIKit

private let reuseIdentifier = "ItemCell"
private let customReuseIdentifier = "CustomItemCell"


class MyCollectionVC: UICollectionViewController {

    struct StructCustomItem{
        
   var image:String
   var textOne:String
   var textTwo:String
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let xib = UINib(nibName: customReuseIdentifier, bundle: nil)
            collectionView.register(xib, forCellWithReuseIdentifier: customReuseIdentifier)
        
        arrayItems.append(StructItem(image: "temp.darkYellow", text: "Dark yellow color"))
        arrayItems.append(StructItem(image: "temp.orange", text: "Orange color"))
        arrayItems.append(StructItem(image: "temp.red", text: "Red color"))
        arrayCistomItem.append(StructCustomItem(image: "temp.lightYellow", textOne: "Light Yellow Color", textTwo: "item one"))
        arrayCistomItem.append(StructCustomItem(image: "temp.orange", textOne: "Orange Color", textTwo: "item two"))
        arrayCistomItem.append(StructCustomItem(image: "temp.red", textOne: "Red Color", textTwo: "item three"))
    }

    var arrayCistomItem = [StructCustomItem]()

    
    struct StructItem{
        let image:String
        let text:String
    }
    
    var arrayItems = [StructItem]()


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
      //  return arrayItems.count
        return arrayCistomItem.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customReuseIdentifier, for: indexPath) as? CustomItemCell {
            cell.imageView.image = UIImage(named: arrayCistomItem[indexPath.row].image)
            cell.labelTextOne.text = arrayCistomItem[indexPath.row].textOne
            cell.labelTextTwo.text = arrayCistomItem[indexPath.row].textTwo
          return cell
        }
        return UICollectionViewCell()
      }

 

}
