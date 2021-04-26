# Standalone needs to sort the Input for Reducer
# cat <dataset> | runs mapper | sorts the input of reducer | runs reducer

cat gplus_combined.csv | ./mapper.py | sort -k1,1 | ./reducer.py