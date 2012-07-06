# http://pymacs.progiciels-bpi.ca/Winkler.html


from Pymacs import lisp
interactions = {}

def break_on_whitespace():
    start, end = lisp.point(), lisp.mark(True)
    words = lisp.buffer_substring(start, end).split()
    lisp.delete_region(start, end)
    lisp.insert('\n'.join(words))

interactions[break_on_whitespace] = ''
