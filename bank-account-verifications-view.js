{
    "name": "BankAccountAuthenticationView", 
    "properties": {
        "attempts": {
            "required": true, 
            "type": "integer", 
            "description": null
        }, 
        "remaining_attempts": {
            "required": true, 
            "type": "integer", 
            "description": null
        }, 
        "id": {
            "required": true, 
            "type": "string", 
            "description": null
        }, 
        "uri": {
            "required": true, 
            "type": "string", 
            "description": null
        }, 
        "state": {
            "required": true, 
            "type": "string", 
            "description": "One of ``pending``, ``verified``, ``failed``."
        }
    }
}
