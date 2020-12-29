//
//  ListViewCell.swift
//  GalleryApp
//
//  Created by Deepak Agrawal on 28/12/20.
//

import UIKit
import AlamofireImage

class ListViewCell: UITableViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var photo:Photo? {
        // Runs every time the post variable is set
       didSet {
        // make sure we return if post doesn't exist
           guard let photo = photo else { return }
           // Assign our UI elements to their post counterparts
        titleLabel.text = photo.title
        
        guard let url = photo.flickrImageURL()
          else {
            return
        }
        photoImageView.af.setImage(withURL: url, placeholderImage: UIImage(named: "placeholderImg"))
        photoImageView.contentMode = .scaleAspectFill
       }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
