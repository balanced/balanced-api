{
    "name": "DebitView", 
    "properties": {
        "status": {
            "required": true, 
            "type": "string", 
            "description": "One of ``pending``, ``charged``, ``failed``."
        }, 
        "description": {
            "required": true, 
            "type": "string", 
            "description": "Free-text description of the debit."
        }, 
        "created_at": {
            "required": true, 
            "type": "string", 
            "description": "`ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this\ndebit was created."
        }, 
        "transaction_number": {
            "required": true, 
            "type": "string", 
            "description": "An identifier for this transaction."
        }, 
        "customer_email_address": {
            "required": true, 
            "type": "string", 
            "description": null
        }, 
        "uri": {
            "required": true, 
            "type": "string", 
            "description": "The URI of the debit."
        }, 
        "refunds_uri": {
            "required": true, 
            "type": "string", 
            "description": "URI for any partial or complete refunds of this debit."
        }, 
        "amount": {
            "required": true, 
            "type": "integer", 
            "description": "The amount of the debit."
        }, 
        "meta": {
            "required": true, 
            "type": "object", 
            "description": "A single-level dictionary of string-type key/value pairs."
        }, 
        "appears_on_statement_as": {
            "required": true, 
            "type": "string", 
            "description": "The text that will appear on the buyer's statement."
        }, 
        "available_at": {
            "required": true, 
            "type": "string", 
            "description": "`ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this\ntransaction is guaranteed to clear."
        }
    }
}
