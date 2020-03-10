//
//  FolderCell.swift
//  iTorrent
//
//  Created by  XITRIX on 18.06.2018.
//  Copyright © 2018  XITRIX. All rights reserved.
//

import Foundation
import UIKit

class FolderCell: ThemedUITableViewCell {
    @IBOutlet var title: UILabel!
    @IBOutlet var size: UILabel!

    @IBOutlet var moreButton: UIButton!
    @IBOutlet var titleConstraint: NSLayoutConstraint!

    weak var actionDelegate: FolderCellActionDelegate?

    override func themeUpdate() {
        super.themeUpdate()

        let theme = Themes.current

        title?.textColor = theme.mainText
        size?.textColor = theme.secondaryText

        let bgColorView = UIView()
        bgColorView.backgroundColor = theme.backgroundSecondary
        selectedBackgroundView = bgColorView
    }

    func update() {
        if isEditing {
            moreButton.isHidden = true
            titleConstraint?.constant = 13
        } else {
            moreButton.isHidden = false
            titleConstraint?.constant = 36
        }
    }

    @IBAction func more(_ sender: UIButton) {
        if actionDelegate != nil {
            actionDelegate?.folderCellAction(title.text!, sender: sender)
        }
    }
}
