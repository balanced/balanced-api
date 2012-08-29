# Marketplace

## Get a marketplace

    GET /:version/marketplaces/:marketplace_id

### Response

#### Header

    Status: 200 OK

#### Body

    {
        "id": "MP3fcTyo4hrVp44bCjRmxtpQ",
        "status": "live",
        "reserve": 1716,
        "balance": -100,
        "api_key": "0f8df97cf21c11e1887e026ba7e239a9",
        "bank_account": {
            "id": "BANm9b8BcoOjcF5i1p4eV9I",
            "name": "Rent my bike",
            "account_number": "xxxxxx1129",
            "routing_number": "121042882",
            "type": "checking"
        }
    }