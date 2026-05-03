import UIKit

import SnapKit
import Then

class ItemViewController: UIViewController {
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var itemList = ItemModel.dummy()

    final let lineSpacing: CGFloat = 10
    final let interItemSpacing: CGFloat = 21
    final let cellHeight: CGFloat = 198
    final let inset = UIEdgeInsets(top: 48, left: 20, bottom: 10, right: 20)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        register()
        setLayout()
        setCollectionLayout()
        setDelegate()
    }

    private func setUI() {
        view.backgroundColor = .white
        view.addSubviews(collectionView)
    }

    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    private func setCollectionLayout() {
        let flowLayout = UICollectionViewFlowLayout()

        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - inset.left - inset.right - interItemSpacing
        let cellWidth = doubleCellWidth / 2

        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        flowLayout.minimumInteritemSpacing = interItemSpacing
        flowLayout.minimumLineSpacing = lineSpacing
        flowLayout.sectionInset = inset

        collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }

    private func register() {
        collectionView.register(
            ItemCollectionViewCell.self,
            forCellWithReuseIdentifier: ItemCollectionViewCell.identifier
        )
    }
}

extension ItemViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ItemCollectionViewCell.identifier,
            for: indexPath
        ) as? ItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.delegate = self
        cell.dataBind(itemList[indexPath.row])
        return cell
    }
}

extension ItemViewController: UICollectionViewDelegate {
}

extension ItemViewController: ItemCollectionViewCellDeleteDelegate {
    func heartButtonDidTap(cell: ItemCollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        itemList[indexPath.item].heartIsSelected.toggle()
        cell.heartIcon.isSelected = itemList[indexPath.item].heartIsSelected
    }
}
