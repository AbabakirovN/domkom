//
//   Constants.swift
//  TimeTree
//
//  Created by Adakhanau on 08.12.2019.
//  Copyright © 2019 neobis. All rights reserved.
//

import Foundation

struct Constants {
    struct Network {
        struct ErrorMessage {
            static let NO_INTERNET_CONNECTION = "Подключение к Интернету отсутствует"
            static let UNABLE_LOAD_DATA = "Невозможно загрузить данные"
            static let NO_HTTP_STATUS_CODE = "Невозможно получить ответ HTTP-код состояния"
            static let FORBIDDEN = "Ошибка 403"
            static let UNAUTHORIZED = "Unauthorized error"
            static let NOT_FOUND = "404 Ненайдено"
            static let SERVER_ERROR = "Сервер не работает"
            static let BAD_REQUEST = "Ошибка 400"
        }
    }
    
    struct Segue {
        struct FromQuestionList {
            static let ToDetails = "SegueFromQuestionListToDetails"
        }
        struct FromSettings {
            static let ToLanguage = "SegueFromSettingsToLanguage"
            static let ToContact = "SegueFromSettingsToContact"
            static let ToFeedback = "SegueFromSettingsToFeedback"
        }
        struct FromSetLanguage {
            static let ToWelcome = "SegueFromLanguageScreenToWelcomeScreen"
        }
        struct FromReligions {
            static let ToSubcategory = "SegueFromReligionToSubcategory"
        }
        struct FromSubcategory {
            static let ToPublication = "SegueFromSubcategoryToPublication"
        }
        struct FromPublication {
            static let ToMaterial = "SegueFromPublicationToMaterial"
        }
        struct FromTest {
            static let ToExam = "SegueFromTestToExam"
        }
    }
    
    struct ViewControllerId {
        static let ChangeLanguageScreen = "changeLanguageScreen"
        static let SetLanguageScreen = "SetLanguageVC"
        static let SettingScreen = "SettingScreen"
        static let EducationScreen = "EducationScreen"
        static let TestScreen = "TestVC"
        static let ForumScreen = "ForumVC"
        static let FAQScreen = "FAQVC"
        static let ResultVC = "ResultVC"
    }
    
    struct CellId {
        static let ReligionCell = "ReligionCell"
        static let QuestionCell = "questionCell"
        static let SettingCell = "settingCell"
        static let SubcategoryCell = "SubcategoryCell"
        static let ForumCell = "ForumCell"
        static let TestCell = "TestCell"
        static let AnswerCell = "AnswerCell"
    }
    
    struct Image {
        static let ArrowUp = "arrowUp"
        static let ArrowDown = "arrowDown"
    }
    
    struct LocalizedText {
        static let NextButton = "next_button"
        static let SendButton = "send_button"
        static let AgeButton = "age_button"
        static let AskButton = "ask_button"
        
        static let NamePlaceholder = "name_placeholder"
        static let YourFeedback = "your_feedback"
        static let YourQuestion = "your_question"
        static let Feedback = "feedback"
        static let YourAge = "your_age"
        static let Questions = "questions"
        static let Yes = "yes"
        static let Cancel = "cancel"
        static let FirstLvl = "first_level"
        static let SecondLvl = "second_level"
        static let AllTests = "all_tests"
        static let TestQuestions = "test_questions"
        static let TestPassed = "test_passed"
        static let Close = "close"

        static let InstructionText = "instruction_text"
        static let WelcomeText = "welcome_message_text"
        static let AboutAppText = "about_app_text"
        static let ForumText = "forum_text"
        static let ResultBestText = "result_best_text"
        static let ResultBestTextDescription = "result_best_text_description"
        static let ResultGoodText = "result_good_text"
        static let ResultBadText = "result_bad_text"
        
        static let ForumAlert = "forum_alert" 
        static let FeedbackAlert = "feedback_alert"
        static let TestAlert = "test_alert"
        
        static let ExaminationTitle = "examination_title"
        static let WelcomeTitle = "welcome_message_title"
        static let EducationTitle = "education_title"
        static let AboutAppTitle = "about_app_title"
        static let SettingTitle = "setting_title"
        static let FAQTitle = "faq_title"
        static let QuestionsTitle = "questions_title"
        static let AnswerTitle = "answer_title"
        
        static let LanguageCell = "language_cell_name"
        static let FeedbackCell = "feedback_cell_name"
        static let ContactCell = "contact_cell_name"
        static let AdminName = "admin_name"
    }
    
}

struct URLs {
    
    static let main = "http://46.101.236.211:8666"
    
    // MARK: - About App
    /// GET
    static let contacts = main + "/about/contact/"
    
    // MARK:- Age
    /// POST {age}
    static let age = main + "/about/age/"
    
    // MARK:- FAQ
    /// POST {age}
    static let faq = main + "/faq/"
    
    // MARK:- Education
    /// POST {age}
    static let education = main + "/education/"
    
    // MARK:- Feedback
    /// POST {name,text}
    static let feedback = main + "/about/comment/"
    
    // MARK:- Forum
    /// POST {name,text}
    static let limit = main + "/forum/?limit="
    static let offset = "offset="
    
    /// POST {name,text}
    static let ask = main + "/forum/create/"
    
    // MARK: - Test
    static let test = main + "/test/"
    
    /// POST {test}
    static let finishTest = main + "/test/create/"
    
    /// GET
    static let testCategory = main + "/test/category/"
}

struct Message {
    static let ERROR = "Ошибка"
    static let FAQ = "FAQ"
}

