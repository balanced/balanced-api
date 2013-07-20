{
    "name": "HoldView", 
    "properties": {
        "description": {
            "required": true, 
            "type": "string", 
            "description": "A description of the hold, used for display purposes."
        }, 
        "created_at": {
            "required": true, 
            "type": "string", 
            "description": "`ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this\nhold was created."
        }, 
        "is_void": {
            "required": true, 
            "type": "boolean", 
            "description": "A boolean flag indicating if the hold has been voided or not."
        }, 
        "expires_at": {
            "required": true, 
            "type": "string", 
            "description": "`ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this\nhold was will expire and can **NO LONGER BE CAPTURED**."
        }, 
        "uri": {
            "required": true, 
            "type": "string", 
            "description": null
        }, 
        "transaction_number": {
            "required": true, 
            "type": "string", 
            "description": "An identifier for this transaction."
        }, 
        "amount": {
            "required": true, 
            "type": "integer", 
            "description": "Amount of the hold."
        }, 
        "meta": {
            "required": true, 
            "type": "object", 
            "description": "A single-level dictionary of string-type key/value pairs."
        }
    }
}
