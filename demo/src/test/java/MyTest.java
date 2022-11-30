import com.ascent.dao.UserMapper;
import com.ascent.pojo.User;
import com.ascent.utils.MybatisUtils;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

/**
 * @ClassName MyTest
 * @Author Levin
 * @Date 2022/11/8 15:44
 * @Version 1.0
 **/
public class MyTest {

    @Test
    public void testSelectUser() {
        SqlSession session = MybatisUtils.getSession();

        try {
            UserMapper userMapper = session.getMapper(UserMapper.class);
            User user = userMapper.selectUserByUsername("ljf", "123456");
            System.out.println(user);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();

        }
    }

    @Test
    public void testInsertUser() {
        SqlSession session = MybatisUtils.getSession();

        try {
            User user = new User("小明", "123456");
            UserMapper userMapper = session.getMapper(UserMapper.class);
            int res = userMapper.addUser(user);
            System.out.println(res);
            // 提交事务
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();

        }
    }
}
