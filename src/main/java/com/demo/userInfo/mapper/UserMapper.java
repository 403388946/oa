package com.demo.userInfo.mapper;


import com.demo.userInfo.model.User;
import org.apache.ibatis.annotations.Param;

/**
 * Created by mahui on 15-11-23.
 */

public interface UserMapper {


     User getUserInfoById(@Param(value = "id") Long userId);
}
