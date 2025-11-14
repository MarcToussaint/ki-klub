#!/usr/bin/env python

import csv
from liquid import Environment
from liquid import FileSystemLoader

# load members
members_file = csv.DictReader(open("members.csv"))

members = []
for row in members_file:
    members.append(row)
    
# render using liquid

env = Environment(loader=FileSystemLoader("templates/"))

template = env.get_template("index.html")

with open('index.html', 'w') as f:
    f.write(template.render(
        heading="Some List",
        page_title="Awesome Title",
        people=members,
    ))
