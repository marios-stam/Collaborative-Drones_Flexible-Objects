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

class RobotParameters {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ee_names = null;
      this.nominal_ee_pos = null;
      this.ee_max_dev = null;
      this.base_mass = null;
    }
    else {
      if (initObj.hasOwnProperty('ee_names')) {
        this.ee_names = initObj.ee_names
      }
      else {
        this.ee_names = [];
      }
      if (initObj.hasOwnProperty('nominal_ee_pos')) {
        this.nominal_ee_pos = initObj.nominal_ee_pos
      }
      else {
        this.nominal_ee_pos = [];
      }
      if (initObj.hasOwnProperty('ee_max_dev')) {
        this.ee_max_dev = initObj.ee_max_dev
      }
      else {
        this.ee_max_dev = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('base_mass')) {
        this.base_mass = initObj.base_mass
      }
      else {
        this.base_mass = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotParameters
    // Serialize message field [ee_names]
    bufferOffset = _arraySerializer.string(obj.ee_names, buffer, bufferOffset, null);
    // Serialize message field [nominal_ee_pos]
    // Serialize the length for message field [nominal_ee_pos]
    bufferOffset = _serializer.uint32(obj.nominal_ee_pos.length, buffer, bufferOffset);
    obj.nominal_ee_pos.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [ee_max_dev]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.ee_max_dev, buffer, bufferOffset);
    // Serialize message field [base_mass]
    bufferOffset = _serializer.float64(obj.base_mass, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotParameters
    let len;
    let data = new RobotParameters(null);
    // Deserialize message field [ee_names]
    data.ee_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [nominal_ee_pos]
    // Deserialize array length for message field [nominal_ee_pos]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.nominal_ee_pos = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.nominal_ee_pos[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [ee_max_dev]
    data.ee_max_dev = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [base_mass]
    data.base_mass = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.ee_names.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    length += 24 * object.nominal_ee_pos.length;
    return length + 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'xpp_msgs/RobotParameters';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '93bb9137a8bf2b168102f89fd6a86853';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Parameters used to generate this optimization/trajectory
    # Should basically save class xpp::OptimizationParameters
    
    # endeffector names (order of endeffectors, e.g. LF, RF, LH, RH)
    string[] ee_names  
    
    geometry_msgs/Point[]   nominal_ee_pos    # nominal position of each endeffector
    geometry_msgs/Vector3   ee_max_dev        # the maximum distance the endeffector can deviate from the nominal position
    
    float64                 base_mass         # mass of the robot base (for plotting gravity force)             
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
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
    const resolved = new RobotParameters(null);
    if (msg.ee_names !== undefined) {
      resolved.ee_names = msg.ee_names;
    }
    else {
      resolved.ee_names = []
    }

    if (msg.nominal_ee_pos !== undefined) {
      resolved.nominal_ee_pos = new Array(msg.nominal_ee_pos.length);
      for (let i = 0; i < resolved.nominal_ee_pos.length; ++i) {
        resolved.nominal_ee_pos[i] = geometry_msgs.msg.Point.Resolve(msg.nominal_ee_pos[i]);
      }
    }
    else {
      resolved.nominal_ee_pos = []
    }

    if (msg.ee_max_dev !== undefined) {
      resolved.ee_max_dev = geometry_msgs.msg.Vector3.Resolve(msg.ee_max_dev)
    }
    else {
      resolved.ee_max_dev = new geometry_msgs.msg.Vector3()
    }

    if (msg.base_mass !== undefined) {
      resolved.base_mass = msg.base_mass;
    }
    else {
      resolved.base_mass = 0.0
    }

    return resolved;
    }
};

module.exports = RobotParameters;
