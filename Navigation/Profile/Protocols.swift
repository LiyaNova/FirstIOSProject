//
//  Protocols.swift
//  Navigation
//
//  Created by Юлия Филимонова on 19.05.2022.
//

import Foundation

protocol TapLikeDelegate: AnyObject {

    func tapLikesLabel(cell: PostTableViewCell)

}

protocol DetailLikeDelegate: AnyObject {

    func tapDeatailLike(like: Int, id: Int) 

}
