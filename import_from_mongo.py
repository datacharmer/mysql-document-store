import mysqlx
import os
import json
import re

# Connect to server on localhost
session = mysqlx.get_session({
        'host': '127.0.0.1',
        'port': 18001,
        'user': 'msandbox',
        'password': 'msandbox'
        })

schema = session.get_schema('test')
collection = schema.create_collection('restaurants')

with open('all_recs.json', 'r') as json_data:
    for line in json_data:
        skip=re.match('Type', line)
        if not skip:
            # print(line)
            rec = json.loads(line)
            collection.add(rec).execute()

print('documents: %d' % ( collection.count()))

session.close()
