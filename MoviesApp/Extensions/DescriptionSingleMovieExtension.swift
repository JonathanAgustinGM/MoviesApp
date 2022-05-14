//
//  DescriptionSingleMovieExtension.swift
//  MoviesApp
//
//  Created by Jonathan Gracia on 13/05/22.
//

import Foundation
import UIKit

extension DescriptionMovie: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return media.genres!.count

        }
        else {
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.font = UIFont.systemFont(ofSize: 8)
        cell.textLabel?.textAlignment = .center
        let seccion = indexPath.section
        switch seccion {
            case 0 :
                cell.textLabel?.text = media.genres![indexPath.row].name
                cell.textLabel?.font = UIFont.systemFont(ofSize: 8)
                return cell
            case 1:
                if media.original_title != nil {
                cell.textLabel?.text = media.original_title
                }else {
                    cell.textLabel?.text = media.name
                }
                cell.textLabel?.font.withSize(5)
                return cell
            case 2:
                cell.textLabel?.text = media.homepage
                cell.textLabel?.font.withSize(5)
                return cell
            default:
                cell.textLabel?.text = "Segunda seccion"
                return cell
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 0:
               return "Generos"
            case 1:
                return "Titulo original"
            case 2:
                return "Pagina principal"
            default:
                return "seccion"
        }
    }
    
}
