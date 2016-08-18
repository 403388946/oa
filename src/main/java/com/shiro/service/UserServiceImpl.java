package com.shiro.service;


import com.shiro.Constants;
import com.shiro.mapper.UserMapper;
import com.shiro.model.User;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;


@Service(value = "userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private PasswordHelper passwordHelper;


    @Autowired
    private RoleService roleService;

    @Resource
    private Map<String, String> settings;

    /**
     * 创建用户
     * @param user
     */
    public User save(User user) {
        //加密密码
        if(user.getId() != null) {
            if(userMapper.updateByPrimaryKeySelective(user) > 0) {
                return userMapper.selectByPrimaryKey(user.getId());
            }
        } else {
            passwordHelper.encryptPassword(user);
            if(userMapper.insertSelective(user) > 0) {
                return userMapper.selectByPrimaryKey(user.getId());
            }
        }

        return null;
    }

    @Override
    public User updateUser(User user) {
        if(userMapper.updateByPrimaryKey(user) > 0) {
            return user;
        }
        return null;
    }

    @Override
    public int deleteUser(Long userId) {
        return userMapper.deleteByPrimaryKey(userId);
    }

    /**
     * 修改密码
     * @param userId
     * @param newPassword
     */
    public int savePassword(Long userId, String newPassword) {
        User user = userMapper.selectByPrimaryKey(userId);
        if(StringUtils.isNotBlank(newPassword)) {
            user.setPassword(newPassword);
        } else {
            user.setPassword(settings.get(Constants.NEW_PASSWORD));
        }
        passwordHelper.encryptPassword(user);
        return userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public User findOne(Long userId) {
        return userMapper.selectByPrimaryKey(userId);
    }

    @Override
    public List<User> findAll() {
        return userMapper.findUsers(null, 0, 0);
    }

    /**
     * 根据用户名查找用户
     * @param username
     * @return
     */
    public User findByUsername(String username) {
        return userMapper.findUserByName(username);
    }

    /**
     * 根据用户名查找其角色
     * @param username
     * @return
     */
    public Set<String> findRoles(String username) {
        User user = findByUsername(username);
        if(user == null) {
            return Collections.EMPTY_SET;
        }
        return roleService.findRoles(user.getRoleIdsList().toArray(new Long[0]));
    }

    /**
     * 根据用户名查找其权限
     * @param username
     * @return
     */
    public Set<String> findPermissions(String username) {
        User user = findByUsername(username);
        if(user == null) {
            return Collections.EMPTY_SET;
        }
        return roleService.findPermissions(user.getRoleIdsList().toArray(new Long[0]));
    }

}
