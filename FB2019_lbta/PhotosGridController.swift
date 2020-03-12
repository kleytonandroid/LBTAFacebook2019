//
//  PhotosGridController.swift
//  FB2019_lbta
//
//  Created by Kleyton Santos on 06/03/20.
//  Copyright © 2020 Kleyton Santos. All rights reserved.
//

import UIKit
import SwiftUI
import LBTATools

class PhotoGridCell: LBTAListCell<String> {
    
    override var item: String! {
        didSet {
            imageView.image = UIImage(named: item)
        }
    }
    
    let imageView = UIImageView(image: UIImage.init(named: "avatar1"), contentMode: .scaleAspectFill)
    
    override func setupViews() {
        backgroundColor = .yellow
        
//        addSubview(imageView)
//        imageView.fillSuperview()
        
        stack(imageView)
    }
}

class PhotosGridController: LBTAListController<PhotoGridCell, String>, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .lightGray
        
        self.items = ["avatar1","story_photo1","story_photo2","avatar1","avatar1"]
    }
    
    let cellSpacing: CGFloat = 4
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 || indexPath.item == 1 {
            let width = (view.frame.width - 3 * cellSpacing) / 2
            
            return .init(width: width, height: width)
        }
        
         let width = (view.frame.width - 4 * cellSpacing) / 3
        
        return .init(width:width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: cellSpacing, bottom: 0, right: cellSpacing)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
}

struct PhotoGridPreview: PreviewProvider {
    static var previews: some View {
        ContainerView()
        
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<PhotoGridPreview.ContainerView>) -> UIViewController {
            return PhotosGridController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<PhotoGridPreview.ContainerView>) {
            
        }
    }
}
