Docker EC2 Metadata Emulator
============================

This container runs in a docker-compose stack with the service name `169-254-169-254`.
Assuming your container is on the same Docker Network, you'll be able to do things like

    curl http://169-254-169-254/latest/meta-data/ami-id

Values are provided by text files in a webserver root. There are lots of problems with this, and many values are missing.

@todo: use a proper API framework or script to generate proper metadata

Usage
-----

  1. Add your container to `docker-compose.yaml`
  2. Add the necessary metadata under `meta`
  3. `docker-compose up --build`


Development
-----------

Build Docker container: `make build`

Run `dgoss` tests: `make test`

