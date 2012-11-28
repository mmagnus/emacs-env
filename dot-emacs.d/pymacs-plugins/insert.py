from commands import getoutput
import random
import string
import os
import gtk
# http://pymacs.progiciels-bpi.ca/Winkler.html


from Pymacs import lisp
interactions = {}


def youtube():
    #start, end = lisp.point(), lisp.mark(True)
    #words = lisp.buffer_substring(start, end).split()
    #lisp.delete_region(start, end)
    clipboard = gtk.clipboard_get()
    youtubeid = clipboard.wait_for_text()
    # just in case if you type a whole URL
    youtubeid = youtubeid.replace('http://www.youtube.com/watch?v=','')
    # Out[15]: '-MCCP4fx0RE'    
    toinsert = 'http://www.youtube.com/embed/' + youtubeid
    lisp.insert(toinsert)

def screenshotfromclipboard():
    clipboard = gtk.clipboard_get()
    image = clipboard.wait_for_image()
    id = ''
    for i in range(0,20):
        if random.randint(0,1):
            id+=str(random.randint(0,9))
        else:
            x= random.randint(0,25)
            id+=string.ascii_letters[x]
    filename = 'emacs-paste-' + id + '.png'
    path="/home/magnus/Dropbox/Public/lb/" + filename
    #getoutput('import ' + path)
    image.save(path, 'png')
    #os.system('/usr/bin/emacsclient ' + path ) # nie dziala!
    os.system('gloobus-preview ' + path )
    #getoutput(' ' + path)   
    lisp.insert('![](' + filename + ')\n')
    lisp.insert('**Figure**.')

def screenshot():
    id = ''
    for i in range(0,20):
        if random.randint(0,1):
            id+=str(random.randint(0,9))
        else:
            x= random.randint(0,25)
            id+=string.ascii_letters[x]
    filename = 'emacs-paste-' + id + '.png'
    path="/home/magnus/Dropbox/Public/lb/" + filename
    getoutput('import ' + path)
    #os.system('/usr/bin/emacsclient ' + path ) # nie dziala!
    os.system('gloobus-preview ' + path )
    #getoutput(' ' + path)   
    lisp.insert('![](' + filename + ')')
    
interactions[youtube] = ''
interactions[screenshot] = ''
interactions[screenshotfromclipboard] = ''
#if __name__ == '__main__':
#    screenshot()
