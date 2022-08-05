//
//  ViewController.swift
//  table
//
//  Created by 武内 on 2022/08/02.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    var articles = [Article]()
    let todos = ["がんがん","大事に","結構いいよね"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TableView.rowHeight = 50
        getArticles()
    }

    @IBAction func OtamesiButton(_ sender: UIButton) {
        let nextStoryBoard = UIStoryboard(name: "Next", bundle: nil)
        let nextVc: NextViewController = nextStoryBoard.instantiateInitialViewController() as! NextViewController
        self.present(nextVc,animated: true,completion: nil)
        print("押されました")
    }
}

private extension ViewController {
    
    func getArticles(){
        APIClient().request { result in
            switch result {
        case .success(let articles):
            self.articles = articles
                DispatchQueue.main.async{
                    self.TableView.reloadData()
                }
                print("成功")

            case .failure(_):
                print("error")
            }
        }
    }

}


extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = articles[indexPath.row].title
        print(articles[indexPath.row].title)
       // cell.textLabel?.font.withSize(20)
        return cell
    }

}
