//
//  ImageLoader.swift
//  SIUUUU
//
//  Created by Farhandika on 18/10/22.
//
import SDWebImage

extension UIImageView {
    func loadImageFrom(url: String) {
        if let url = URL(string: url) {
            self.sd_imageIndicator = SDWebImageActivityIndicator.gray
            self.sd_imageTransition = .fade
            self.sd_setImage(with: url, completed: nil)
        }
    }
    func loadImageFrom(url: String?, withDefault defaultImage: String) {
        if let urlString = url, let url = URL(string: urlString) {
            self.sd_imageIndicator = SDWebImageActivityIndicator.gray
            self.sd_imageTransition = .fade
            self.sd_setImage(with: url, completed: nil)
        } else {
            self.image = UIImage(named: defaultImage)
        }
    }

}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
