//
//  ThirdTableViewCell.swift
//  SIUUUU
//
//  Created by Farhandika on 18/10/22.
//

import UIKit

final class ThirdTableViewCell: UITableViewCell {
    public final class TBVViewModel {
        var name: String = ""
        var email: String = ""
        var image: String = ""
    }
    public static func register(tableView: UITableView) {
        tableView.register(UINib(nibName: self.identify, bundle: nil), forCellReuseIdentifier: self.identify)
    }
    public static let identify = "ThirdTableViewCell"
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        iconImage.layer.cornerRadius = iconImage.frame.width/2
        iconImage.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func configure(viewModel: TBVViewModel) {
        self.nameLabel.text = viewModel.name
        self.emailLabel.text = viewModel.email
        self.iconImage.loadImageFrom(url: viewModel.image)
    }
    
}
