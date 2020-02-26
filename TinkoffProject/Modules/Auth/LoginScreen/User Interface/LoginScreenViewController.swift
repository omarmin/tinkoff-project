//
//  LoginScreenViewController.swift
//  TinkoffTeamFive
//
//  Created by Gennady Stepanov on 22/02/2020.
//  Copyright © 2020 TinkoffTraining. All rights reserved.
//

import UIKit

public class LoginScreenViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var nextButton: CornerRadiusButton!
    @IBOutlet weak var pinSwitch: UISwitch!
    @IBOutlet weak var pinHintLabel: UILabel!
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private let loginStringErrorMessage = "Логин должен содержать от 3 до 20 букв лвтинского алфавита"
    private let passwordStringErrorMessage = "Пароль должен содержать от 8 до 20 символов"
    private let loginPlaceholderText = "Логин"
    private let passwordPlaceholderText = "Пароль"
    
    private var isLoginValid = false
    private var isPassValid = false
    private var loginPlaceholder = UILabel()
    private var passwordPlaceholder = UILabel()
    
    var eventHandler: LoginScreenModuleInterface!
    
    // MARK: - Lifecycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        resetContent()
        initKeyboardHandling()
        setupPlaceholders()
        setNextButtonEnabled(state: false)
    }
    
    override public func viewDidLayoutSubviews() {
        nextButton.layoutSubviews()
    }
    
    // MARK: - Private methods
    private func setupPlaceholders() {
        let placeholders: [UILabel] = [loginPlaceholder, passwordPlaceholder]
        
        loginPlaceholder.frame = loginTextField.bounds
        loginPlaceholder.text = loginPlaceholderText
        
        passwordPlaceholder.frame = passwordTextField.bounds
        passwordPlaceholder.text = passwordPlaceholderText
        
        for placeholder in placeholders {
            placeholder.textColor = UIColor.white.withAlphaComponent(0.65)
            placeholder.numberOfLines = 1
            placeholder.lineBreakMode = .byClipping
            placeholder.adjustsFontSizeToFitWidth = true
            placeholder.minimumScaleFactor = 0.5
        }
        
        loginTextField.insertSubview(loginPlaceholder, at: 0)
        passwordTextField.insertSubview(passwordPlaceholder, at: 0)
        
        CommonFunctions.addDefaultConstraintsToView(view: loginPlaceholder, in: loginTextField)
        CommonFunctions.addDefaultConstraintsToView(view: passwordPlaceholder, in: passwordTextField)
    }
    
    private func handlePlaceholderAndHint(placeholder: UILabel, for textField: UITextField) {
        if isTextFieldEmpty(field: textField) {
            placeholder.isHidden = false
            hideErrorMessage()
        } else {
            placeholder.isHidden = true
        }
    }
    
    private func isTextFieldEmpty(field: UITextField) -> Bool {
        return field.text == "" || field.text?.count == 0 || field.text == nil
    }
    
    private func hideErrorMessage() {
        errorMessageLabel.isHidden = true
    }
    
    private func initKeyboardHandling() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    @objc private func keyboardWasShown(notification: Notification) {
        guard
            let info = notification.userInfo as NSDictionary?,
            let keyboardSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size
            else {
                return
        }
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        scrollView?.contentInset = insets
        scrollView?.scrollIndicatorInsets = insets
    }
    
    @objc private func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func hideKeyboard() {
        scrollView?.endEditing(true)
    }
    
    // MARK: - IBActions
    @IBAction func loginFieldDidChange(_ sender: Any) {
        isLoginValid = CommonFunctions.validateLogin(login: loginTextField?.text ?? "")
        setNextButtonEnabled(state: isLoginValid && isPassValid)
        
        if !isLoginValid {
            showErrorMessage(text: loginStringErrorMessage)
        } else {
            hideErrorMessage()
        }
        handlePlaceholderAndHint(placeholder: loginPlaceholder, for: loginTextField)
    }
    
    @IBAction func passwordFieldDidChange(_ sender: Any) {
        isPassValid = CommonFunctions.validatePassword(password: passwordTextField?.text ?? "")
        setNextButtonEnabled(state: isLoginValid && isPassValid)
        
        if !isPassValid {
            showErrorMessage(text: passwordStringErrorMessage)
        } else {
            hideErrorMessage()
        }
        handlePlaceholderAndHint(placeholder: passwordPlaceholder, for: passwordTextField)
    }
    
    @IBAction func didTapNextButton(_ sender: Any) {
        if let login = loginTextField.text, let pass = passwordTextField.text {
            eventHandler.checkUserWithCredentials(login: login, pass: pass)
        }
        showLoadingIndicator()
    }
    
    @IBAction func pinSwitchDidChangeValue(_ sender: Any) {
        eventHandler.userChangedPinToggle(state: pinSwitch.isOn)
    }
}

// MARK: - LoginScreenViewInterface
extension LoginScreenViewController: LoginScreenViewInterface {
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    func resetContent() {
        hideErrorMessage()
        hideLoadingIndicator()
        pinSwitch.setOn(false, animated: false)
    }
    
    func showLoadingIndicator() {
        progressIndicator.isHidden = false
        progressIndicator.startAnimating()
    }
    
    func hideLoadingIndicator() {
        progressIndicator.stopAnimating()
        progressIndicator.isHidden = true
    }
    
    func setNextButtonEnabled(state: Bool) {
        let alpha: CGFloat = state ? 1 : 0.65
        nextButton.isEnabled = state
        nextButton.alpha = alpha
    }
    
    func showErrorMessage(text: String) {
        errorMessageLabel.text = text
        errorMessageLabel.isHidden = false
    }
    
    func setInputEnabled(status: Bool) {
        nextButton.isUserInteractionEnabled = status
        pinSwitch.isUserInteractionEnabled = status
    }
}
