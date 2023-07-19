//
//  PostUserView.swift
//  CeibaApp
//
//  Created by yesid mendoza on 18/07/23.
//


import UIKit

/// PostUserView Module View
class PostUserView: UIViewController {

    // MARK: - @IBOutlet
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var tablePost: UITableView!
    // MARK: - Properties
    var presenter: PostUserPresenter?
    var user: [User] = []
    var posts: [PostUserData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getPostById(id: user[0].id)
        setupView()
        setupDataUser()
        configureTableView()
        registerNibsCells()
    }
    func setupView () {
        content.layer.borderColor = UIColor.gray.cgColor
        content.layer.shadowColor = UIColor.gray.cgColor
        content.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        content.layer.shadowRadius = 4.0
        content.layer.shadowOpacity = 0.3
    }
    func setupDataUser() {
        name.text = user[0].name
        phone.text = user[0].phone
        email.text = user[0].email
    }
    func configureTableView() {
        tablePost.dataSource = self
        tablePost.delegate = self
        
    }
    func registerNibsCells(){
        let sessionUserCell = String(describing: PostUserCell.self)
        tablePost.register(UINib(nibName: sessionUserCell, bundle: nil), forCellReuseIdentifier: sessionUserCell)
        let nodataCell = String(describing: NodataCell.self)
        tablePost.register(UINib(nibName: nodataCell, bundle: nil), forCellReuseIdentifier: nodataCell)
    }
}
// MARK: - extending listUserView to implement it's protocol
extension PostUserView: PostUserViewProtocol {
    func setItemsTableviewPost(post: [PostUserData]) {
        self.posts = post
        DispatchQueue.main.async {
            self.tablePost.reloadData()
        }
    }
}
extension PostUserView: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if posts.count == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NodataCell", for: indexPath) as? NodataCell else {
                        fatalError("Unable to dequeue Cell")}
            return cell
        }
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostUserCell", for: indexPath) as? PostUserCell else {
                        fatalError("Unable to dequeue Cell")}
            let item = PostUserItem(title: posts[indexPath.row].title, body: posts[indexPath.row].body)
            cell.setData(postUserItem: item)
            return cell
        }
    }
}
