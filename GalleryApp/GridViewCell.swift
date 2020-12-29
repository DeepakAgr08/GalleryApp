//
//  GridViewCell.swift
//  GalleryApp
//
//  Created by Deepak Agrawal on 28/12/20.
//

import UIKit

class GridViewCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var dateLabel: UILabel!
    
    var photo:Photo? {
        // Runs every time the post variable is set
       didSet {
        // make sure we return if post doesn't exist
           guard let photo = photo else { return }
           // Assign our UI elements to their post counterparts
        //titleLabel.text = photo.title
        
        guard let url = photo.flickrImageURL()
          else {
            return
        }
        photoImageView.af.setImage(withURL: url, placeholderImage: UIImage(named: "placeholderImg"))
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.frame = self.bounds
       }
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        photoImageView.frame = self.bounds
//    }
}
