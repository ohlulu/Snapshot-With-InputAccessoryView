//
//  Copyright © 2022 Pinkoi. All rights reserved.
//

import UIKit

final class CustomInputTextView: UITextView {
    // ...
}

final class CustomInputBar: UIView {
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 74)
    }
    
    let textView = CustomInputTextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        textView.backgroundColor = .lightGray
        textView.inputAccessoryView = self
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "123 test"
        
        addSubview(textView)
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor),
            textView.topAnchor.constraint(equalTo: topAnchor),
            textView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            textView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UITableViewController {
    
    override var inputAccessoryView: UIView? { inputBar }
    override var canBecomeFirstResponder: Bool { true }
    
    let inputBar = CustomInputBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        inputBar.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath)"
        return cell
    }
}

