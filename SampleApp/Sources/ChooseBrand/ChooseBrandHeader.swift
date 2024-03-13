import UIKit
import NatDS

final class ChooseBrandHeader: UITableViewHeaderFooterView {

    // MARK: - Private properties

    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "NATDSBackground"))
        imageView.contentMode = .top
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private let overlayView: CustomSplashViewController.GradientBackgroundView = {
        let view = CustomSplashViewController.GradientBackgroundView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .heading6)
        label.text = "GaYa - iOS"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let versionLabel: UILabel = {
        let label = UILabel()
        let version = "\(Bundle.main.infoDictionary?["CFBundleVersion"] as? String  ?? "")"
        let shortVersion = "\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "")"
        label.font = NatFonts.font(ofSize: .caption)
        label.text = "version \(shortVersion) (\(version))"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .subtitle1)
        label.text = "Selecione uma marca:"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        setup()
    }

    func setup() {
        contentView.backgroundColor = NatColors.background

        contentView.addSubview(backgroundImageView)
        contentView.addSubview(overlayView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(versionLabel)
        contentView.addSubview(subTitleLabel)

        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),

            overlayView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor),
            overlayView.rightAnchor.constraint(equalTo: backgroundImageView.rightAnchor),
            overlayView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor),
            overlayView.leftAnchor.constraint(equalTo: backgroundImageView.leftAnchor),

            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            versionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: NatSpacing.tiny),
            versionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            subTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: NatSpacing.small),
            subTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -NatSpacing.tiny)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChooseBrandHeader: ReusableView {}
