//
//  CardViewController.swift
//  MEgo
//
//  Created by Marlon Henry on 9/22/21.
//

import UIKit

class CardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,NetworkDelegate {

    @IBOutlet weak var myCollection: UICollectionView!
    @IBOutlet weak var addCardBTN: UIButton!
    private let cellID = "cell"
    var cards = [String]()
    var networkDel:NetworkDelegate?
    

    fileprivate func targetSetup() {
        let action = #selector(addButtonPressed)
        addCardBTN.addTarget(self, action: action, for: .touchDown)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkDel = self
        targetSetup()

        // Do any additional setup after loading the view.
    }
    
    func updateDependentView() {
        myCollection.reloadData()
    }
    
    func getData() {
        //go grab the data that will call updateDependentView based on completition and protocol rules
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MEgoCardCollectionViewCell
        
        return cell
    }
    
    @objc func addButtonPressed() {
        //We will launch a add card VC here and present it modally
        let view = AddCardViewController()
        self.present(view, animated: true)
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
