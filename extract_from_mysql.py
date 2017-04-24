import mysqlx
import os
import json
# Connect to server on localhost
session = mysqlx.get_session({
        'host': '127.0.0.1',
        'port': 33060,
        'user': 'msandbox',
        'password': 'msandbox'
        })

schema = session.get_schema('world_x')
collection = schema.get_collection('CountryInfo')
result = collection.find().execute()
docs = result.fetch_all()

for doc in docs:
    doc = dict(doc)
    print(json.dumps(doc, indent=4))

session.close()
