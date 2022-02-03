//
//  ViewController.swift
//  MEgo
//
//  Created by Marlon Henry on 9/11/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myCollection: UICollectionView!
    @IBOutlet weak var titleLBL: UILabel!
    var dataArr = [Codable]()
    var messageArr = [Message]()
    fileprivate var cellID = "cell"
    let networkManager = NetworkManager.sharedInstance
    var nwkDel:NetworkDelegate?
    let userManager = UserManager.sharedInstance
    let systemManager = SystemManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard systemManager.getUserUserStatus() else{return presentLogin()}
        setNetworkDelData()
        dataArr = systemManager.getTestData()
    }
    
    func updateDependentView() {
        myCollection.reloadData()
    }
    
    func getData() {
        //go grab the data that will call updateDependentView based on completition and protocol rules
    }
    
    func presentLogin(){
        let view = LoginViewController()
        self.present(view, animated: true, completion: nil)
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate,NetworkDelegate{
    
    fileprivate func setNetworkDelData() {
        // Do any additional setup after loading the view.
        nwkDel = self
       
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MEgoCardCollectionViewCell
        let someOb = dataArr[indexPath.row] as! TestOb
        cell.titleLable?.text = someOb.title
        return cell
    }
    
    
}

