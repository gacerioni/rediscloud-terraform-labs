import csv
import json
import sys

csv_file = sys.argv[1]
data = []

with open(csv_file, mode='r') as file:
    reader = csv.DictReader(file)
    for row in reader:
        data.append(row)

# Return the JSON array as a string in a dictionary
print(json.dumps({"databases": json.dumps(data)}))
