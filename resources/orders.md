the goal here is to create an order resource to:

1. link funds debited into the system (aka escrowed) with the customers that will recieve those funds.
2. handle marketplace fees

an order should represent the high level payment or order in your system (e.g. a purchase, a crowd funding campaign, a shopping card, etc). interaction might look like this:

1. create the order:

    ```python
    order = Order(description, meta)
    ```

2. debit customers:

    ```python
    order.debit(buyer1, amount1, fee, seller1)
    order.debit(buyer2, amount2, fee, seller1)
    order.debit(buyer3, amount3, fee, seller2)
    ```

3. release debited funds:

    ```python
    order.debits[0].release() # this will also collect fees
    order.debits[1].release()
    order.release()           # this will release all unreleased debits to sellers
    ```

4. refund debited customers if you need to:

    ```python
    order.debits[0].refund([amount])
    ```

so there is 1 new resource:

order
=====

`GET /v1/orders/:order_id`

```json
{
    "id": "OR1234567890",
    "description": "my order!",
    "meta": {
        "tag": "a tag"
    },
    "debits_uri": "/v1/orders/OR1234567890/debits",
    "amount_escrowed": 500,
    "amount_released": 200,
    "fee_escrowed": 50,
    "fee_released": 100,
}
```

fields
------

`description`
**string**

`meta`
**object**

`debits_uri`
**string**: Link to all debits.

`amount_escrowed`
**integer**: Amount debited to be released to customers.

`amount_released`
**integer**: Amount debited and released to customers.

`fee_escrowed`
**integer**: Fees in escrowed to be released to the marketplace.

`fee_released`
**integer**: Fees released to the marketplace.

