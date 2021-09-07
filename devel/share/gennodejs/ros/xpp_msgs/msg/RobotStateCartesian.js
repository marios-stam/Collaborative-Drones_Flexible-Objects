// Auto-generated. Do not edit!

// (in-package xpp_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let State6d = require('./State6d.js');
let StateLin3d = require('./StateLin3d.js');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class RobotStateCartesian {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.time_from_start = null;
      this.base = null;
      this.ee_motion = null;
      this.ee_forces = null;
      this.ee_contact = null;
    }
    else {
      if (initObj.hasOwnProperty('time_from_start')) {
        this.time_from_start = initObj.time_from_start
      }
      else {
        this.time_from_start = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('base')) {
        this.base = initObj.base
      }
      else {
        this.base = new State6d();
      }
      if (initObj.hasOwnProperty('ee_motion')) {
        this.ee_motion = initObj.ee_motion
      }
      else {
        this.ee_motion = [];
      }
      if (initObj.hasOwnProperty('ee_forces')) {
        this.ee_forces = initObj.ee_forces
      }
      else {
        this.ee_forces = [];
      }
      if (initObj.hasOwnProperty('ee_contact')) {
        this.ee_contact = initObj.ee_contact
      }
      else {
        this.ee_contact = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotStateCartesian
    // Serialize message field [time_from_start]
    bufferOffset = _serializer.duration(obj.time_from_start, buffer, bufferOffset);
    // Serialize message field [base]
    bufferOffset = State6d.serialize(obj.base, buffer, bufferOffset);
    // Serialize message field [ee_motion]
    // Serialize the length for message field [ee_motion]
    bufferOffset = _serializer.uint32(obj.ee_motion.length, buffer, bufferOffset);
    obj.ee_motion.forEach((val) => {
      bufferOffset = StateLin3d.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [ee_forces]
    // Serialize the length for message field [ee_forces]
    bufferOffset = _serializer.uint32(obj.ee_forces.length, buffer, bufferOffset);
    obj.ee_forces.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Vector3.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [ee_contact]
    bufferOffset = _arraySerializer.bool(obj.ee_contact, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotStateCartesian
    let len;
    let data = new RobotStateCartesian(null);
    // Deserialize message field [time_from_start]
    data.time_from_start = _deserializer.duration(buffer, bufferOffset);
    // Deserialize message field [base]
    data.base = State6d.deserialize(buffer, bufferOffset);
    // Deserialize message field [ee_motion]
    // Deserialize array length for message field [ee_motion]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.ee_motion = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.ee_motion[i] = StateLin3d.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [ee_forces]
    // Deserialize array length for message field [ee_forces]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.ee_forces = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.ee_forces[i] = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [ee_contact]
    data.ee_contact = _arrayDeserializer.bool(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 72 * object.ee_motion.length;
    length += 24 * object.ee_forces.length;
    length += object.ee_contact.length;
    return length + 172;
  }

  static datatype() {
    // Returns string type for a message object
    return 'xpp_msgs/RobotStateCartesian';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '25955243f6c682a57bfe4fb411b854bb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # The state of a robot expressed in the Cartesian frame
    
    duration                time_from_start   # global time along trajectory
    
    # Position, velocity and acceleration of the base expressed in world frame
    # The orientation quaternion maps base to world frame.
    State6d                 base              # base pos/vel/acc in world
    
    StateLin3d[]            ee_motion         # endeffector pos/vel/acc in world
    geometry_msgs/Vector3[] ee_forces         # endeffector forces expressed in world
    bool[]                  ee_contact        # True if the foot is touching the environment
    
    
    
    
    ================================================================================
    MSG: xpp_msgs/State6d
    # The state of the 6D base of a system
    
    geometry_msgs/Pose     pose         # The 6D linear and angular position, orientation maps base to world
    geometry_msgs/Twist    twist        # The 6D linear and angular velocity 
    geometry_msgs/Accel    accel        # The 6D linear and angular acceleration
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    ================================================================================
    MSG: geometry_msgs/Twist
    # This expresses velocity in free space broken into its linear and angular parts.
    Vector3  linear
    Vector3  angular
    
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
    ================================================================================
    MSG: geometry_msgs/Accel
    # This expresses acceleration in free space broken into its linear and angular parts.
    Vector3  linear
    Vector3  angular
    
    ================================================================================
    MSG: xpp_msgs/StateLin3d
    # This contains the 3D representation of a linear state, including:
    # position, velocity, acceleration
    
    geometry_msgs/Point pos
    geometry_msgs/Vector3 vel
    geometry_msgs/Vector3 acc
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotStateCartesian(null);
    if (msg.time_from_start !== undefined) {
      resolved.time_from_start = msg.time_from_start;
    }
    else {
      resolved.time_from_start = {secs: 0, nsecs: 0}
    }

    if (msg.base !== undefined) {
      resolved.base = State6d.Resolve(msg.base)
    }
    else {
      resolved.base = new State6d()
    }

    if (msg.ee_motion !== undefined) {
      resolved.ee_motion = new Array(msg.ee_motion.length);
      for (let i = 0; i < resolved.ee_motion.length; ++i) {
        resolved.ee_motion[i] = StateLin3d.Resolve(msg.ee_motion[i]);
      }
    }
    else {
      resolved.ee_motion = []
    }

    if (msg.ee_forces !== undefined) {
      resolved.ee_forces = new Array(msg.ee_forces.length);
      for (let i = 0; i < resolved.ee_forces.length; ++i) {
        resolved.ee_forces[i] = geometry_msgs.msg.Vector3.Resolve(msg.ee_forces[i]);
      }
    }
    else {
      resolved.ee_forces = []
    }

    if (msg.ee_contact !== undefined) {
      resolved.ee_contact = msg.ee_contact;
    }
    else {
      resolved.ee_contact = []
    }

    return resolved;
    }
};

module.exports = RobotStateCartesian;
