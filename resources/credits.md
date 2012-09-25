# Credits

* [Credit a New Bank Account](#credit-a-new-bank-account)
* [Credit an Existing Bank Account](#credit-an-existing-bank-account)
* [Retrieve a Credit](#retrieve-a-credit)
* [Retrieve a Credit (Unstored Bank Account)](#retrieve-a-credit-unstored-bank-account)
* [List All Credits](#list-all-credits)
* [List All Credits for a Bank Account](#list-all-credits-for-a-bank-account)


## Credit a New Bank Account

    POST /a0/credits

### Request

`amount`
: _required_ **integer**
: `>= 0`

`bank_account`
: _required_ **object**
: [Bank Account](./bank_accounts.md)

```javascript
{
    "amount": 1716,
    "bank_account": {
        "name": "Gottfried Leibniz",
        "account_number": "3819372930",
        "routing_number": "121042882",
        "type": "checking"
    }
}
```


### Response

#### Header

    Status: 201 Created

#### Body

```javascript
{
    "id": "CRtjdsSJg0fFN26PACLLVHz",
    "uri": "/a0/credits/CRtjdsSJg0fFN26PACLLVHz",
    "created_at": "2012-09-13T21:25:24Z",
    "amount": 1716,
    "state": "pending",
    "fee": 0,
    "bank_account": {
        "name": "Gottfried Leibniz",
        "account_number": "xxxxxx2930",
        "routing_number": "121042882",
        "type": "checking"
    }
}
```


## Credit an Existing Bank Account

    POST /a0/bank_accounts/:bank_account_id/credits

### Request

`amount`
: _required_ **integer**
: `>= 0`

```javascript
{
    "amount": 1716
}
```


### Response

#### Header

    Status: 201 Created

#### Body

```javascript
{
    "id": "CRtjdsSJg0fFN26PACLLVHz",
    "uri": "/a0/credits/CRtjdsSJg0fFN26PACLLVHz",
    "created_at": "2012-09-13T21:25:24Z",
    "amount": 1716,
    "state": "pending",
    "fee": 0,
    "bank_account": {
        "id": "BANm9b8BcoOjcF5i1p4eV9I",
        "uri": "/a0/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I",
        "created_at": "2012-09-13T21:25:24Z",
        "debits_uri": "/a0/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/debits",
        "credits_uri": "/a0/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/credits",
        "name": "Gottfried Leibniz",
        "account_number": "xxxxxx2930",
        "routing_number": "121042882",
        "type": "checking"
    }
}
```

## Retrieve a Credit

    GET /a0/credits/:credit_id

### Response

#### Header

    Status: 200 OK

#### Body

```javascript
{
    "id": "CRtjdsSJg0fFN26PACLLVHz",
    "uri": "/a0/credits/CRtjdsSJg0fFN26PACLLVHz",
    "created_at": "2012-09-13T21:25:24Z",
    "amount": 1716,
    "state": "cleared",
    "fee": 25,
    "bank_account": {
        "id": "BANm9b8BcoOjcF5i1p4eV9I",
        "uri": "/a0/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I",
        "created_at": "2012-09-13T21:25:24Z",
        "debits_uri": "/a0/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/debits",
        "credits_uri": "/a0/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/credits",
        "name": "Gottfried Leibniz",
        "account_number": "xxxxxx2930",
        "routing_number": "121042882",
        "type": "checking"
    }
}
```


## Retrieve a Credit (Unstored Bank Account)

    GET /a0/credits/:credit_id

### Response

#### Header

    Status: 200 OK

#### Body

```javascript
{
    "id": "CRtjdsSJg0fFN26PACLLVHz",
    "uri": "/a0/credits/CRtjdsSJg0fFN26PACLLVHz",
    "created_at": "2012-09-13T21:25:24Z",
    "amount": 1716,
    "state": "cleared",
    "fee": 25,
    "bank_account": {
        "name": "Gottfried Leibniz",
        "account_number": "xxxxxx2930",
        "routing_number": "121042882",
        "type": "checking"
    }
}
```


## List All Credits

    GET /a0/credits

### Response

#### Header

    Status: 200 OK

#### Body

```javascript
{
    "items": [
        {
            "id": "CRDXQO7z00n19KXU5IE2oX0",
            "uri": "/a0/credits/CRDXQO7z00n19KXU5IE2oX0",
            "created_at": "2012-09-19T19:50:23Z",
            "amount": 221970,
            "state": "pending",
            "fee": 0,
            "bank_account": {
                "id": "BAN6c0BIsrfqc3fCEx1izFMDS",
                "uri": "/a0/bank_accounts/BA6c0BIsrfqc3fCEx1izFMDS",
                "created_at": "2012-09-19T19:25:39Z",
                "debits_uri": "/a0/bank_accounts/BAN6c0BIsrfqc3fCEx1izFMDS/debits",
                "credits_uri": "/a0/bank_accounts/BAN6c0BIsrfqc3fCEx1izFMDS/credits",
                "name": "Kurt Gödel",
                "account_number": "xxxxxx8361",
                "routing_number": "121042882",
                "type": "savings"
            },
        },
        {
            "id": "CRDS8umCBvijMRKxENF1Ygy",
            "uri": "/a0/credits/CRDS8umCBvijMRKxENF1Ygy"
            "created_at": "2012-09-19T19:25:39Z",
            "amount": 4281906
            "state": "rejected",
            "fee": 350,
            "bank_account": {
                "id": "BAN6c0BIsrfqc3fCEx1izFMDS",
                "uri": "/a0/bank_accounts/BA6c0BIsrfqc3fCEx1izFMDS",
                "created_at": "2012-09-19T19:25:39Z",
                "debits_uri": "/a0/bank_accounts/BAN6c0BIsrfqc3fCEx1izFMDS/debits",
                "credits_uri": "/a0/bank_accounts/BAN6c0BIsrfqc3fCEx1izFMDS/credits",
                "name": "Kurt Gödel",
                "account_number": "xxxxxx8361",
                "routing_number": "121042882",
                "type": "savings"
            },
        },
        {
            "id": "CRtjdsSJg0fFN26PACLLVHz",
            "uri": "/a0/credits/CRtjdsSJg0fFN26PACLLVHz",
            "created_at": "2012-09-13T21:25:24Z",
            "amount": 1716,
            "state": "cleared",
            "fee": 25,
            "bank_account": {
                "created_at": "2012-09-13T21:25:24Z",
                "name": "Gottfried Leibniz",
                "account_number": "xxxxxx2930",
                "routing_number": "121042882",
                "type": "checking"
            }
        }
    ]
}
```


## List All Credits for a Bank Account

    GET /a0/bank_accounts/:bank_account_id/credits

### Response

#### Header

    Status: 200 OK

#### Body

```javascript
{
    "items": [
        {
            "id": "CRDXQO7z00n19KXU5IE2oX0",
            "uri": "/a0/credits/CRDXQO7z00n19KXU5IE2oX0",
            "created_at": "2012-09-19T19:50:23Z",
            "amount": 221970,
            "state": "pending",
            "fee": 0,
            "bank_account": {
                "id": "BAN6c0BIsrfqc3fCEx1izFMDS",
                "uri": "/a0/bank_accounts/BA6c0BIsrfqc3fCEx1izFMDS",
                "created_at": "2012-09-19T19:25:39Z",
                "debits_uri": "/a0/bank_accounts/BAN6c0BIsrfqc3fCEx1izFMDS/debits",
                "credits_uri": "/a0/bank_accounts/BAN6c0BIsrfqc3fCEx1izFMDS/credits",
                "name": "Kurt Gödel",
                "account_number": "xxxxxx8361",
                "routing_number": "121042882",
                "type": "savings"
            },
        },
        {
            "id": "CRDS8umCBvijMRKxENF1Ygy",
            "uri": "/a0/credits/CRDS8umCBvijMRKxENF1Ygy"
            "created_at": "2012-09-19T19:25:39Z",
            "amount": 4281906
            "state": "rejected",
            "fee": 350,
            "bank_account": {
                "id": "BAN6c0BIsrfqc3fCEx1izFMDS",
                "uri": "/a0/bank_accounts/BA6c0BIsrfqc3fCEx1izFMDS",
                "created_at": "2012-09-19T19:25:39Z",
                "debits_uri": "/a0/bank_accounts/BAN6c0BIsrfqc3fCEx1izFMDS/debits",
                "credits_uri": "/a0/bank_accounts/BAN6c0BIsrfqc3fCEx1izFMDS/credits",
                "name": "Kurt Gödel",
                "account_number": "xxxxxx8361",
                "routing_number": "121042882",
                "type": "savings"
            },
        }
    ]
}```