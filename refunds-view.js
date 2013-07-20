{
    "name": "RefundView", 
    "properties": {
        "description": {
            "required": true, 
            "type": "string", 
            "description": "Free-text description of the refund."
        }, 
        "created_at": {
            "required": true, 
            "type": "string", 
            "description": "`ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this\nrefund was issued."
        }, 
        "transaction_number": {
            "required": true, 
            "type": "string", 
            "description": "An identifier for this transaction."
        }, 
        "customer_email_address": {
            "required": true, 
            "type": "object", 
            "description": null
        }, 
        "uri": {
            "required": true, 
            "type": "string", 
            "description": null
        }, 
        "amount": {
            "required": true, 
            "type": "integer", 
            "description": "The amount of the refund."
        }, 
        "meta": {
            "required": true, 
            "type": "object", 
            "description": "A single-level dictionary of string-type key/value pairs."
        }, 
        "appears_on_statement_as": {
            "required": true, 
            "type": "string", 
            "description": "Text that will appear on the statement describing this refund."
        }, 
        "customer_name": {
            "required": true, 
            "type": "object", 
            "description": null
        }
    }
}
