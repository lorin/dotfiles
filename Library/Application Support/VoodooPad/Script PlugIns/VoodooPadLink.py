VPScriptMenuTitle = "Copy VoodooPad Link to clipboard"

from AppKit import *
from Foundation import *

def main(windowController, *args, **kwargs):
        page = windowController.currentPage()
        link =  "x-voodoopad-item://" + page.uuid()
        newStr = NSString.stringWithString_(link)
        pb = NSPasteboard.generalPasteboard()
        pb.declareTypes_owner_([NSStringPboardType], None)
        pb.setString_forType_(unicode(link), NSStringPboardType)
