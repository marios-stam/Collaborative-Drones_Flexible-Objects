// Generated by gencpp from file thesis_drone/drone_pose.msg
// DO NOT EDIT!


#ifndef THESIS_DRONE_MESSAGE_DRONE_POSE_H
#define THESIS_DRONE_MESSAGE_DRONE_POSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace thesis_drone
{
template <class ContainerAllocator>
struct drone_pose_
{
  typedef drone_pose_<ContainerAllocator> Type;

  drone_pose_()
    : x(0.0)  {
    }
  drone_pose_(const ContainerAllocator& _alloc)
    : x(0.0)  {
  (void)_alloc;
    }



   typedef float _x_type;
  _x_type x;





  typedef boost::shared_ptr< ::thesis_drone::drone_pose_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::thesis_drone::drone_pose_<ContainerAllocator> const> ConstPtr;

}; // struct drone_pose_

typedef ::thesis_drone::drone_pose_<std::allocator<void> > drone_pose;

typedef boost::shared_ptr< ::thesis_drone::drone_pose > drone_posePtr;
typedef boost::shared_ptr< ::thesis_drone::drone_pose const> drone_poseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::thesis_drone::drone_pose_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::thesis_drone::drone_pose_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::thesis_drone::drone_pose_<ContainerAllocator1> & lhs, const ::thesis_drone::drone_pose_<ContainerAllocator2> & rhs)
{
  return lhs.x == rhs.x;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::thesis_drone::drone_pose_<ContainerAllocator1> & lhs, const ::thesis_drone::drone_pose_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace thesis_drone

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::thesis_drone::drone_pose_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::thesis_drone::drone_pose_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::thesis_drone::drone_pose_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::thesis_drone::drone_pose_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::thesis_drone::drone_pose_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::thesis_drone::drone_pose_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::thesis_drone::drone_pose_<ContainerAllocator> >
{
  static const char* value()
  {
    return "abd5d1e9c3ac157a0df3ba27b65d3384";
  }

  static const char* value(const ::thesis_drone::drone_pose_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xabd5d1e9c3ac157aULL;
  static const uint64_t static_value2 = 0x0df3ba27b65d3384ULL;
};

template<class ContainerAllocator>
struct DataType< ::thesis_drone::drone_pose_<ContainerAllocator> >
{
  static const char* value()
  {
    return "thesis_drone/drone_pose";
  }

  static const char* value(const ::thesis_drone::drone_pose_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::thesis_drone::drone_pose_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 x\n"
;
  }

  static const char* value(const ::thesis_drone::drone_pose_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::thesis_drone::drone_pose_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct drone_pose_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::thesis_drone::drone_pose_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::thesis_drone::drone_pose_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<float>::stream(s, indent + "  ", v.x);
  }
};

} // namespace message_operations
} // namespace ros

#endif // THESIS_DRONE_MESSAGE_DRONE_POSE_H