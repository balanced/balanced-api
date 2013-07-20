{
    "name": "ReversalView", 
    "properties": {
        "description": {
            "required": true, 
            "type": "string", 
            "description": "Free-text description of the reversal."
        }, 
        "created_at": {
            "required": true, 
            "type": "string", 
            "description": "`ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this\nreversal was issued."
        }, 
        "transaction_number": {
            "required": true, 
            "type": "string", 
            "description": "An identifier for this reversal."
        }, 
        "events_uri": {
            "required": true, 
            "type": "string", 
            "description": "Events associated with the reversal."
        }, 
        "uri": {
            "required": true, 
            "type": "string", 
            "description": null
        }, 
        "amount": {
            "required": true, 
            "type": "integer", 
            "description": "The amount of the reversal."
        }, 
        "meta": {
            "required": true, 
            "type": "object", 
            "description": "Key-Value mapping."
        }, 
        "appears_on_statement_as": {
            "required": true, 
            "type": "string", 
            "description": "Text that will appear on the statement describing this reversal."
        }
    }
}
