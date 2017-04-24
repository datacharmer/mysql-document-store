import mysqlx
import json

def prettify_json(struct, hide_passwords=False):
    return json.dumps(struct, indent=4, separators=(',', ': '))

with open('person.json', 'r') as json_data:
    recs = json.load(json_data)

new_collection='persondoc'

# Connect to server on localhost
session = mysqlx.get_session({
        'host': '127.0.0.1',
        'port': 18001,
        'user': 'msandbox',
        'password': 'msandbox'
        })


schema=None
try:
    schema = session.get_schema('docstore')
except :
    pass
else:
    schema=session.create_schema('docstore')


collections = schema.get_collections()

for c in collections :
    if c._name == new_collection:
        schema.drop_collection(new_collection)
    print(c._name)

nc=schema.create_collection(new_collection)

for rec in recs:
    nc.add(rec).execute()
    print(prettify_json(rec))

print('documents: %d' % ( nc.count()))

session.close()

# collection
# 'append'
# 'count'
# 'extend'
# 'index'
# 'insert'
# 'pop'
# 'remove'
# 'reverse'
# 'sort'

# session
# 'bind_to_default_shard'
# 'close'
# 'commit'
# 'create_schema'
# 'drop_schema'
# 'get_default_schema'
# 'get_schema'
# 'is_open'
# 'rollback'
# 'start_transaction'


# schema
# 'alter_view'
# 'am_i_real'
# 'create_collection'
# 'create_table'
# 'create_view'
# 'drop_collection'
# 'drop_table'
# 'drop_view'
# 'exists_in_database'
# 'get_collection'
# 'get_collection_as_table'
# 'get_collections'
# 'get_name'
# 'get_schema'
# 'get_session'
# 'get_table'
# 'get_tables'
# 'get_view'
# 'name'
# 'schema'
# 'who_am_i'
