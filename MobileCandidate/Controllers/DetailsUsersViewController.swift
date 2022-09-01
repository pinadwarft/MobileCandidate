//
//  DetailsUsersViewController.swift
//  MobileCandidate
//
//  Created by Cristian Piña on 31/08/22.
//

import UIKit
import MapKit

class DetailsUsersViewController: UIViewController {
    
    //MARK: - Variables
    //var userResult: Results?
    var userView: User?
    //var userR: Results?
    
    //MARK: - Outlets
    @IBOutlet weak var userNavigation: UINavigationItem!
    @IBOutlet weak var userImageDetail: UIImageView!
    @IBOutlet weak var emailDetail: UILabel!
    @IBOutlet weak var genderDetail: UILabel!
    @IBOutlet weak var adressDetail: UILabel!
    @IBOutlet weak var phoneDetail: UILabel!
    @IBOutlet weak var nameDetail: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        if let userV = userR?.results{
            
        }
        */
        userNavigation.title = "\(userView?.name?.first ?? "") \(userView?.name?.last ?? "")"
        nameDetail.text = "\(userView?.name?.first ?? "") \(userView?.name?.last ?? "")"
        emailDetail.text = "\(userView?.email ?? "")"
        genderDetail.text = "\(userView?.gender ?? "")"
        adressDetail.text = "\(userView?.location?.street?.number ?? 000) \(userView?.location?.street?.name ?? ""), \(userView?.location?.city ?? ""), \(userView?.location?.state ?? ""), \(userView?.location?.country ?? "")"
        phoneDetail.text = "\(userView?.cell ?? "")"
        
        //userImageDetail
        userImageDetail.loadFrom("\(userView?.picture?.large ?? "")")
        userImageDetail.layer.cornerRadius = 70
        
        
    }
}

extension UIImageView {
    func loadFrom(_ URLAdress: String) {
        guard let url = URL(string: URLAdress) else {return}
        
        DispatchQueue.main.async { [weak self] in
            if let imagenData = try? Data(contentsOf: url){
                if let loadedImage = UIImage(data: imagenData){
                    self?.image = loadedImage
                }
            }
        }
    }
}
