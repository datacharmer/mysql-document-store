import mysqlx
import os
# Connect to server on localhost
session = mysqlx.get_session({
        'host': '127.0.0.1',
        'port': 18001,
        'user': 'msandbox',
        'password': 'msandbox'
        })

#schema = session.get_schema('world_x')
schema = session.get_schema('persondoc')

#collection = schema.get_collection('CountryInfo')
collection = schema.get_collection('person')


#result = collection.find("Name='Spain'").limit(1).execute()
result = collection.find("name='Martin'").limit(1).execute()

# Print document
docs = result.fetch_all()

print(docs[0])
session.close()
