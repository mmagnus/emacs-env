# http://pymacs.progiciels-bpi.ca/Winkler.html


from Pymacs import lisp
interactions = {}

def add_task():
    #start, end = lisp.point(), lisp.mark(True)
    #words = lisp.buffer_substring(start, end).split()
    #lisp.delete_region(start, end)
    toinsert = """## Goal

### Abstract

### Conclusion
    
### Plan

### Q: Can be done any simpler?

### Q: What if I do it?

### Q: If I dont do it?
    
"""
    lisp.insert(toinsert)

interactions[add_task] = ''
