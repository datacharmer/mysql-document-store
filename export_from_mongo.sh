
docker exec -ti mongo mongo --quiet \
    --eval 'DBQuery.shellBatchSize=3000; var all=db.restaurants.find() ; all' \
    | perl -pe 's/(?:ObjectId|ISODate)\(("[^"]+")\)/$1/g' \
    > all_recs.json

