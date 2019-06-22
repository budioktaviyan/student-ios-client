import UIKit

class StudentViewCell: DatasourceCell {

    private lazy var name: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16)
        view.textColor = .black
        view.textAlignment = .left

        return view
    }()

    private lazy var email: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 14)
        view.textColor = .darkGray
        view.textAlignment = .left

        return view
    }()

    private lazy var separator: UIView = {
        let view = UIView()
        view.backgroundColor = .gray

        return view
    }()

    override var datasource: Any? {
        didSet {
            guard let data = datasource as? Student else { return }
            name.text = data.name
            email.text = data.email
        }
    }

    override func setupViews() {
        addSubview(name)
        addSubview(email)
        addSubview(separator)

        name.anchor(
            safeAreaLayoutGuide.topAnchor,
            left: leftAnchor,
            bottom: nil,
            right: rightAnchor,
            topConstant: 8,
            leftConstant: 16,
            bottomConstant: 0,
            rightConstant: 16,
            widthConstant: 0,
            heightConstant: 0
        )

        email.anchor(
            name.bottomAnchor,
            left: leftAnchor,
            bottom: nil,
            right: rightAnchor,
            topConstant: 4,
            leftConstant: 16,
            bottomConstant: 0,
            rightConstant: 16,
            widthConstant: 0,
            heightConstant: 0
        )

        separator.anchor(
            email.bottomAnchor,
            left: leftAnchor,
            bottom: bottomAnchor,
            right: rightAnchor,
            topConstant: 8,
            leftConstant: 16,
            bottomConstant: 0,
            rightConstant: 16,
            widthConstant: 0,
            heightConstant: 0.5
        )
    }
}
