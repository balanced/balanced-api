# Bank Account

## Retrieve a Bank Account

    GET /a0/bank_accounts/:bank_account_id

### Response

#### Header

    Status: 200 OK

#### Body

```javascript
{
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
```


# List All Bank Accounts

    GET /a0/bank_accounts

### Response

#### Header

    Status: 200 OK

#### Body

```javascript
{
    "items": [
        {
            "id": "BA6c4Me9Qe0LvK5523VHFulW",
            "uri": "/a0/bank_accounts/BA6c4Me9Qe0LvK5523VHFulW",
            "created_at": "2012-09-19T19:50:23Z",
            "debits_uri": "/a0/bank_accounts/BA6c4Me9Qe0LvK5523VHFulW/debits",
            "credits_uri": "/a0/bank_accounts/BA6c4Me9Qe0LvK5523VHFulW/credits",
            "name": "Bertrand Russell",
            "account_number": "xxxxxx3952",
            "routing_number": "322271627",
            "type": "checking"
        },
        {
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
        {
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
    ]
}
```


## Store a Bank Account

    POST /a0/bank_accounts

### Request

`name`
: _required_ **string**

`account_number`
: _required_ **string**

`routing_number`
: _required_ **string**

`type`
: _required_ **string**
: `checking` or `savings`

```javascript
{
    "name": "Gottfried Leibniz",
    "account_number": "3819372930",
    "routing_number": "121042882",
    "type": "checking"
}
```

### Response

#### Header

    Status: 201 Created

#### Body

```javascript
{
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
```


## Unstore a Bank Account

    DELETE /a0/bank_accounts/:bank_account_id

### Response

#### Header

    Status: 204 No Content