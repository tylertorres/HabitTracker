//
//  BorderedTextEditor.swift
//  HabitTracker
//
//  Created by Tyler Torres on 9/1/23.
//

import SwiftUI

struct BorderedTextEditor: View {
    
    @Binding var text: String
    
    var borderColor: Color = Color.gray
    
    var body: some View {
        TextEditor(text: $text)
            .padding(10)
            .frame(minHeight: 100)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(borderColor, lineWidth: 2)
            )
    }
}

struct BorderedTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        BorderedTextEditor(text: .constant("User Input"))
    }
}
