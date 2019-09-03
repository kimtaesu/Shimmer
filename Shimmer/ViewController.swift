//
//  ViewController.swift
//  Shimmer
//
//  Created by tskim on 03/09/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import UIKit
import Kingfisher
import ShimmerSwift

struct ShimmerModel {
    let imageUrl: URL?
    let title: String
    let subTitle: String
    let date: String
}
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var items: [ShimmerModel] = [
        ShimmerModel(imageUrl: ImageLoader.sampleImageURLs.randomElement(), title: "firstTitle", subTitle: "firstSubTitle", date: "2019-05-01"),
        ShimmerModel(imageUrl: ImageLoader.sampleImageURLs.randomElement(), title: "firstTitle", subTitle: "firstSubTitle", date: "2019-05-01"),
        ShimmerModel(imageUrl: ImageLoader.sampleImageURLs.randomElement(), title: "firstTitle", subTitle: "firstSubTitle", date: "2019-05-01"),
        ShimmerModel(imageUrl: ImageLoader.sampleImageURLs.randomElement(), title: "firstTitle", subTitle: "firstSubTitle", date: "2019-05-01"),
        ShimmerModel(imageUrl: ImageLoader.sampleImageURLs.randomElement(), title: "firstTitle", subTitle: "firstSubTitle", date: "2019-05-01"),
        ShimmerModel(imageUrl: ImageLoader.sampleImageURLs.randomElement(), title: "firstTitle", subTitle: "firstSubTitle", date: "2019-05-01")
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(ShimmerCell.nib, forCellReuseIdentifier: ShimmerCell.swiftIdentifier)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShimmerCell.swiftIdentifier, for: indexPath) as? ShimmerCell else { return UITableViewCell() }
        
        let item = self.items[indexPath.row]
        cell.shimmerTitleView.text = item.title
        cell.shimmerSubTitleView.text = item.subTitle
        cell.shimmerDateView.text = item.date
        cell.shimmerImageView.kf.setImage(with: item.imageUrl)
        return cell
    }
    
}

