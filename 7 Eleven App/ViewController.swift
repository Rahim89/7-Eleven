//
//  ViewController.swift
//  7 Eleven App
//
//  Created by MyMac on 3/14/19.
//  Copyright © 2019 Abdourahim Diallo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    // create a HomeModel instance
//    var homeModel = HomeModel()
    
   var transactionsList: [Transaction] = []
    
    // function I added to retrieve the transaction
//    func retrieveTransactions(){
//        let url1 = "https://jsonplaceholder.typicode.com"
//        HTTPHandler.getJson(urlString: url1, completionHandler: parseDataIntoTransaction)
//    }
//    
//    func parseDataIntoTransaction(data: Data?) -> Void {
//        print("I am here")
//        if let data = data {
//            let object = JSONParser.parse(data: data)
//            
//            if let object = object {
//                self.transactions = TransactionDataProcessor.mapJsonToTransaction(object: object, transactionKey: "users" )
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            }
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlString) else {return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            
            do{
                let transactions = try JSONDecoder().decode([Transaction].self, from: data)
               // print(transactions)
                self.transactionsList = transactions
                print(self.transactionsList)
                DispatchQueue.main.async {
                    print("I am Here waiting...")
                    self.tableView.reloadData()
                }
                
                
            }catch let jsonError{
                print("Error serializing json:", jsonError)
            }
            
            
            }.resume()
        
        // Initiate calling  the transactions download
        
//        homeModel.getTransactions()
//        homeModel.delegate = self
    }
    
//    func transactionsDowloaded(transactions: [Transaction]) {
//        self.transactions = transactions
//        tableView.reloadData()
//    }
//
    // MARK: - UITableView Delegate Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transactionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
        cell.textLabel?.text = self.transactionsList[indexPath.row].name
        cell.textLabel?.text = self.transactionsList[indexPath.row].username
        cell.textLabel?.text = self.transactionsList[indexPath.row].email
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: When the user a select a specific trasanction to show the view of that transaction
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        if self.transactionsList.count == 0 {
            //transactions.append(Transaction(id: 1, name: "rahim", username: "test", email: "A@gmail.com"))
            print("the table is empty")
        }
      super.viewWillAppear(animated)
   }

}

