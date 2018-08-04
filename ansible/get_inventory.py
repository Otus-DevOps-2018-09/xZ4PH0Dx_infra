#!/usr/bin/python

import sys
import json

def load_data(filepath):
    with open(filepath, 'r') as file:
        return file.read()


if __name__ == '__main__':
    if len(sys.argv) < 2 or sys.argv[1] != '--list':
        print ''
    else:
        print load_data('inventory.json')
 
