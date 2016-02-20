// TODO test
// TODO deploy to the blockchain

contract PublicKeyRegistry {
    struct Entity {
        string name;
        string publicKey;
        address addr;
    }

  address private owner;
  mapping (string => Entity) private keys;
  mapping (string => bool) private registered;

  function PublicKeyRegistry() {
    owner = msg.sender;
  }

  // public functions

  function isSet(string name) returns (bool) {
    return registered[name] == true;
  }

  function updatePublicKey(string name, string key) returns (bool) {
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

  function registerPublicKey(string name, string key) returns (bool) {
    if (!isSet(name)) {
      // This name isn't taken. Create a new entity
      Entity memory e = Entity(name, key, msg.sender);
      keys[name] = e;
      registered[name] = true;
      return true;
    }

    return false;
  }

  function getPublicKey(string name) returns (string) {
    if (isSet(name)) {
      return keys[name].publicKey;
    }

    throw;
  }

  function getAddress(string name) returns (address) {
    if (isSet(name)) {
      return keys[name].addr;
    }

    throw;
  }

  // private functions

  // helper functions

  function kill() {
    if (msg.sender == owner) {
      suicide(owner);
    }
  }
}
