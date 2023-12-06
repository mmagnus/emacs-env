#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""

"""
from __future__ import print_function
import argparse
from icecream import ic
import sys
ic.configureOutput(outputFunction=lambda *a: print(*a, file=sys.stderr))
ic.configureOutput(prefix='> ')

foo = 10
"""This if foo"""

a = 10
"""a is 10 or not"""

class A:
    x = 22
    """Docstring for class variable A.x"""

    def __init__(self, a):
        self.y = a
        """Docstring for instance variable A.y"""

A.x

foo

a

x = 22 #: docstring for x

x

#: docstring for x
y = 22


y


def get_parser():
    parser = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)

    #parser.add_argument('-', "--", help="", default="")

    parser.add_argument("-v", "--verbose",
                        action="store_true", help="be verbose")
    parser.add_argument("file", help="", default="") # nargs='+')
    return parser

def sum0(x:int, y:int):
    return x + y

def sum1(x:int, y:int):
    """dupa dupa

    args:

       x, y ints"""
    return x + y

sum0(10, 10)

if __name__ == '__main__':
    import ipdb; ipdb.set_trace()
    parser = get_parser()
    args = parser.parse_args()

    if list != type(args.file):
        args.file = [args.file]

    for f in args.file:
        #print(f + ', ' + str(result))
        pass

