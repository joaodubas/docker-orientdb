# OrientDB image

Base image that exposes an [`orientdb`][orientdb] instance, in ports `2424` and
`2480`, using the default root password _0r13ntDB_.

## Running

To execute the image:

```bash
docker run -d --name orientdb joaodubas/orientdb:latest
```

It's also possible to redirect `orientdb` ports:

```bash
docker run -d --name orientdb -p 2424:2424 -p 2480:2480 joaodubas/orientdb:latest
```

To use another root password, redefine the environment variable
`ORIENTDB_ROOT_PASSWORD`:

```bash
docker run -d --name orientdb -e ORIENTDB_ROOT_PASSWORD=mysecurepassword joaodubas/orientdb:latest
```


## LICENSE

Copyright (c) 2014 Joao Paulo Dubas <joao.dubas@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

[orientdb]: http://www.orientechnologies.com/orientdb/
