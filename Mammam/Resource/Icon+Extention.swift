//
//  Icon+Extention.swift
//  Mammam
//
//  Created by Evelyn Santoso on 05/12/24.
//

import Foundation
import SwiftUI

extension Image {
    
    struct LogMealCardIcon {
        static var consumed: Image {
            return Image("Icons/LogMealCard/i_log_meal_card_consumed")
        }
        
        static var time: Image {
            return Image("Icons/LogMealCard/i_logmealcard_time")
        }
    }
    
    struct LogMealFormIcon {
        static var cup: Image {
            return Image("Icons/LogMealFormIcon/i_logmealform_cup")
        }
        
        static var cup2: Image {
            return Image("Icons/LogMealFormIcon/i_logmealform_cup2")
        }
        
        static var notes: Image {
            return Image("Icons/LogMealFormIcon/i_logmealform_notes")
        }
        
        static var notfilledcup1: Image {
            return Image("Icons/LogMealFormIcon/i_logmealform_notfilledcup1")
        }
        
        static var notfilledcup2: Image {
            return Image("Icons/LogMealFormIcon/i_logmealform_notfilledcup2")
        }
        
        static var notfilledspoon: Image {
            return Image("Icons/LogMealFormIcon/i_logmealform_notfilledspoon")
        }
        
        static var spoon: Image {
            return Image("Icons/LogMealFormIcon/i_logmealform_spoon")
        }
        
        static var time: Image {
            return Image("Icons/LogMealFormIcon/i_logmealform_time")
        }
        
    }
    
    struct MealPlanIcon {
        
        static var switchIcon: Image {
            return Image("Icons/MealPlanIcon/i_mealplan_switch")
        }

    }
    
    struct MotivationIcon{
        static var blinkleft: Image {
            return Image("Icons/Motivation/i_motivation_blinkleft")
        }
        
        static var blinkright: Image {
            return Image("Icons/Motivation/i_motivation_blinkright")
        }
        
        static var close: Image {
            return Image("Icons/Motivation/i_motivation_close")
        }
        
        static var crackheart: Image {
            return Image("Icons/Motivation/i_motivation_crackheart")
        }
        
        static var heart: Image {
            return Image("Icons/Motivation/i_motivation_heart")
        }
        
        static var quotation: Image {
            return Image("Icons/Motivation/i_motivation_quotation")
        }
        
    }
    
    struct ProfileIcon{
        
        static var Person: Image {
            return Image("Icons/Profile/i_profile_person")
        }
        
    }
    
    struct SummaryIcon{
        static var decrease: Image {
            return Image("Icons/Summary/i_summary_decrease")
        }
        
        static var increase: Image {
            return Image("Icons/Summary/i_summary_increase")
        }
    }
        
}
