//
//  SearchedFeedCell.swift
//  Yep
//
//  Created by NIX on 16/4/1.
//  Copyright © 2016年 Catch Inc. All rights reserved.
//

import UIKit

class SearchedFeedCell: UITableViewCell {

    @IBOutlet weak var mediaView: FeedMediaView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        separatorInset = YepConfig.SearchedItemCell.separatorInset
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        mediaView.hidden = true

        mediaView.clearImages()
    }

    func configureWithFeed(feed: Feed, keyword: String?) {

        if let keyword = keyword {
            nameLabel.attributedText = feed.body.yep_hightlightSearchKeyword(keyword)

        } else {
            nameLabel.text = feed.body
        }

        let attachments = feed.attachments.map({
            DiscoveredAttachment(metadata: $0.metadata, URLString: $0.URLString, image: nil)
        })
        mediaView.setImagesWithAttachments(attachments)
    }

}