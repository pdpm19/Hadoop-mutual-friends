#!/usr/bin/env python
"""mapper.py"""

import sys

# IDs to search
ids = []
ids.append(str(109123727761757726835))
ids.append(str(100722679426961808186))

# input comes from STDIN (standard input)
for line in sys.stdin:
    # remove leading and trailing whitespace
    line = line.strip()
    
    # split the line into values (id0 -> friend_id)
    id, f_id = line.split()
    for i in ids:
        if i == id:
            # write the results to STDOUT (standard output);
            # what we output here will be the input for the
            # Reduce step, i.e. the input for reducer.py
            #
            # tab-delimited; the trivial word count is 1
            print("%s\t%s" %(f_id, 1))