//
//  GridFlowLayout.swift
//  RMComponents
//
//  Created by SemihTOY on 12.09.2023.
//

import UIKit

public class GridFlowLayout: UICollectionViewFlowLayout {

  // here you can define the height of each cell
  let itemHeight: CGFloat = 315
  var itemWidth: CGFloat {
    return (UIScreen.main.bounds.width - 30) / 2
  }

  override public init() {
    super.init()
    setupLayout()
  }

  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupLayout()
  }

  func setupLayout() {
    minimumInteritemSpacing = 1
    minimumLineSpacing = 10
    scrollDirection = .vertical
  }

  public override var itemSize: CGSize {
    set {
      self.itemSize = CGSize(width: itemWidth, height: itemHeight)
    }
    get {
      return CGSize(width: itemWidth, height: itemHeight)
    }
  }

  public override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
    return collectionView!.contentOffset
  }
}
