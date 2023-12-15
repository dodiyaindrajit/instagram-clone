//
//  HomeController.swift
//  MySampleIOSApp
//
//  Created by Zyauddin Khan on 05/12/23.
//

import UIKit

struct Post {
    var username: String
    var caption: String
    var image: UIImage
}

class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var myTableView: UITableView!
    private var posts: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Home"
        
        // Dummy data
        let post1 = Post(username: "John Doe", caption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", image: UIImage(named: "dummy1")!)
        let post2 = Post(username: "Paul Smith", caption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", image: UIImage(named: "dummy2")!)
        let post3 = Post(username: "Jennifer Lawrence", caption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", image: UIImage(named: "dummy3")!)
        // Add more posts as needed

        posts = [post1, post2, post3]

        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(posts[indexPath.row])")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell

        let post = posts[indexPath.row]
        cell.userLbl.text = post.username
        cell.descLbl.text = post.caption
        cell.postImg.image = post.image
        cell.profileImg.image = post.image
        return cell
    }
}

