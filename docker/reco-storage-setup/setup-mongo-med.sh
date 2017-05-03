#!/bin/bash

mongo --host config-r0 --eval "rs.initiate(
    {
        _id: 'configset',
        configsvr: true,
        members: [
            { _id : 0, host : 'cfg1.example.net:27017' },
            { _id : 1, host : 'cfg2.example.net:27017' },
            { _id : 2, host : 'cfg3.example.net:27017' }
        ]
    }
)"

