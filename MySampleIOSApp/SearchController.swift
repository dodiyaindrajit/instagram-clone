//
//  SearchController.swift
//  MySampleIOSApp
//
//  Created by Zyauddin Khan on 05/12/23.
//

import UIKit

class SearchController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let dummyArray = ["dummy1", "dummy2", "dummy3", "dummy4", "dummy5", "dummy6", "dummy7", "dummy8", "dummy9", "dummy10", "dummy11", "dummy12", "dummy13", "dummy14", "dummy15", "dummy16", "dummy17", "dummy18", "dummy19", "dummy20", "dummy21"]
    var list: [String] = []
    var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Search"
        
        for _ in 0..<50 {
            list.append(dummyArray.randomElement()!)
        }
        
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.headerReferenceSize = CGSizeMake(self.view.frame.width, 70)
//        let someView = SupView(frame: CGRectMake(0, 0, self.view.frame.width, 70))
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCollectionCell.self, forCellWithReuseIdentifier: "CustomCollectionCell")
        collectionView.register(SupView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionCell", for: indexPath) as! CustomCollectionCell
        cell.imageView.image = UIImage(named: list[indexPath.row])
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width / 3 - 15, height: view.frame.width / 3 - 15)
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item \(indexPath.row) is tapped")
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusableView : UICollectionReusableView? = nil

        if (kind == UICollectionView.elementKindSectionHeader) {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerCell", for: indexPath) as! SupView
            
            headerView.frame = CGRectMake(0, 0, view.frame.width, 70)
            headerView.backgroundColor = .white
            reusableView = headerView
        }
        return reusableView!
    }
    
}

extension SearchController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 2) / 3
        return CGSize(width: width, height: width)
    }
    
}


class CustomCollectionCell: UICollectionViewCell {
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
//        imageView.layer.cornerRadius = 10
//        imageView.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SupView: UICollectionReusableView, UITextFieldDelegate {
    let txtField = PaddingTextField()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(txtField)
        txtField.frame = CGRectMake(0, 0, frame.width - 20, 50)
        txtField.backgroundColor = .white
        txtField.layer.borderWidth = 1
        txtField.delegate = self
        txtField.placeholder = "Search"
        if #available(iOS 13.0, *) {
            txtField.layer.borderColor = CGColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        } else {
            // Fallback on earlier versions
        }
        txtField.layer.cornerRadius = txtField.layer.frame.height / 2
        txtField.layer.masksToBounds = true
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        txtField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        txtField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        txtField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        self.myCustomInit()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.myCustomInit()
    }

    func myCustomInit() {
        print("hello there from SupView")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

class PaddingTextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 5)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
