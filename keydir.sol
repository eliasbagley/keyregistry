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

  function register(string name, string key) returns (bool) {
    if (keys[name] == 0) {
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
