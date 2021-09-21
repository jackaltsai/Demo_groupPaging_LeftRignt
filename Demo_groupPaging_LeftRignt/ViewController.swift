//
//  ViewController.swift
//  Demo_groupPaging_LeftRignt
//
//  Created by 蔡忠翊 on 2021/9/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    /*  水平捲動，分頁 & 顯示上一個 / 下一個的部分內容 */
    // 範例 1: group 裡有一個 item 使用 groupPagingCentered。從 item 的 contentInsets 設間距，item 之間的間距將是 space * 2。另外記得要將 collectionView 的 isScrollEnabled 設為 false，不然畫面還是可以垂直捲動
    // label 的 vertical content hugging 設為 252，vertical content compression 設為 751
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = generateLayout()
        collectionView.isScrollEnabled = false
    }
    
    func generateLayout() -> UICollectionViewLayout {
        let space: Double = 5
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: space, bottom: 0, trailing: space)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .groupPagingCentered
        return UICollectionViewCompositionalLayout(section: section)
    }
    

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CollectionViewCell.self)", for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage(named: "Image\(indexPath.item + 1)")
        cell.label.text = "Image\(indexPath.item + 1)"
        return cell
    }
    
    
}
