//
//  ViewController.swift
//  KakaoLogin
//
//  Created by 박승환 on 5/3/24.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class ViewController: UIViewController {
    
    @IBOutlet weak var infoField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        KakaoSDK.initSDK(appKey: "ba1c3e526ff03585d36557dbeee8c31e")
//        self.checkLoginAndAuthenticateIfNeeded()
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        print("버튼 누름")
        loginWithKakao()
    }
    
    func fetchUserProfile() {
        UserApi.shared.me { (user, error) in
            if let error = error {
                print("사용자 정보 요청 실패:", error)
            } else {
                if let user = user {
                    print("사용자 정보 요청 성공: \(user)")
                    // 사용자 정보를 활용한 추가 로직 구현
                }
            }
        }
    }
    
    func checkLoginAndAuthenticateIfNeeded() {
        UserApi.shared.accessTokenInfo { (accessTokenInfo, error) in
            if let error = error {
                print("로그인 상태 확인 실패:", error)
                self.loginWithKakao()
            } else {
                print("현재 로그인 상태 유지 중, AccessToken 유효")
                // 사용자가 로그인 상태이고 토큰도 유효한 경우 필요한 다음 단계를 진행
            }
        }
    }

    func loginWithKakao() {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                if let error = error {
                    self.handleLoginError(error)
                } else {
                    print("카카오톡 로그인 성공")
                    // 성공적으로 로그인 완료 후 처리 로직
                    self.fetchUserProfile()
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    self.handleLoginError(error)
                } else {
                    print("카카오계정 로그인 성공")
                    // 성공적으로 로그인 완료 후 처리 로직
                }
            }
        }
    }
    
    func handleLoginError(_ error: Error) {
        if let sdkError = error as? SdkError {
            switch sdkError {
            case .ClientFailed(let reason, let errorMessage):
                print("클라이언트 오류 발생:", errorMessage ?? "알 수 없는 오류")
                switch reason {
                case .TokenNotFound:
                    print("토큰 없음: 다시 로그인 필요")
                    DispatchQueue.main.async {
                        self.showLoginAlert()
                    }
                default:
                    print("처리되지 않은 오류:", reason)
                }
            default:
                print("다른 SDK 오류:", sdkError)
            }
        } else {
            print("비SDK 오류:", error.localizedDescription)
        }
    }

    func showLoginAlert() {
        let alert = UIAlertController(title: "로그인 필요", message: "세션이 만료되었습니다. 다시 로그인 해주세요.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { action in
            self.loginWithKakao()
        }))
        self.present(alert, animated: true)
    }
}
