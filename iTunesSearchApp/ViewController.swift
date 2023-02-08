//
//  ViewController.swift
//  iTunesSearchApp
//
//  Created by Andrew Acton on 2/7/23.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var resultsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: Actions
    @IBAction func searchButtonPressed(_ sender: Any) {
        guard let term = searchTextField.text else { return }
        
        SearchResultsController.searchResultsForSearchTerm(searchTerm: term) { [weak self] (results) in
            if let searchResults = results,
               let firstResult = searchResults.first {
                DispatchQueue.main.async {
                    self?.resultsLabel.text = "\(firstResult.trackName) - \(firstResult.artistName)"
                }
            }
        }
    }
}

