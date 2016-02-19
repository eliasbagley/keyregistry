Blockchain address: `TODO`

## Key Registry

Key Registry is a Ethereum contract which allows for registering a unique name with a encryption public key.

## Interface

```
function isSet(string name) returns (bool) // returns whether or not this name has already been registered
function registerPublicKey(string name, string key) returns (bool) // returns wheter or not the operation is successful
function updatePublicKey(string name, string key) returns (bool) // only the owner of a key can update it
function getPublicKey(string name) returns (string) // returns 0 if unset
function getAddress(string name) returns (address) // returns 0 if unset
```

## LICENSE

```
The MIT License

Copyright (c) Elias Bagley

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
```


