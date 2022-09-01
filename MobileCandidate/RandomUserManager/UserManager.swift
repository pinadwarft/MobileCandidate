//
//  UserManager.swift
//  MobileCandidate
//
//  Created by Cristian Piña on 29/08/22.
//

import Foundation


protocol userManagerDelegado{
    func mostrarListaUser(lista: Results)
}

struct UserManager {
    var delegado: userManagerDelegado?
    
    //MARK: - ENDPOINT(https://randomuser.me/api/?results=50)
    //Obtiene un listado limitado a 50 usuarios
    func verUsuarios(){
        let urlString = "https://randomuser.me/api/?results=50"
        if let url = URL(string: urlString){
            let urlRequest = URLRequest(url: url)
            //urlRequest.setValue("Token weiouwioudeijd", forHTTPHeaderField: "Authorize") // Valores por header
            //urlRequest.httpBody = try JSONEncoder().encode(object) // Valores por body
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    print("Error", error.localizedDescription)
                }
                if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    if let data = data {
                        if let dataResponse = self.parsearJSON(data){
                            let result = dataResponse.results
                            /*
                            let raw = String(data: data, encoding: .utf8) ?? ""
                            print(raw)
                             */
                            result?.forEach({ user in
                                print(user.name?.title ?? "", user.name?.first ?? "", user.name?.last ?? "")
                            })
                            
                            delegado?.mostrarListaUser(lista: dataResponse)
                        }
                        
                    }
                } else {
                    print("Error", data.debugDescription)
                }
            }
            dataTask.resume()
        }
    }
    
    //MARK: - ENDPOINT(https://randomuser.me/api/?results=50&gender=female)
    //Obtiene un listado limitado a 50 usuarios aplicando el filtro de género
    func verMujeres(){
        let urlString = "https://randomuser.me/api/?results=50&gender=female"
        if let url = URL(string: urlString){
            let urlRequest = URLRequest(url: url)
            //urlRequest.setValue("Token weiouwioudeijd", forHTTPHeaderField: "Authorize") // Valores por header
            //urlRequest.httpBody = try JSONEncoder().encode(object) // Valores por body
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    print("Error", error.localizedDescription)
                }
                if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    if let data = data {
                        if let dataResponse = self.parsearJSON(data){
                            let result = dataResponse.results
                            /*
                            let raw = String(data: data, encoding: .utf8) ?? ""
                            print(raw)
                             */
                            result?.forEach({ user in
                                print(user.name?.title ?? "", user.name?.first ?? "", user.name?.last ?? "")
                            })
                            
                            delegado?.mostrarListaUser(lista: dataResponse)
                        }
                        
                    }
                } else {
                    print("Error", data.debugDescription)
                }
            }
            dataTask.resume()
        }
    }
    
    func verHombres(){
        let urlString = "https://randomuser.me/api/?results=50&gender=male"
        if let url = URL(string: urlString){
            let urlRequest = URLRequest(url: url)
            //urlRequest.setValue("Token weiouwioudeijd", forHTTPHeaderField: "Authorize") // Valores por header
            //urlRequest.httpBody = try JSONEncoder().encode(object) // Valores por body
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    print("Error", error.localizedDescription)
                }
                if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    if let data = data {
                        if let dataResponse = self.parsearJSON(data){
                            let result = dataResponse.results
                            /*
                            let raw = String(data: data, encoding: .utf8) ?? ""
                            print(raw)
                             */
                            result?.forEach({ user in
                                print(user.name?.title ?? "", user.name?.first ?? "", user.name?.last ?? "")
                            })
                            
                            delegado?.mostrarListaUser(lista: dataResponse)
                        }
                        
                    }
                } else {
                    print("Error", data.debugDescription)
                }
            }
            dataTask.resume()
        }
    }
    
    //MARK: - JSON PARSER
    func parsearJSON(_ datosUser: Data) -> Results? {
        let decodificador = JSONDecoder()
        do {
            let datosDecodificados = try decodificador.decode(Results.self, from: datosUser)
            
            
            return datosDecodificados
        } catch  {
            print("Error al decodificar los datos: \(error.localizedDescription)")
            print(String(describing:error))
            return nil
        }
    }
    
}

