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
