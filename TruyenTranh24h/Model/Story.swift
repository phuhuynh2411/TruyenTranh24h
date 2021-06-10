//
//  Story.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 13/04/2021.
//

import Foundation

struct Story: Codable, Identifiable {
    let id: Int
    let userId: Int
    let title: String
    let subTitle: String
    let isHot: Bool
    let isFeature: Bool
    let isAdult: Bool
    var featureImage: String
    
    // Chapter
    let lastChapter: Chapter
    let description: String
    let createdAt: Date
    let trailerImage: String?
}

/*
{
   "id":1,
   "user_id":1,
   "title":"Tsugumomo",
   "sub_title":"C\u00f4 N\u00e0ng R\u1eafc R\u1ed1i",
   "slug":"tsugumomo",
   "type":"new",
   "is_feature":false,
   "is_hot":false,
   "is_adult":false,
   "craw_url":"https:\/\/truyentranh24.com\/tsugumomo",
   "crop":null,
   "feature_image":"stories\/7f47d202dd5f7ce5_37da54a9b94f7b6f_31036158385674489674.jpg",
   "translator":null,
   "author":"Hamada, Yoshikadu",
   "status":1,
   "status_text":"\u0111ang c\u1eadp nh\u1eadt",
   "rates":0,
   "description":" Kazuya Kagami kh\u00f4ng bao gi\u1edd \u0111i \u0111\u00e2u n\u1ebfu thi\u1ebfu t\u1ea5m Obi Anh \u0111\u00e0o m\u00e0 m\u1eb9 t\u1eb7ng. Ng\u00e0y n\u1ecd, m\u1ed9t c\u00f4 g\u00e1i qu\u1ea5n tr\u00ean m\u00ecnh b\u1ed9 kimono tr\u1eafng t\u00ean Kiriha xu\u1ea5t hi\u1ec7n tr\u01b0\u1edbc m\u1eb7t c\u1eadu. Kiriha sau \u0111\u00f3 \u0111\u1ebfn \u1edf c\u00f9ng ph\u00f2ng v\u1edbi Kazuya. Kh\u00f4ng l\u00e2u sau, c\u00f4 b\u1ea1n th\u1eddi th\u01a1 \u1ea5u v\u1edbi Kazuya l\u00e0 Chisato xen v\u00e0o chuy\u1ec7n n\u00e0y.C\u00f2n ch\u01b0a k\u1ec3 \u0111\u1ebfn c\u00f4 ch\u1ecb quan t\u00e2m qu\u00e1 m\u1ee9c su\u1ed1t ng\u00e0y \u0111\u00f2i t\u1eafm chung v\u1edbi Kazuya. R\u1ed3i c\u1ea3 m\u1ed9t n\u1eef tu, m\u1ed9t ph\u00f9 th\u1ee7y t\u00ean  Kokuyoura. Cu\u1ed9c s\u1ed1ng vui t\u01b0\u01a1i, d\u1edf kh\u00f3c d\u1edf c\u01b0\u1eddi c\u1ee7a Kazuya b\u1eaft \u0111\u1ea7u... ",
   "created_at":"2021-01-18T08:06:37.000000Z",
   "updated_at":"2021-01-18T08:37:16.000000Z",
   "deleted_at":null
}
 
*/
