// Auto-generated. Do not edit!

// (in-package xpp_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class TerrainInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.surface_normals = null;
      this.friction_coeff = null;
    }
    else {
      if (initObj.hasOwnProperty('surface_normals')) {
        this.surface_normals = initObj.surface_normals
      }
      else {
        this.surface_normals = [];
      }
      if (initObj.hasOwnProperty('friction_coeff')) {
        this.friction_coeff = initObj.friction_coeff
      }
      else {
        this.friction_coeff = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TerrainInfo
    // Serialize message field [surface_normals]
    // Serialize the length for message field [surface_normals]
    bufferOffset = _serializer.uint32(obj.surface_normals.length, buffer, bufferOffset);
    obj.surface_normals.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Vector3.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [friction_coeff]
    bufferOffset = _serializer.float64(obj.friction_coeff, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TerrainInfo
    let len;
    let data = new TerrainInfo(null);
    // Deserialize message field [surface_normals]
    // Deserialize array length for message field [surface_normals]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.surface_normals = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.surface_normals[i] = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [friction_coeff]
    data.friction_coeff = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 24 * object.surface_normals.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'xpp_msgs/TerrainInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '58f8d0d19c0428c00252cd1c16c74dcf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Extending the robot state
    
    geometry_msgs/Vector3[] surface_normals      # at every endeffector, expressed in world
    float64                 friction_coeff       # friction coefficient
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TerrainInfo(null);
    if (msg.surface_normals !== undefined) {
      resolved.surface_normals = new Array(msg.surface_normals.length);
      for (let i = 0; i < resolved.surface_normals.length; ++i) {
        resolved.surface_normals[i] = geometry_msgs.msg.Vector3.Resolve(msg.surface_normals[i]);
      }
    }
    else {
      resolved.surface_normals = []
    }

    if (msg.friction_coeff !== undefined) {
      resolved.friction_coeff = msg.friction_coeff;
    }
    else {
      resolved.friction_coeff = 0.0
    }

    return resolved;
    }
};

module.exports = TerrainInfo;
