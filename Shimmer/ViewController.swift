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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var items: [ShimmerModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Restart", style: .plain, target: self, action: #selector(resetShimmer))
        self.tableView.register(ShimmerCell.nib, forCellReuseIdentifier: ShimmerCell.swiftIdentifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.reload()
        }
    }

    private func reload() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        self.items = [
            ShimmerModel(imageUrl: ImageLoader.sampleImageURLs.randomElement(), title: "firstTitle", subTitle: "firstSubTitle", date: "2019-05-01"),
            ShimmerModel(imageUrl: ImageLoader.sampleImageURLs.randomElement(), title: "firstTitle", subTitle: "firstSubTitle", date: "2019-05-01"),
            ShimmerModel(imageUrl: ImageLoader.sampleImageURLs.randomElement(), title: "firstTitle", subTitle: "firstSubTitle", date: "2019-05-01"),
            ShimmerModel(imageUrl: ImageLoader.sampleImageURLs.randomElement(), title: "firstTitle", subTitle: "firstSubTitle", date: "2019-05-01"),
            ShimmerModel(imageUrl: ImageLoader.sampleImageURLs.randomElement(), title: "firstTitle", subTitle: "firstSubTitle", date: "2019-05-01"),
            ShimmerModel(imageUrl: ImageLoader.sampleImageURLs.randomElement(), title: "firstTitle", subTitle: "firstSubTitle", date: "2019-05-01")

        ]
        self.tableView.reloadData()
    }
    @objc
    func resetShimmer() {
        reload()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? ShimmerCell else { return }
        cell.stopShimmering()
        cell.shimmerImageView.kf.cancelDownloadTask()
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? ShimmerCell else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            cell.stopShimmerAnimation()
            
            let item = self.items[indexPath.row]
            
            cell.shimmerImageView.kf.setImage(with: item.imageUrl)
            
            cell.shimmerTitleView.fadeTransition(0.3)
            cell.shimmerTitleView.text = item.title

            cell.shimmerSubTitleView.fadeTransition(0.3)
            cell.shimmerSubTitleView.text = item.subTitle
            
            cell.shimmerDateView.fadeTransition(0.3)
            cell.shimmerDateView.text = item.date
        }
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShimmerCell.swiftIdentifier, for: indexPath) as? ShimmerCell else { return UITableViewCell() }
        cell.startShimmerAnimation()
        return cell
    }
}
