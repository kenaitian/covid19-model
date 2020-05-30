i = 1

# create a ThingsBatchRequest for adding things
batch = weaviate.ThingsBatchRequest()

# create a ReferenceBatchRequest for adding references
batchRefs = weaviate.ReferenceBatchRequest()

for author, publication in authors.items():

    # empty author object
    authorObj = {}

    # author obj
    authorObj = {
        'name': author,
        'writesFor': [
            {
                'beacon': 'weaviate://localhost/things/' + publication
            }
        ]
    }

    # add every 1000 by taking the modus of 999 (counter starts at 0)
    if (i % 999) == 0:
        # Send the batch to Weaviate
        CLIENT.create_things_in_batch(batch)
        
        # Create an empty batch
        batch = weaviate.ThingsBatchRequest()
        
        # Send the ref batch to Weaviate
        CLIENT.add_references_in_batch(batchRefs)
        
        # Create an empty ref batch
        batchRefs = weaviate.ReferenceBatchRequest()

    # Add the thing to the batch request queue
    batch.add_thing(authorObj, 'Author', str(uuid.uuid3(uuid.NAMESPACE_DNS, author)))
    
    # Add a reference to the batch request queue
    batchRefs.add_reference("Publication", obj['publicationId'], "hasArticles", articleId)    
    
    i += 1

# Send the batch to Weaviate
CLIENT.create_things_in_batch(batch)

# Create an empty ref batch
CLIENT.add_references_in_batch(batchRefs)