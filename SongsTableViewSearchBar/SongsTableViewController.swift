//
//  SongsTableViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class SongsTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var songArr = [Song]()
    
    var searchTerm: String? { //property observer
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songArr = Song.loveSongs
        self.searchBar.delegate = self
    }
    
    //MARK: - Search Bar
    var filteredSongArr: [Song] { //computed property, sometimes has a setter and a getter
        guard let searchTerm = searchTerm, searchTerm != "" else { //have they entered a search term
            return songArr
        }
        guard let scopeTitles = self.searchBar.scopeButtonTitles else { // for scope bar ?????
            return songArr
        }
        let selectedIndex = self.searchBar.selectedScopeButtonIndex
        let filteringCriteria = scopeTitles[selectedIndex]
        switch filteringCriteria {
        case "Name":
            return songArr.filter{(song) in
                song.name.lowercased().contains(searchTerm.lowercased())
            }
        case "Artist":
            return songArr.filter{(song) in
                song.artist.lowercased().contains(searchTerm.lowercased())
            }
        default:
            return songArr
        }
        
        let filteredArr = songArr.filter{(song) in //if they have entered a term create a new array filtered by the term
            return song.name.lowercased().contains(searchTerm.lowercased())
        }
        
        return filteredArr
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSongArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = filteredSongArr[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Song Cell", for: indexPath)
        
        cell.textLabel?.text = song.name
        //print("setting cell at row \(indexPath.row) to \(person.name)")
        cell.detailTextLabel?.text = song.artist
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SongDetailsSegue" {
            let destinationVC = segue.destination as! SongDetailsViewController
            let indexpath = tableView.indexPathForSelectedRow?.row
            destinationVC.namePassedOver = songArr[indexpath!].name
            destinationVC.artistPassedOver = songArr[indexpath!].artist
        }
    }
    
    //MARK: - Search Bar Delegate Methods
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchTerm = searchBar.text
        print("The user pressed search!")
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchTerm = searchText
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        tableView.reloadData()
    }
}

