# Resources

## Marketplace

### Example

    {
        "id": "MP3fcTyo4hrVp44bCjRmxtpQ",
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

### Fields

`id`
: **string**

`reserve`
: **integer**
: greater than or equal to zero

`balance`
: **ineger**

`api_key`
: **string**
: keep this secret!!!

`bank_account`
: **object**
: [Bank Account](./resources.md#bank-account)


## Bank Account

### Example

    {
        "id": "BANm9b8BcoOjcF5i1p4eV9I",
        "account_number": "xxxxxx2930",
        "routing_number": "121042882",
        "type": "checking"
    }

### Fields

`id`
: **string**

`account_number`
: **string**

`routing_number`
: **string**

`type`
: **string**
: `checking` or `savings`


## ACH Debit

### Example

    {
        "id": "ADtjdsSJg0fFN26PACLLVHz",
        "amount": 1716,
        "status": "pending",
        "bank_account": {
            "id": "BANm9b8BcoOjcF5i1p4eV9I",
            "account_number": "xxxxxx2930",
            "routing_number": "121042882",
            "type": "checking"
        }
    }

### Fields

`id`
: **string**

`amount`
: **integer**
: greater than zero

`status`
: **string**
: `pending`, `cleared` or `rejected`

`bank_account`
: **object**
: [Bank Account](./resources.md#bank-account)


## ACH Credit

### Example

    {
        "id": "ACtjdsSJg0fFN26PACLLVHz",
        "amount": 1716,
        "status": "pending",
        "bank_account": {
            "id": "BANm9b8BcoOjcF5i1p4eV9I",
            "account_number": "xxxxxx2930",
            "routing_number": "121042882",
            "type": "checking"
        }
    }

### Fields

`id`
: **string**

`amount`
: **integer**
: greater than zero

`status`
: **string**
: `pending`, `cleared` or `rejected`

`bank_account`
: **object**
: [Bank Account](./resources.md#bank-account)