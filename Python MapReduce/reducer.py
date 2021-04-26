#!/usr/bin/env python
"""reducer.py"""

from operator import itemgetter
import sys

current_id = None
current_count = 0
id = None
mutual_friends = 0
# In this case we are only trying to find mutual friends from 2 IDs
n_ids = 2

# input comes from STDIN
for line in sys.stdin:
    # remove leading and trailing whitespace
    line = line.strip()

    # parse the input we got from mapper.py
    id, count = line.split('\t', 1)

    # convert count (currently a string) to int
    try:
        count = int(count)
    except ValueError:
        # count was not a number, so silently
        # ignore/discard this line
        continueex

    # this IF-switch only works because Hadoop sorts map output
    # by key (here: word) before it is passed to the reducer
    if current_id == id:
        current_count += count
        # IDs duplicated will not count
        if current_count == n_ids:
            mutual_friends += 1
    else:
        current_count = count
        current_id = id

# Output the last id if needed!
if current_id == id:
    # IDs duplicated will not count
    if current_count == n_ids:
        mutual_friends += 1

# Now writes the result to an output file
f = open("output.txt", "w")
s = "N. of mutual friends: " + str(mutual_friends)
f.write(s)
f.close()