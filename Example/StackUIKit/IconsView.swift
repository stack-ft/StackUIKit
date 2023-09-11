//
//  IconsView.swift
//  StackUIKit_Example
//
//  Created by samuel Ailemen on 9/9/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import SwiftUI
import StackUIKit

struct IconsView: View {
    var body: some View {
        VStack(spacing: 10) {
            Group {
                HStack(spacing: 10) {
                    Image(stackIcon: .alert_outline)
                    Image(stackIcon: .bell_outline)
                    Image(stackIcon: .eye_hide_outline)
                    Image(stackIcon: .eye_view_outline)
                    Image(stackIcon: .archive_outline)
                    Image(stackIcon: .arrow_narrow_down_outline)
                    Image(stackIcon: .arrow_narrow_up_outline)
                    Image(stackIcon: .arrow_narrow_left_outline)
                    Image(stackIcon: .arrow_narrow_right_outline)
                }
            }
            
            Group {
                HStack(spacing: 10) {
                    Image(stackIcon: .bitcoin)
                    Image(stackIcon: .bookmark_fill)
                    Image(stackIcon: .bookmark_outline)
                    Image(stackIcon: .briefcase_outline)
                    Image(stackIcon: .building_outline)
                    Image(stackIcon: .calendar_outline)
                    Image(stackIcon: .debitCard_outline)
                    Image(stackIcon: .debitCard_fill)
                    Image(stackIcon: .debitCard_send_outline)

                }
            }
            
            Group {
                HStack(spacing: 10) {
                    Image(stackIcon: .debitCard_receive_outline)
                    Image(stackIcon: .chart_fill)
                    Image(stackIcon: .chart_outline)
                    Image(stackIcon: .check)
                    Image(stackIcon: .chevron_up)
                    Image(stackIcon: .chevron_down)
                    Image(stackIcon: .chevron_left)
                    Image(stackIcon: .chevron_right)
                    Image(stackIcon: .clipboard_outline)
                }
            }
            
            Group {
                HStack(spacing: 10) {
                    Image(stackIcon: .flash_outline)
                    Image(stackIcon: .copy_outline)
                    Image(stackIcon: .dollar_outline)
                    Image(stackIcon: .dots_vertical_fill)
                    Image(stackIcon: .driving_fill)
                    Image(stackIcon: .element_plus_outline)
                    Image(stackIcon: .empty_wallet_fill)
                    Image(stackIcon: .file_download_outline)
                    Image(stackIcon: .file_text_outline)
                }
            }
            
            Group {
                HStack(spacing: 10) {
                    Image(stackIcon: .filter_outline)
                    Image(stackIcon: .globe_outline)
                    Image(stackIcon: .group_outline)
                    Image(stackIcon: .heart_outline)
                    Image(stackIcon: .heart_fill)
                    Image(stackIcon: .home_fill)
                    Image(stackIcon: .home_outline)
                    Image(stackIcon: .like_outline)
                    Image(stackIcon: .lock_outline)

                }
            }
            
            Group {
                HStack(spacing: 10) {
                    Image(stackIcon: .mail_outline)
                    Image(stackIcon: .map_pin_outline)
                    Image(stackIcon: .menu)
                    Image(stackIcon: .message_fill)
                    Image(stackIcon: .message_outline)
                    Image(stackIcon: .minus)
                    Image(stackIcon: .dollar_send_fill)
                    Image(stackIcon: .money_outline)
                    Image(stackIcon: .paypal)
                }
            }
            
            Group {
                HStack(spacing: 10) {
                    Image(stackIcon: .phone_outline)
                    Image(stackIcon: .plus)
                    Image(stackIcon: .printer_outline)
                    Image(stackIcon: .circular_question_mark_outline)
                    Image(stackIcon: .receipt_tax_fill)
                    Image(stackIcon: .receipt_tax_outline)
                    Image(stackIcon: .receipt_outline)
                    Image(stackIcon: .search_fill)
                    Image(stackIcon: .search_outline)
                }
            }
            
            Group {
                HStack(spacing: 10) {
                    Image(stackIcon: .settings_outline)
                    Image(stackIcon: .share_type_two_outline)
                    Image(stackIcon: .share_outline)
                    Image(stackIcon: .shop_add_outline)
                    Image(stackIcon: .one_star_fill)
                    Image(stackIcon: .one_star_outline)
                    Image(stackIcon: .half_star_fill)
                    Image(stackIcon: .half_star_outline)
                    Image(stackIcon: .stats_up_fill)
                }
            }
            
            Group {
                HStack(spacing: 10) {
                    Image(stackIcon: .timer_outline)
                    Image(stackIcon: .user_fill)
                    Image(stackIcon: .user_outline)
                    Image(stackIcon: .users_outline)
                    Image(stackIcon: .wallet_outline)
                }
            }
        }
    }
}

struct IconsView_Previews: PreviewProvider {
    static var previews: some View {
        IconsView()
    }
}
