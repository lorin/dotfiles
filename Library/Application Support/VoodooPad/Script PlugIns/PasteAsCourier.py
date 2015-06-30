VPScriptMenuTitle = "Paste as Courier New 12pt"

from AppKit import *
from Foundation import *

def main(windowController, *args, **kwargs):
    textView = windowController.textView()
    f = NSFont.fontWithName_size_("Courier New", 12)
    attrs = {NSFontAttributeName: f}

    pb = NSPasteboard.generalPasteboard()
    s  = pb.stringForType_(NSStringPboardType)

    if s is None:
        return # in case we didn't have text on the clipboard

    attstr = NSMutableAttributedString.alloc().initWithString_(s)
    attstr.setAttributes_range_(attrs, (0, len(s)))

    # wrapping our change in shouldChangeTextInRange_replacementString_ + didChangeText
    # allows for free undo support
    if textView.shouldChangeTextInRange_replacementString_(textView.selectedRange(), None):
        textView.insertText_(attstr)
        textView.didChangeText()
