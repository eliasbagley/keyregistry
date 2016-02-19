struct Entity {
  string name;
  string publicKey;
  address addr:
}

contract KeyDirectory {
  address owner;
  mapping (string => Entity) keys;

  function KeyDirectory() {
    owner = msg.sender;
  }

  // public

  function isSet(string name) returns (bool) {
    return key[name] != 0;
  }

  function update(string name, string key) returns (bool) {
    if (isSet(name)) {
      Entity e = keys[name];

      // If the addresses match, update the entity
      if (msg.sender == e.addr) {
        e.publicKey = key;
        e.name = name;
        return true;
      }
    }

    return false;
  }

  function register(string name, string key) returns (bool) {
    } else {
      // This name isn't taken. Create a new entity
      Entity e = Entity(name, key, msg.sender);
      keys[name] = e;
      return true;
    }

    return false;
  }

  function getPublicKey(string name) returns (string) {
    if (isSet(name)) {
      return keys[name].publicKey;
    }

    return 0; //or throw?
  }

  function getAddress(string name) returns (address) {
    if (isSet(name)) {
      return keys[name].addr;
    }

    return 0;
  }

  //private

  // helper

  function kill() {
    if (msg.sender == owner) {
      suicide(owner);
    }
  }
}
