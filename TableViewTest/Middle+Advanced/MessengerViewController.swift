//
//  MessengerViewController.swift
//  TableViewTest
//
//  Created by nguyen.nam.khanh on 3/19/19.
//  Copyright © 2019 nguyen.nam.khanh. All rights reserved.
//

import UIKit

class MessengerViewController: UIViewController {

    //MARK: Properties
    

    @IBOutlet weak var bottomConstraintView: NSLayoutConstraint!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    private var list = [Message]()
    var keyboardHeight = CGFloat(0)
    var tempList = [Message]()
    var indexPage = 0
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        createList()
    }
    
    //MARK: Methods
    private func prepareUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        tableView.flashScrollIndicators()
        textView.delegate = self
        textView.layer.masksToBounds = true
        textView.layer.cornerRadius = 8
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = keyboardRectangle.height
//            self.view.frame.origin.y -= keyboardHeight
            bottomConstraintView.constant = keyboardHeight
            self.tableView.contentOffset = CGPoint(x: 0, y: self.tableView.contentOffset.y - keyboardHeight)
            self.view.layoutIfNeeded()
        }
    }
    @objc private func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        textView.resignFirstResponder()
    }
    @objc func keyboardWillHide(notification: NSNotification) {
//        self.view.frame.origin.y = 0
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseOut, animations: {
            self.bottomConstraintView.constant = 0
        }, completion: { (_) in
            
        })
        
    }
    private func createList() {
        for i in 0...20 {
            let message = Message(content: "Shop the best Shop the bestShop the bestShop the bestShop the best\(i)", sender: 1)
            list.append(message)
        }
        for i in 21...47 {
            let message = Message(content: "Shop the best  \(i)")
            list.append(message)
        }
        for i in 48...60 {
            let message = Message(content: "Shop the best \(i)", sender: 1)
            list.append(message)
        }
        for i in 61...82 {
            let message = Message(content: "Shop the best  \(i)")
            list.append(message)
        }
        for i in 83...97 {
            let message = Message(content: "Shop the best \(i)", sender: 1)
            list.append(message)
        }
        for i in 98...118 {
            let message = Message(content: "Shop the best  \(i)")
            list.append(message)
        }
        for i in 0...15 {
            tempList.append(list[i])
            indexPage = i
        }
        tableView.reloadData()
    }
    
}
extension MessengerViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension MessengerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = tempList[indexPath.row]
        if message.sender == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MessageSenderCell", for: indexPath) as! MessageSenderCell
            cell.selectionStyle = .none
            cell.message = message
            cell.transform = CGAffineTransform(scaleX: 1, y: -1)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCell
        cell.selectionStyle = .none
        cell.message = message
        cell.transform = CGAffineTransform(scaleX: 1, y: -1)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let spinner = UIActivityIndicatorView(style: .gray)
        spinner.startAnimating()
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: self.tableView.bounds.width, height: CGFloat(44))
        self.tableView.tableFooterView = spinner
        self.tableView.tableFooterView?.isHidden = false
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (timer) in
            if self.indexPage + 1 == self.tempList.count && (self.list.count - self.tempList.count) >= 15{
                for i in (self.indexPage + 1)...(self.indexPage + 14){
                    self.tempList.append(self.list[i])
                    self.indexPage = i
                }
                spinner.stopAnimating()
                self.tableView.tableFooterView?.isHidden = true
                self.tableView.reloadData()
            } else if self.indexPage + 1 == self.tempList.count && (self.list.count - self.tempList.count) < 15 && (self.list.count - self.tempList.count) > 0 {
                for i in (self.indexPage + 1)...(self.list.count - 1){
                    self.tempList.append(self.list[i])
                    self.indexPage = i
                    print(self.indexPage)
                }
                spinner.stopAnimating()
                self.tableView.tableFooterView?.isHidden = true
                self.tableView.reloadData()
            } else if self.indexPage == self.tempList.count - 1 {
                spinner.stopAnimating()
                self.tableView.tableFooterView?.isHidden = true
            }
        }

        
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        for view in tableView.subviews {
            if String(describing: type(of: view)) == "UISwipeActionPullView" {
                let removeButton = view.subviews[0]
                let detailButton = view.subviews[1]
                detailButton.transform = CGAffineTransform(scaleX: 1, y: -1)
                removeButton.transform = CGAffineTransform(scaleX: 1, y: -1)
            }
        }
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let removeAction = UIContextualAction(style: .normal, title: "Remove") { (action, view, handler) in
            print("remove action tapped")
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            self.list.remove(at: indexPath.row)
            tableView.reloadData()
            tableView.endUpdates()
        }
        let detailAction = UIContextualAction(style: .normal, title: "Detail") { (action, view, handler) in
            print("deatil action tapped")
        }
        removeAction.backgroundColor = .red
        detailAction.backgroundColor = .green
        
        return UISwipeActionsConfiguration(actions: [removeAction, detailAction])
    }
    func adjustTextViewHeight() {
        let fixedWidth = textView.frame.size.width
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        textView.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
    }
}

extension MessengerViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
//       self.adjustTextViewHeight()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textView.becomeFirstResponder()
    }
}
