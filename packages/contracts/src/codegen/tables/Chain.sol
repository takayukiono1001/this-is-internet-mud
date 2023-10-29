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
  bytes32(abi.encodePacked(RESOURCE_TABLE, bytes14(""), bytes16("Chain")))
);
ResourceId constant ChainTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0000000300000000000000000000000000000000000000000000000000000000
);

struct ChainData {
  uint8[] landId;
  string chainName;
  string chainColor;
}

library Chain {
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
    _keySchema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_keySchema);
  }

  /**
   * @notice Get the table's value schema.
   * @return _valueSchema The value schema for the table.
   */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _valueSchema = new SchemaType[](3);
    _valueSchema[0] = SchemaType.UINT8_ARRAY;
    _valueSchema[1] = SchemaType.STRING;
    _valueSchema[2] = SchemaType.STRING;

    return SchemaLib.encode(_valueSchema);
  }

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "chainId";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](3);
    fieldNames[0] = "landId";
    fieldNames[1] = "chainName";
    fieldNames[2] = "chainColor";
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
   * @notice Get landId.
   */
  function getLandId(bytes32 chainId) internal view returns (uint8[] memory landId) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint8());
  }

  /**
   * @notice Get landId.
   */
  function _getLandId(bytes32 chainId) internal view returns (uint8[] memory landId) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint8());
  }

  /**
   * @notice Set landId.
   */
  function setLandId(bytes32 chainId, uint8[] memory landId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((landId)));
  }

  /**
   * @notice Set landId.
   */
  function _setLandId(bytes32 chainId, uint8[] memory landId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreCore.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((landId)));
  }

  /**
   * @notice Get the length of landId.
   */
  function lengthLandId(bytes32 chainId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get the length of landId.
   */
  function _lengthLandId(bytes32 chainId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get an item of landId.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemLandId(bytes32 chainId, uint256 _index) internal view returns (uint8) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 1, (_index + 1) * 1);
      return (uint8(bytes1(_blob)));
    }
  }

  /**
   * @notice Get an item of landId.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemLandId(bytes32 chainId, uint256 _index) internal view returns (uint8) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 1, (_index + 1) * 1);
      return (uint8(bytes1(_blob)));
    }
  }

  /**
   * @notice Push an element to landId.
   */
  function pushLandId(bytes32 chainId, uint8 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to landId.
   */
  function _pushLandId(bytes32 chainId, uint8 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Pop an element from landId.
   */
  function popLandId(bytes32 chainId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 0, 1);
  }

  /**
   * @notice Pop an element from landId.
   */
  function _popLandId(bytes32 chainId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 0, 1);
  }

  /**
   * @notice Update an element of landId at `_index`.
   */
  function updateLandId(bytes32 chainId, uint256 _index, uint8 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of landId at `_index`.
   */
  function _updateLandId(bytes32 chainId, uint256 _index, uint8 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get chainName.
   */
  function getChainName(bytes32 chainId) internal view returns (string memory chainName) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 1);
    return (string(_blob));
  }

  /**
   * @notice Get chainName.
   */
  function _getChainName(bytes32 chainId) internal view returns (string memory chainName) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 1);
    return (string(_blob));
  }

  /**
   * @notice Set chainName.
   */
  function setChainName(bytes32 chainId, string memory chainName) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 1, bytes((chainName)));
  }

  /**
   * @notice Set chainName.
   */
  function _setChainName(bytes32 chainId, string memory chainName) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreCore.setDynamicField(_tableId, _keyTuple, 1, bytes((chainName)));
  }

  /**
   * @notice Get the length of chainName.
   */
  function lengthChainName(bytes32 chainId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 1);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get the length of chainName.
   */
  function _lengthChainName(bytes32 chainId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 1);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get an item of chainName.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemChainName(bytes32 chainId, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 1, _index * 1, (_index + 1) * 1);
      return (string(_blob));
    }
  }

  /**
   * @notice Get an item of chainName.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemChainName(bytes32 chainId, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 1, _index * 1, (_index + 1) * 1);
      return (string(_blob));
    }
  }

  /**
   * @notice Push a slice to chainName.
   */
  function pushChainName(bytes32 chainId, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 1, bytes((_slice)));
  }

  /**
   * @notice Push a slice to chainName.
   */
  function _pushChainName(bytes32 chainId, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 1, bytes((_slice)));
  }

  /**
   * @notice Pop a slice from chainName.
   */
  function popChainName(bytes32 chainId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 1, 1);
  }

  /**
   * @notice Pop a slice from chainName.
   */
  function _popChainName(bytes32 chainId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 1, 1);
  }

  /**
   * @notice Update a slice of chainName at `_index`.
   */
  function updateChainName(bytes32 chainId, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    unchecked {
      bytes memory _encoded = bytes((_slice));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 1, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update a slice of chainName at `_index`.
   */
  function _updateChainName(bytes32 chainId, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    unchecked {
      bytes memory _encoded = bytes((_slice));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 1, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get chainColor.
   */
  function getChainColor(bytes32 chainId) internal view returns (string memory chainColor) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 2);
    return (string(_blob));
  }

  /**
   * @notice Get chainColor.
   */
  function _getChainColor(bytes32 chainId) internal view returns (string memory chainColor) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 2);
    return (string(_blob));
  }

  /**
   * @notice Set chainColor.
   */
  function setChainColor(bytes32 chainId, string memory chainColor) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 2, bytes((chainColor)));
  }

  /**
   * @notice Set chainColor.
   */
  function _setChainColor(bytes32 chainId, string memory chainColor) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreCore.setDynamicField(_tableId, _keyTuple, 2, bytes((chainColor)));
  }

  /**
   * @notice Get the length of chainColor.
   */
  function lengthChainColor(bytes32 chainId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 2);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get the length of chainColor.
   */
  function _lengthChainColor(bytes32 chainId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 2);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get an item of chainColor.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemChainColor(bytes32 chainId, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 2, _index * 1, (_index + 1) * 1);
      return (string(_blob));
    }
  }

  /**
   * @notice Get an item of chainColor.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemChainColor(bytes32 chainId, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 2, _index * 1, (_index + 1) * 1);
      return (string(_blob));
    }
  }

  /**
   * @notice Push a slice to chainColor.
   */
  function pushChainColor(bytes32 chainId, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 2, bytes((_slice)));
  }

  /**
   * @notice Push a slice to chainColor.
   */
  function _pushChainColor(bytes32 chainId, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 2, bytes((_slice)));
  }

  /**
   * @notice Pop a slice from chainColor.
   */
  function popChainColor(bytes32 chainId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 2, 1);
  }

  /**
   * @notice Pop a slice from chainColor.
   */
  function _popChainColor(bytes32 chainId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 2, 1);
  }

  /**
   * @notice Update a slice of chainColor at `_index`.
   */
  function updateChainColor(bytes32 chainId, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    unchecked {
      bytes memory _encoded = bytes((_slice));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 2, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update a slice of chainColor at `_index`.
   */
  function _updateChainColor(bytes32 chainId, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    unchecked {
      bytes memory _encoded = bytes((_slice));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 2, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get the full data.
   */
  function get(bytes32 chainId) internal view returns (ChainData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

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
  function _get(bytes32 chainId) internal view returns (ChainData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

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
  function set(bytes32 chainId, uint8[] memory landId, string memory chainName, string memory chainColor) internal {
    bytes memory _staticData;
    PackedCounter _encodedLengths = encodeLengths(landId, chainName, chainColor);
    bytes memory _dynamicData = encodeDynamic(landId, chainName, chainColor);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(bytes32 chainId, uint8[] memory landId, string memory chainName, string memory chainColor) internal {
    bytes memory _staticData;
    PackedCounter _encodedLengths = encodeLengths(landId, chainName, chainColor);
    bytes memory _dynamicData = encodeDynamic(landId, chainName, chainColor);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(bytes32 chainId, ChainData memory _table) internal {
    bytes memory _staticData;
    PackedCounter _encodedLengths = encodeLengths(_table.landId, _table.chainName, _table.chainColor);
    bytes memory _dynamicData = encodeDynamic(_table.landId, _table.chainName, _table.chainColor);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(bytes32 chainId, ChainData memory _table) internal {
    bytes memory _staticData;
    PackedCounter _encodedLengths = encodeLengths(_table.landId, _table.chainName, _table.chainColor);
    bytes memory _dynamicData = encodeDynamic(_table.landId, _table.chainName, _table.chainColor);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of dynamic data using the encoded lengths.
   */
  function decodeDynamic(
    PackedCounter _encodedLengths,
    bytes memory _blob
  ) internal pure returns (uint8[] memory landId, string memory chainName, string memory chainColor) {
    uint256 _start;
    uint256 _end;
    unchecked {
      _end = _encodedLengths.atIndex(0);
    }
    landId = (SliceLib.getSubslice(_blob, _start, _end).decodeArray_uint8());

    _start = _end;
    unchecked {
      _end += _encodedLengths.atIndex(1);
    }
    chainName = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));

    _start = _end;
    unchecked {
      _end += _encodedLengths.atIndex(2);
    }
    chainColor = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));
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
  ) internal pure returns (ChainData memory _table) {
    (_table.landId, _table.chainName, _table.chainColor) = decodeDynamic(_encodedLengths, _dynamicData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(bytes32 chainId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(bytes32 chainId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack dynamic data lengths using this table's schema.
   * @return _encodedLengths The lengths of the dynamic fields (packed into a single bytes32 value).
   */
  function encodeLengths(
    uint8[] memory landId,
    string memory chainName,
    string memory chainColor
  ) internal pure returns (PackedCounter _encodedLengths) {
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = PackedCounterLib.pack(landId.length * 1, bytes(chainName).length, bytes(chainColor).length);
    }
  }

  /**
   * @notice Tightly pack dynamic (variable length) data using this table's schema.
   * @return The dynamic data, encoded into a sequence of bytes.
   */
  function encodeDynamic(
    uint8[] memory landId,
    string memory chainName,
    string memory chainColor
  ) internal pure returns (bytes memory) {
    return abi.encodePacked(EncodeArray.encode((landId)), bytes((chainName)), bytes((chainColor)));
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dyanmic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    uint8[] memory landId,
    string memory chainName,
    string memory chainColor
  ) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData;
    PackedCounter _encodedLengths = encodeLengths(landId, chainName, chainColor);
    bytes memory _dynamicData = encodeDynamic(landId, chainName, chainColor);

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(bytes32 chainId) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = chainId;

    return _keyTuple;
  }
}
