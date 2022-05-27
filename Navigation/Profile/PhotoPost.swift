//
//  Photos.swift
//  Navigation
//
//  Created by Юлия Филимонова on 24.04.2022.
//

import UIKit

struct PhotoPost {

    let name: String
    let photoOne: UIImage
    let photoTwo: UIImage
    let photoThree: UIImage
    let photoFour: UIImage
    let navigationImage: UIImage

    static func makePhotoPost() -> [PhotoPost] {
        var photoPost = [PhotoPost]()
        photoPost.append(PhotoPost(name: "Photos", photoOne: UIImage(named: "jey")!, photoTwo: UIImage(named: "jm")!, photoThree: UIImage(named: "rp")!, photoFour: UIImage(named: "fm")!, navigationImage: UIImage(systemName: "arrow.right")!))
        return photoPost
    }

}
