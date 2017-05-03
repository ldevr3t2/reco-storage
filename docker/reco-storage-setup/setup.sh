#!/bin/bash

# Initialize config "replica set"
mongo --host config-r0 --eval "rs.initiate(
    {
        _id: 'configset',
        configsvr: true,
        members: [
            { _id : 0, host : 'config-r0:27017' }
        ]
    }
)"

mongo --host shard0-r0 --eval "rs.initiate(
  {
    _id : 'shard0set',
    members: [
      { _id : 0, host : 'shard0-r0:27017' },
      { _id : 1, host : 'shard0-r1:27017' }
    ]
  }
)"

mongo --host shard0-r0 --eval "rs.status()"

# mongo --host <shard #0 primary host> --eval "rs.addArb('shard0-arb:27017')"

mongo --host shard0-r0 --eval "rs.initiate(
  {
    _id : 'shard0set',
    members: [
      { _id : 0, host : 'shard0-r0:27017' },
      { _id : 1, host : 'shard0-r1:27017' }
    ]
  }
)"

mongo --host shard0-r0 --eval "rs.status()"

# mongo --host <shard #0 primary host> --eval "rs.addArb('shard0-arb:27017')"

mongo --host shard1-r0 --eval "rs.initiate(
  {
    _id : 'shard0set',
    members: [
      { _id : 0, host : 'shard1-r0:27017' },
      { _id : 1, host : 'shard1-r1:27017' }
    ]
  }
)"

mongo --host shard1-r0 --eval "rs.status()"

# mongo --host <shard #0 primary host> --eval "rs.addArb('shard0-arb:27017')"