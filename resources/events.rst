Events
=======

.. _events:

You can configure events to be published via a ``POST`` to the endpoint of
your choice via callbacks. Once configured, events are accessible via the
events endpoint.

- `Retrieve an Event`_
- `List all Events`_

Fields
------

.. dcode:: view audit_event
   :exclude: callbacks callback_statuses

   - type
     All resources (accounts, holds, credits, etc) are evented. The format of
     the type field is ``resource.event_type`` where ``event_type`` is one of
     ``created``, ``updated``, ``deleted``, as well as some transaction
     specific event types ``succeeded``, ``failed``, and ``canceled``.

     .. dcode:: enum audit_event_type


Retrieve an Event
-----------------

.. dcode:: endpoint events.show
   :exclude-method: HEAD

.. dcode:: scenario events.show
   :section-include: response


List all Events
---------------

.. dcode:: endpoint events.index
   :exclude-method: HEAD

``limit``
    *optional* integer. Defaults to ``10``.

``offset``
    *optional* integer. Defaults to ``0``.

.. dcode:: scenario events.index
   :section-include: response
