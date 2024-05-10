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
    
    // 로그인 상태 확인 레이블
    @IBOutlet weak var loginStatusLableOutlet: UILabel!
    // 로그인 시 보여줄 프로필 사진
    @IBOutlet weak var imageViewOutlet: UIImageView!
    // 로그인 시 보여줄 닉네임 레이블
    @IBOutlet weak var nameLabelOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 내용 및 사진 초기화
        loginStatusLableOutlet.text = "로그아웃 상태"
        imageViewOutlet.isHidden = true
        imageViewOutlet.image = nil
        nameLabelOutlet.isHidden = true
        self.nameLabelOutlet.text = "닉네임 : "
        // 카카오 SDK 초기화
        KakaoSDK.initSDK(appKey: "{앱 키}")
        // 로그인 상태확인
        self.checkLoginAndAuthenticateIfNeeded()
    }
    
    // 로그인 버튼
    @IBAction func loginButton(_ sender: Any) {
        print("버튼 누름")
        loginWithKakao()
    }
    // 로그아웃 버튼
    @IBAction func logoutButton(_ sender: Any) {
        logout()
        loginStatusLableOutlet.text = "로그아웃 상태"
        self.imageViewOutlet.isHidden = true
        self.imageViewOutlet.image = nil
        self.nameLabelOutlet.isHidden = true
        self.nameLabelOutlet.text = "닉네임 : "
    }
    
    // 유저 정보 가져오기
    func fetchUserProfile() {
        UserApi.shared.me { (user, error) in
            if let error = error {
                print("사용자 정보 요청 실패:", error)
            } else {
                if let user = user {
                    print("사용자 정보 요청 성공: \(user)")
                    self.imageViewOutlet.isHidden = false
                    self.loginStatusLableOutlet.text = "로그인 상태"
                    self.nameLabelOutlet.isHidden = false
                    if let nickname = user.kakaoAccount?.profile?.nickname {
                        print("사용자 닉네임: \(nickname)")
                        self.nameLabelOutlet.text = "닉네임 : \(nickname)"
                    }
                    if let profileImageUrl = user.kakaoAccount?.profile?.thumbnailImageUrl {
                        print("프로필 사진 URL: \(profileImageUrl)")
                        self.imageViewOutlet.load(url: profileImageUrl)
                    }
                }
            }
        }
    }
    
    // 로그인 상태 확인하기
    func checkLoginAndAuthenticateIfNeeded() {
        UserApi.shared.accessTokenInfo { (accessTokenInfo, error) in
            if let error = error {
                print("로그인 상태 확인 실패:", error)
                self.loginWithKakao()
            } else {
                print("현재 로그인 상태 유지 중, AccessToken 유효")
                self.fetchUserProfile()
            }
        }
    }

    // 로그인하기
    func loginWithKakao() {
        // 카카오톡 어플로 로그인하기
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                if let error = error {
                    self.handleLoginError(error)
                } else {
                    print("카카오톡 로그인 성공")
                    self.fetchUserProfile()
                }
            }
        // 웹에서 카카오계정으로 로그인 하기
        } else {
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    self.handleLoginError(error)
                } else {
                    print("카카오계정 로그인 성공")
                    self.fetchUserProfile()
                }
            }
        }
    }
    
    // 로그인 실패 시 나오는 오류 확인하기
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

    // 로그인 알림? 잘 모르겠음
    func showLoginAlert() {
        let alert = UIAlertController(title: "로그인 필요", message: "세션이 만료되었습니다. 다시 로그인 해주세요.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { action in
            self.loginWithKakao()
        }))
        self.present(alert, animated: true)
    }
    
    // 로그아웃 기능
    func logout() {
        UserApi.shared.logout { (error) in
            if let error = error {
                print("로그아웃 실패:", error)
            } else {
                print("로그아웃 성공")
            }
        }
    }
}

// 사진에 url 을 삽입하여 출력하기 위한 확장
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
