//
//  ViewController.swift
//  ImageFeed
//
//  Created by Aleksey Kosov on 26.01.2023.
//

import UIKit

class ImagesListViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!

    private let photosName: [String] = Array(0..<20).map {"\($0)"}

    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
    }


    private func calculateImageViewHeight(_ cell: ImagesListCell, _ image: (UIImage?)) -> CGFloat {
        guard let imageSize = image?.size else { return 10 }
        let imageViewToImageRatio = cell.cellImage.frame.size.width / imageSize.width
        let imageViewHeight = imageSize.height * imageViewToImageRatio

        return imageViewHeight
    }

    func configCell(for cell: ImagesListCell, for indexPath: IndexPath) {
        guard let image = UIImage(named: photosName[indexPath.row]) else { return }
        cell.cellImage.image = image

        indexPath.row % 2 == 0
        ? cell.likeButton.setImage(UIImage(named: "activeLike")?.withRenderingMode(.alwaysOriginal), for: .normal)
        : cell.likeButton.setImage(UIImage(named: "noActiveLike")?.withRenderingMode(.alwaysOriginal), for: .normal)

        cell.dateLabel.text = dateFormatter.string(from: Date())
    }
}

extension ImagesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let image = UIImage(named: photosName[indexPath.row]) else { return 0 }

        let imageInsets = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        let imageViewWidth = tableView.bounds.width - imageInsets.left - imageInsets.right
        let imageWidth = image.size.width
        let scale = imageViewWidth / imageWidth
        let cellHeight = image.size.height * scale + imageInsets.top + imageInsets.bottom

        return cellHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ImagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosName.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImagesListCell.reuseIdentifier)

        guard let imageListCell = cell as? ImagesListCell else { return UITableViewCell() }
        configCell(for: imageListCell, for: indexPath)

        return imageListCell
    }
}

