# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from xpp_msgs/RobotParameters.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import geometry_msgs.msg

class RobotParameters(genpy.Message):
  _md5sum = "93bb9137a8bf2b168102f89fd6a86853"
  _type = "xpp_msgs/RobotParameters"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """# Parameters used to generate this optimization/trajectory
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
float64 z"""
  __slots__ = ['ee_names','nominal_ee_pos','ee_max_dev','base_mass']
  _slot_types = ['string[]','geometry_msgs/Point[]','geometry_msgs/Vector3','float64']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       ee_names,nominal_ee_pos,ee_max_dev,base_mass

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(RobotParameters, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.ee_names is None:
        self.ee_names = []
      if self.nominal_ee_pos is None:
        self.nominal_ee_pos = []
      if self.ee_max_dev is None:
        self.ee_max_dev = geometry_msgs.msg.Vector3()
      if self.base_mass is None:
        self.base_mass = 0.
    else:
      self.ee_names = []
      self.nominal_ee_pos = []
      self.ee_max_dev = geometry_msgs.msg.Vector3()
      self.base_mass = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      length = len(self.ee_names)
      buff.write(_struct_I.pack(length))
      for val1 in self.ee_names:
        length = len(val1)
        if python3 or type(val1) == unicode:
          val1 = val1.encode('utf-8')
          length = len(val1)
        buff.write(struct.Struct('<I%ss'%length).pack(length, val1))
      length = len(self.nominal_ee_pos)
      buff.write(_struct_I.pack(length))
      for val1 in self.nominal_ee_pos:
        _x = val1
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
      _x = self
      buff.write(_get_struct_4d().pack(_x.ee_max_dev.x, _x.ee_max_dev.y, _x.ee_max_dev.z, _x.base_mass))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.nominal_ee_pos is None:
        self.nominal_ee_pos = None
      if self.ee_max_dev is None:
        self.ee_max_dev = geometry_msgs.msg.Vector3()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.ee_names = []
      for i in range(0, length):
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1 = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1 = str[start:end]
        self.ee_names.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.nominal_ee_pos = []
      for i in range(0, length):
        val1 = geometry_msgs.msg.Point()
        _x = val1
        start = end
        end += 24
        (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
        self.nominal_ee_pos.append(val1)
      _x = self
      start = end
      end += 32
      (_x.ee_max_dev.x, _x.ee_max_dev.y, _x.ee_max_dev.z, _x.base_mass,) = _get_struct_4d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      length = len(self.ee_names)
      buff.write(_struct_I.pack(length))
      for val1 in self.ee_names:
        length = len(val1)
        if python3 or type(val1) == unicode:
          val1 = val1.encode('utf-8')
          length = len(val1)
        buff.write(struct.Struct('<I%ss'%length).pack(length, val1))
      length = len(self.nominal_ee_pos)
      buff.write(_struct_I.pack(length))
      for val1 in self.nominal_ee_pos:
        _x = val1
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
      _x = self
      buff.write(_get_struct_4d().pack(_x.ee_max_dev.x, _x.ee_max_dev.y, _x.ee_max_dev.z, _x.base_mass))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.nominal_ee_pos is None:
        self.nominal_ee_pos = None
      if self.ee_max_dev is None:
        self.ee_max_dev = geometry_msgs.msg.Vector3()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.ee_names = []
      for i in range(0, length):
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1 = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1 = str[start:end]
        self.ee_names.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.nominal_ee_pos = []
      for i in range(0, length):
        val1 = geometry_msgs.msg.Point()
        _x = val1
        start = end
        end += 24
        (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
        self.nominal_ee_pos.append(val1)
      _x = self
      start = end
      end += 32
      (_x.ee_max_dev.x, _x.ee_max_dev.y, _x.ee_max_dev.z, _x.base_mass,) = _get_struct_4d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3d = None
def _get_struct_3d():
    global _struct_3d
    if _struct_3d is None:
        _struct_3d = struct.Struct("<3d")
    return _struct_3d
_struct_4d = None
def _get_struct_4d():
    global _struct_4d
    if _struct_4d is None:
        _struct_4d = struct.Struct("<4d")
    return _struct_4d