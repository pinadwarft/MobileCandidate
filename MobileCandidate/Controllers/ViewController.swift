//
//  ViewController.swift
//  MobileCandidate
//
//  Created by Cristian Piña on 29/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var userTableView: UITableView!
    
    //MARK: - Variables
    var userManager = UserManager()
    var users: [User] = []
    var userSelected: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userManager.delegado = self
        
        userTableView.dataSource = self
        userTableView.delegate = self
        userTableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customcell")
        
        //Busqueda de lista de Users
        userManager.verUsuarios()
    }
    
    //MARK: - Refrescar vista
    @IBAction func refreshAction(_ sender: Any) {
        userManager.verUsuarios()
    }
    
    //MARK: - Mostrar mujeres
    @IBAction func femaleAction(_ sender: Any) {
        userManager.verMujeres()
    }
    
    @IBAction func maleAction(_ sender: Any) {
        userManager.verHombres()
    }
    
}

//MARK: - Delegado User
extension ViewController: userManagerDelegado {
    func mostrarListaUser(lista: Results) {
        if let userAux = lista.results{
            users = userAux
        }
        
        DispatchQueue.main.async {
            self.userTableView.reloadData()
        }

    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = userTableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! MyCustomTableViewCell
        
        //MARK: - INSERCIÓN DE OBJETOS
        celda.nameLabel.text = "\(users[indexPath.row].name?.first ?? "") \(users[indexPath.row].name?.last ?? "")"
        
        celda.emailLabel.text = "\(users[indexPath.row].email ?? "")"
        
        celda.genderLabel.text = "Gender: \(users[indexPath.row].gender ?? "")"
        
        //userImage
        if let urlString = users[indexPath.row].picture?.large as? String{
            if let picture = URL(string: urlString){
                DispatchQueue.global().async {
                    guard let pictureData = try? Data(contentsOf: picture) else {return}
                    let pictureThumbnail = UIImage(data: pictureData)
                    DispatchQueue.main.async {
                        celda.userImage.image = pictureThumbnail
                    }
                    
                }
            }
        }
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userSelected = users[indexPath.row]
        
        performSegue(withIdentifier: "verUser", sender: self)
        
        //Deseleccionar
        userTableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verUser" {
            let verUser = segue.destination as! DetailsUsersViewController
            verUser.userView = userSelected
        }
    }
}


