// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout, FieldLayoutLib } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { RESOURCE_TABLE, RESOURCE_OFFCHAIN_TABLE } from "@latticexyz/store/src/storeResourceTypes.sol";

ResourceId constant _tableId = ResourceId.wrap(
  bytes32(abi.encodePacked(RESOURCE_TABLE, bytes14(""), bytes16("AddressInfo")))
);
ResourceId constant AddressInfoTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0000000200000000000000000000000000000000000000000000000000000000
);

struct AddressInfoData {
  string name;
  string description;
}

library AddressInfo {
  /**
   * @notice Get the table values' field layout.
   * @return _fieldLayout The field layout for the table.
   */
  function getFieldLayout() internal pure returns (FieldLayout) {
    return _fieldLayout;
  }

  /**
   * @notice Get the table's key schema.
   * @return _keySchema The key schema for the table.
   */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _keySchema = new SchemaType[](1);
    _keySchema[0] = SchemaType.ADDRESS;

    return SchemaLib.encode(_keySchema);
  }

  /**
   * @notice Get the table's value schema.
   * @return _valueSchema The value schema for the table.
   */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _valueSchema = new SchemaType[](2);
    _valueSchema[0] = SchemaType.STRING;
    _valueSchema[1] = SchemaType.STRING;

    return SchemaLib.encode(_valueSchema);
  }

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "address";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](2);
    fieldNames[0] = "name";
    fieldNames[1] = "description";
  }

  /**
   * @notice Register the table with its config.
   */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Register the table with its config.
   */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Get name.
   */
  function getName(address address) internal view returns (string memory name) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 0);
    return (string(_blob));
  }

  /**
   * @notice Get name.
   */
  function _getName(address address) internal view returns (string memory name) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 0);
    return (string(_blob));
  }

  /**
   * @notice Set name.
   */
  function setName(address address, string memory name) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 0, bytes((name)));
  }

  /**
   * @notice Set name.
   */
  function _setName(address address, string memory name) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    StoreCore.setDynamicField(_tableId, _keyTuple, 0, bytes((name)));
  }

  /**
   * @notice Get the length of name.
   */
  function lengthName(address address) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get the length of name.
   */
  function _lengthName(address address) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get an item of name.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemName(address address, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 1, (_index + 1) * 1);
      return (string(_blob));
    }
  }

  /**
   * @notice Get an item of name.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemName(address address, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 1, (_index + 1) * 1);
      return (string(_blob));
    }
  }

  /**
   * @notice Push a slice to name.
   */
  function pushName(address address, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 0, bytes((_slice)));
  }

  /**
   * @notice Push a slice to name.
   */
  function _pushName(address address, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 0, bytes((_slice)));
  }

  /**
   * @notice Pop a slice from name.
   */
  function popName(address address) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 0, 1);
  }

  /**
   * @notice Pop a slice from name.
   */
  function _popName(address address) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 0, 1);
  }

  /**
   * @notice Update a slice of name at `_index`.
   */
  function updateName(address address, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    unchecked {
      bytes memory _encoded = bytes((_slice));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update a slice of name at `_index`.
   */
  function _updateName(address address, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    unchecked {
      bytes memory _encoded = bytes((_slice));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get description.
   */
  function getDescription(address address) internal view returns (string memory description) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 1);
    return (string(_blob));
  }

  /**
   * @notice Get description.
   */
  function _getDescription(address address) internal view returns (string memory description) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 1);
    return (string(_blob));
  }

  /**
   * @notice Set description.
   */
  function setDescription(address address, string memory description) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 1, bytes((description)));
  }

  /**
   * @notice Set description.
   */
  function _setDescription(address address, string memory description) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    StoreCore.setDynamicField(_tableId, _keyTuple, 1, bytes((description)));
  }

  /**
   * @notice Get the length of description.
   */
  function lengthDescription(address address) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 1);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get the length of description.
   */
  function _lengthDescription(address address) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 1);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get an item of description.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemDescription(address address, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 1, _index * 1, (_index + 1) * 1);
      return (string(_blob));
    }
  }

  /**
   * @notice Get an item of description.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemDescription(address address, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 1, _index * 1, (_index + 1) * 1);
      return (string(_blob));
    }
  }

  /**
   * @notice Push a slice to description.
   */
  function pushDescription(address address, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 1, bytes((_slice)));
  }

  /**
   * @notice Push a slice to description.
   */
  function _pushDescription(address address, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 1, bytes((_slice)));
  }

  /**
   * @notice Pop a slice from description.
   */
  function popDescription(address address) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 1, 1);
  }

  /**
   * @notice Pop a slice from description.
   */
  function _popDescription(address address) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 1, 1);
  }

  /**
   * @notice Update a slice of description at `_index`.
   */
  function updateDescription(address address, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    unchecked {
      bytes memory _encoded = bytes((_slice));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 1, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update a slice of description at `_index`.
   */
  function _updateDescription(address address, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    unchecked {
      bytes memory _encoded = bytes((_slice));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 1, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get the full data.
   */
  function get(address address) internal view returns (AddressInfoData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreSwitch.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Get the full data.
   */
  function _get(address address) internal view returns (AddressInfoData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreCore.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function set(address address, string memory name, string memory description) internal {
    bytes memory _staticData;
    PackedCounter _encodedLengths = encodeLengths(name, description);
    bytes memory _dynamicData = encodeDynamic(name, description);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(address address, string memory name, string memory description) internal {
    bytes memory _staticData;
    PackedCounter _encodedLengths = encodeLengths(name, description);
    bytes memory _dynamicData = encodeDynamic(name, description);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(address address, AddressInfoData memory _table) internal {
    bytes memory _staticData;
    PackedCounter _encodedLengths = encodeLengths(_table.name, _table.description);
    bytes memory _dynamicData = encodeDynamic(_table.name, _table.description);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(address address, AddressInfoData memory _table) internal {
    bytes memory _staticData;
    PackedCounter _encodedLengths = encodeLengths(_table.name, _table.description);
    bytes memory _dynamicData = encodeDynamic(_table.name, _table.description);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of dynamic data using the encoded lengths.
   */
  function decodeDynamic(
    PackedCounter _encodedLengths,
    bytes memory _blob
  ) internal pure returns (string memory name, string memory description) {
    uint256 _start;
    uint256 _end;
    unchecked {
      _end = _encodedLengths.atIndex(0);
    }
    name = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));

    _start = _end;
    unchecked {
      _end += _encodedLengths.atIndex(1);
    }
    description = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));
  }

  /**
   * @notice Decode the tightly packed blobs using this table's field layout.
   *
   * @param _encodedLengths Encoded lengths of dynamic fields.
   * @param _dynamicData Tightly packed dynamic fields.
   */
  function decode(
    bytes memory,
    PackedCounter _encodedLengths,
    bytes memory _dynamicData
  ) internal pure returns (AddressInfoData memory _table) {
    (_table.name, _table.description) = decodeDynamic(_encodedLengths, _dynamicData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(address address) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(address address) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack dynamic data lengths using this table's schema.
   * @return _encodedLengths The lengths of the dynamic fields (packed into a single bytes32 value).
   */
  function encodeLengths(
    string memory name,
    string memory description
  ) internal pure returns (PackedCounter _encodedLengths) {
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = PackedCounterLib.pack(bytes(name).length, bytes(description).length);
    }
  }

  /**
   * @notice Tightly pack dynamic (variable length) data using this table's schema.
   * @return The dynamic data, encoded into a sequence of bytes.
   */
  function encodeDynamic(string memory name, string memory description) internal pure returns (bytes memory) {
    return abi.encodePacked(bytes((name)), bytes((description)));
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dyanmic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    string memory name,
    string memory description
  ) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData;
    PackedCounter _encodedLengths = encodeLengths(name, description);
    bytes memory _dynamicData = encodeDynamic(name, description);

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(address address) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(address)));

    return _keyTuple;
  }
}
