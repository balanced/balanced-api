{
    "name": "CreditView", 
    "properties": {
        "status": {
            "required": true, 
            "type": "string", 
            "description": "One of ``pending``, ``paid``, ``failed``."
        }, 
        "description": {
            "required": true, 
            "type": "string", 
            "description": null
        }, 
        "created_at": {
            "required": true, 
            "type": "string", 
            "description": null
        }, 
        "uri": {
            "required": true, 
            "type": "string", 
            "description": null
        }, 
        "customer_email_address": {
            "required": true, 
            "type": "object", 
            "description": null
        }, 
        "amount": {
            "required": true, 
            "type": "integer", 
            "description": "Amount of the credit."
        }, 
        "meta": {
            "required": true, 
            "type": "object", 
            "description": "A single-level dictionary of string-type key/value pairs."
        }, 
        "appears_on_statement_as": {
            "required": true, 
            "type": "string", 
            "description": "The text that will appear on the merchant's bank statement."
        }, 
        "customer_name": {
            "required": true, 
            "type": "object", 
            "description": null
        }
    }
}
