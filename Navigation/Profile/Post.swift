//
//  Post.swift
//  Navigation
//
//  Created by Юлия Филимонова on 05.04.2022.
//

import UIKit

struct Post {

    let author: String
    let image: UIImage
    var likes: Int
    var views: Int
    var isLiked: Bool
    var description: String?

    static func makePost() -> [Post] {
        var post = [Post]()
        post.append(Post(author: "netflix.official", image: UIImage(named: "dark")!, likes: 300, views: 400, isLiked: true))
        post.append(Post(author: "BookNews Journal", image: UIImage(named: "je")!, likes: 100, views: 150, isLiked: true, description: "Джеффри Евгенидис родился в 1960 году в Детройте, штат Мичиган. Его детство прошло в окружении ржавых автомобилей и угасающих фабрик: после экономического расцвета середины века регион медленно приходил в упадок. Мрачная обстановка не помешала писателю пронести любовь к этим местам через всю жизнь. В произведениях Евгенидиса то и дело появляется Детройт: здесь живут знаменитые девственницы-самоубийцы и их соседи, тут после эмиграции обосновались герои «Среднего пола», эти места не раз упоминаются в сборнике рассказов «Найти виноватого». Сам автор говорит, что в судьбе Детройта он видит воплощение истории всей американской нации, так что получается своего рода синекдоха."))
        post.append(Post(author: "Новости Северной столицы", image: UIImage(named: "fontan")!, likes: 500, views: 700, isLiked: true, description: "В Санкт-Петербурге начался сезон фонтанов. В городе запустили 61 из 66 водных сооружений, которые будут работать весной и летом. Некоторые фонтаны включили впервые после реконструкции. Позднее заработают фонтанные комплексы на Московской площади и площади Ленина, светомузыкальный фонтан в Петергофе, фонтан в сквере у Гостиного двора в Кронштадте."))
        post.append(Post(author: "The Art Newspaper", image: UIImage(named: "louvre")!, likes: 600, views: 1000, isLiked: true))
        return post
    }

}
